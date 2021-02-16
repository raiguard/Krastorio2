--- GUI structuring tools and event handling (beta).
-- This new GUI module makes use of a new feature in Factorio 1.1: GUI element tags. This significantly simplifies the
-- logic around event handling. Due to the backward-incompatible nature of the changes, this new module was created
-- instead of upgrading the old one. This module will replace the current non-beta module when Factorio 1.2 releases.
-- @module gui-beta
-- @alias flib_gui
-- @usage local gui = require("__flib__.gui-beta")
-- @see gui-beta.lua

local mod_name = script.mod_name
local gui_event_defines = {}

local event_id_to_string_mapping = {}
for name, id in pairs(defines.events) do
  if string.find(name, "^on_gui") then
    gui_event_defines[name] = id
    event_id_to_string_mapping[id] = string.gsub(name, "^on_gui", "on")
  end
end

local flib_gui = {}

-- `ACTIONS` FUNCTIONS

--- Provide a callback to be run for GUI events.
-- @tparam function callback
-- @see gui-beta.read_action
-- @usage
-- gui.hook_events(function(e)
--   local msg = gui.read_action(e)
--   if msg then
--     -- read the action to determine what to do
--   end
-- end)
function flib_gui.hook_events(callback)
  local on_event = script.on_event
  for _, id in pairs(gui_event_defines) do
    on_event(id, callback)
  end
end

--- Retrieve the action message from a GUI element's tags.
-- @tparam EventData event_data
-- @treturn any|nil The element's action for this GUI event.
-- @usage
-- event.on_gui_click(function(e)
--   local action = gui.read_action(e)
--   if action then
--     -- do stuff
--   end
-- end)
function flib_gui.read_action(event_data)
  local elem = event_data.element
  if not elem then return end

  local mod_tags = elem.tags[mod_name]
  if not mod_tags then return end

  local elem_actions = mod_tags.flib
  if not elem_actions then return end

  local event_name = event_id_to_string_mapping[event_data.name]
  local msg = elem_actions[event_name]

  return msg
end

-- BUILDING AND UPDATING FUNCTIONS

-- navigate a structure to build a GUI
local function recursive_build(parent, structure, refs)
  -- prepare tags
  local original_tags = structure.tags
  local tags = original_tags or {}
  local actions = structure.actions
  local tags_flib = tags.flib
  tags.flib = actions
  structure.tags = {
    [mod_name] = tags
  }

  -- local these for later
  local tabs = structure.tabs
  local children = structure.children

  -- make the game not convert these into a property tree for no reason
  structure.tabs = nil
  structure.children = nil
  structure.actions = nil

  -- create element
  local elem = parent.add(structure)

  -- restore structure
  structure.tags = original_tags
  structure.tabs = tabs
  structure.children = children
  structure.actions = actions
  tags.flib = tags_flib

  do
    local style_mods = structure.style_mods
    if style_mods then
      for k, v in pairs(style_mods) do
        elem.style[k] = v
      end
    end
  end

  do
    local elem_mods = structure.elem_mods
    if elem_mods then
      for k, v in pairs(elem_mods) do
        elem[k] = v
      end
    end
  end

  do
    local ref = structure.ref
    if ref then
      -- recursively create tables as needed
      local prev = refs
      local ref_length = #ref
      for i = 1, ref_length - 1 do
        local current_key = ref[i]
        local current = prev[current_key]
        if not current then
          current = {}
          prev[current_key] = current
        end
        prev = current
      end
      prev[ref[ref_length]] = elem
    end
  end

  if children then
    for i = 1, #children do
      recursive_build(elem, children[i], refs)
    end
  end

  if tabs then
    local add_tab = elem.add_tab
    for i = 1, #tabs do
      local tab_and_content = tabs[i]
      local tab = recursive_build(elem, tab_and_content.tab, refs)
      local content = recursive_build(elem, tab_and_content.content, refs)
      add_tab(tab, content)
    end
  end

  return elem
end

--- Build a GUI based on the given structure(s).
-- @tparam LuaGuiElement parent The parent GUI element where the new GUI will be located.
-- @tparam GuiBuildStructure[] structures The GUIs to build.
-- @treturn table @{LuaGuiElement} references and subtables, built based on the values of `ref` throughout the
-- @{GuiBuildStructure}.
function flib_gui.build(parent, structures)
  local refs = {}
  for i = 1, #structures do
    recursive_build(
      parent,
      structures[i],
      refs
    )
  end
  return refs
end

local function recursive_update(elem, updates)
  if updates.cb then
    updates.cb(elem)
  end

  if updates.style then
    elem.style = updates.style
  end

  if updates.style_mods then
    for key, value in pairs(updates.style_mods) do
      elem.style[key] = value
    end
  end

  if updates.elem_mods then
    for key, value in pairs(updates.elem_mods) do
      elem[key] = value
    end
  end

  -- TODO: tags, actions

  if updates.children then
    local elem_children = elem.children
    for i, child_updates in ipairs(updates.children) do
      if elem_children[i] then
        recursive_update(elem_children[i], child_updates)
      end
    end
  end

  if updates.tabs then
    local elem_tabs = elem.tabs
    for i, tab_and_content_updates in pairs(updates.tabs) do
      local elem_tab_and_content = elem_tabs[i]
      if elem_tab_and_content then
        local tab = elem_tab_and_content.tab
        local tab_updates = tab_and_content_updates.tab
        if tab and tab_updates then
          recursive_update(tab, tab_updates)
        end
        local content = elem_tab_and_content.content
        local content_updates = tab_and_content_updates.content
        if content and content_updates then
          recursive_update(content, content_updates)
        end
      end
    end
  end
end

--- Update an existing GUI based on a given structure.
-- @tparam LuaGuiElement elem The element to update.
-- @tparam GuiUpdateStructure updates The updates to perform.
function flib_gui.update(elem, updates)
  recursive_update(elem, updates)
end

-- TAGS FUNCTIONS

--- Retrieve a GUI element's tags.
-- These tags are automatically written to and read from a subtable keyed by mod name, preventing conflicts.
--
-- If no tags exist, this function will return an empty table.
-- @tparam LuaGuiElement elem
-- @treturn table
function flib_gui.get_tags(elem)
  return elem.tags[mod_name] or {}
end

--- Set (override) a GUI element's tags.
-- These tags are automatically written to and read from a subtable keyed by mod name, preventing conflicts.
-- @tparam LuaGuiElement elem
-- @tparam table tags
function flib_gui.set_tags(elem, tags)
  local elem_tags = elem.tags
  elem_tags[mod_name] = tags
  elem.tags = elem_tags
end

--- Delete a GUI element's tags.
-- These tags are automatically written to and read from a subtable keyed by mod name, preventing conflicts.
--
-- @tparam LuaGuiElement elem
function flib_gui.delete_tags(elem)
  local elem_tags = elem.tags
  elem_tags[mod_name] = nil
  elem.tags = elem_tags
end

--- Perform a shallow merge on a GUI element's tags.
-- These tags are automatically written to and read from a subtable keyed by mod name, preventing conflicts.
--
-- Only the top level will be updated. If deep updating is needed, use @{gui-beta.get_tags} and @{table.deep_merge},
-- then @{gui-beta.set_tags}.
--
-- @tparam LuaGuiElement elem
-- @tparam table updates
function flib_gui.update_tags(elem, updates)
  local elem_tags = elem.tags
  local existing = elem_tags[mod_name]

  if not existing then
    elem_tags[mod_name] = {}
    existing = elem_tags[mod_name]
  end

  for k, v in pairs(updates) do
    existing[k] = v
  end

  elem.tags = elem_tags
end

--- Concepts
-- @section

--- A series of nested tables used to build a GUI.
-- This is an extension of @{LuaGuiElement}, providing new features and options.
--
-- This inherits all required properties from its base @{LuaGuiElement}, i.e. if the `type` field is
-- `sprite-button`, the @{GuiBuildStructure} must contain all the fields that a `sprite-button` @{LuaGuiElement}
-- requires.
--
-- There are a number of new fields that can be applied to a @{GuiBuildStructure} depending on the type:
--
-- @tparam[opt] table style_mods A key -> value dictionary defining modifications to make to the element's style.
-- Available properties are listed in @{LuaStyle}.
-- @tparam[opt] table elem_mods A key -> value dictionary defining modifications to make to the element. Available
-- properties are listed in @{LuaGuiElement}.
-- @tparam[opt] GuiElementActions actions Actions to take on certain GUI events.
-- @tparam[opt] string[] ref A nested table path in which to place a reference to this @{LuaGuiElement} in the output of
-- @{gui-beta.build}.
-- @tparam[opt] GuiBuildStructure[] children @{GuiBuildStructure}s to add as children of this @{LuaGuiElement}.
-- @tparam[opt] TabAndContent[] tabs @{TabAndContent}s to add as tabs of this @{LuaGuiElement}.
-- @usage
-- gui.build(player.gui.screen, {
--   {
--     type = "frame",
--     direction = "vertical",
--     ref  =  {"window"},
--     actions = {
--       on_closed = {gui = "demo", action = "close"}
--     },
--     children = {
--       -- titlebar
--       {type = "flow", ref = {"titlebar", "flow"}, children = {
--         {type = "label", style = "frame_title", caption = "Menu", ignored_by_interaction = true},
--         {type = "empty-widget", style = "flib_titlebar_drag_handle", ignored_by_interaction = true},
--         {
--           type = "sprite-button",
--           style = "frame_action_button",
--           sprite = "utility/close_white",
--           hovered_sprite = "utility/close_black",
--           clicked_sprite = "utility/close_black",
--           ref = {"titlebar", "close_button"},
--           actions = {
--             on_click = {gui = "demo", action = "close"}
--           }
--         }
--       }},
--       {type = "frame", style = "inside_deep_frame_for_tabs", children = {
--         {type = "tabbed-pane", tabs = {
--           {
--             tab = {type = "tab", caption = "1"},
--             content = {type = "table", style = "slot_table", column_count = 10, ref = {"tables", 1}}
--           },
--           {
--             tab = {type = "tab", caption = "2"},
--             content = {type = "table", style = "slot_table", column_count = 10, ref = {"tables", 2}}
--           }
--         }}
--       }}
--     }
--   }
-- })
-- @Concept GuiBuildStructure

--- A series of nested tables used to update a GUI.
-- @tparam[opt] function cb A callback to run on this GUI element. The callback will be passed a @{LuaGuiElement} as its
-- first parameter.
-- @tparam[opt] string style The new style that the element should use.
-- @tparam[opt] table style_mods A key -> value dictionary defining modifications to make to the element's style.
-- Available properties are listed in @{LuaStyle}.
-- @tparam[opt] table elem_mods A key –> value dictionary defining modifications to make to the element. Available
-- properties are listed in LuaGuiElement.
-- @tparam[opt] GuiUpdateStructure[] children @{GuiUpdateStructure}s to apply to the children of this @{LuaGuiElement}.
-- @tparam[opt] TabAndContent[] tabs @{TabAndContent}s to apply to the tabs of this @{LuaGuiElement}.
-- @usage
-- gui.update(
--   my_frame,
--   {
--     elem_mods = {caption = "Hello there!"},
--     children = {
--       {children = {
--         tabs = {
--           {tab = {elem_mods = {badge_text = "69"}}, content = {...}},
--           {content = {...}}
--         }
--       }}
--     }
--   }
-- )
-- @Concept GuiUpdateStructure

--- A mapping of GUI event name -> action message.
-- Each key is a GUI event name (`on_gui_click`, `on_gui_elem_changed`, etc.) with the `_gui` part removed. For example,
-- `on_gui_click` will become `on_click`.
--
-- Each value is a custom set of data that @{gui-beta.read_action} will return when that GUI event is fired and passes
-- this GUI element. This data may be of any type, as long as it is truthy.
--
-- Actions are kept under a `flib` subtable in the element's mod-specific tags subtable, retrievable with
-- @{gui-beta.get_tags}. Because of this, there is no chance of accidental mod action overlaps, so feel free to use
-- generic actions such as "close" or "open".
--
-- A common format for a mod with multiple GUIs might be to give each GUI a name, and write the actions as shown below.
-- @usage
-- gui.build(player.gui.screen, {
--   {
--     type = "frame",
--     caption = "My frame",
--     actions = {
--       on_click = {gui = "my_gui", action = "handle_click"},
--       on_closed = {gui = "my_gui", action = "close"}
--     }
--   }
-- })
-- @Concept GuiElementActions

--- A table representing a tab <-> content pair.
-- When used in @{gui-beta.build}, both fields are required. When used in @{gui-beta.update}, both fields are optional.
-- @tfield GuiBuildStructure|GuiUpdateStructure tab Must be of type `tab`.
-- @tfield GuiBuildStructure|GuiUpdateStructure content
-- @Concept TabAndContent

-- @endsection

return flib_gui
