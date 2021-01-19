--- GUI structuring tools and event handling (beta).
-- This new GUI module makes use of a new feature in Factorio 1.1: GUI element tags. This significantly simplifies the
-- logic around event handling. Due to the backward-incompatible nature of the changes, this new module was created
-- instead of upgrading the old one. This module will replace the current non-beta module when Factorio 1.2 releases.
-- @module gui-beta
-- @alias flib_gui
-- @usage local gui = require("__flib__.gui-beta")
-- @see gui-beta.lua

-- edited from original source to require K2 file instead of flib file
local reverse_defines = require("__Krastorio2__/lib/private/control-scripts/control-lib/flib/reverse-defines.lua")

local flib_gui = {}

-- `ACTIONS` FUNCTIONS

--- Provide a callback to be run for GUI events.
-- @tparam function func
-- @see gui-beta.read_action
-- @usage
-- gui.hook_events(function(e)
--   local msg = gui.read_action(e)
--   if msg then
--     -- read the action to determine what to do
--   end
-- end)
function flib_gui.hook_events(func)
  for name, id in pairs(defines.events) do
    if string.find(name, "gui") then
      script.on_event(id, func)
    end
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

  local mod_tags = elem.tags[script.mod_name]
  if not mod_tags then return end

  local elem_actions = mod_tags.flib
  if not elem_actions then return end

  local event_name = string.gsub(reverse_defines.events[event_data.name] or "", "_gui", "")
  local msg = elem_actions[event_name]

  return msg
end

-- BUILDING AND UPDATING FUNCTIONS

-- navigate a structure to build a GUI
local function recursive_build(parent, structure, refs)
  -- create element
  local elem = parent.add(structure)
  -- reset tags so they can be added back in later with a subtable
  elem.tags = {}

  if structure.style_mods then
    for k, v in pairs(structure.style_mods) do
      elem.style[k] = v
    end
  end

  if structure.elem_mods then
    for k, v in pairs(structure.elem_mods) do
      elem[k] = v
    end
  end

  if structure.tags then
    flib_gui.set_tags(elem, structure.tags)
  end

  if structure.actions then
    flib_gui.update_tags(elem, {flib = structure.actions})
  end

  if structure.ref then
    -- recursively create tables as needed
    local prev = refs
    local prev_key
    local nav
    for _, key in pairs(structure.ref) do
      prev = prev_key and prev[prev_key] or prev
      nav = prev[key]
      if nav then
        prev = nav
      else
        prev[key] = {}
        prev_key = key
      end
    end
    prev[prev_key] = elem
  end

  local children = structure.children
  if children then
    for i = 1, #children do
      recursive_build(elem, children[i], refs)
    end
  end

  local tabs = structure.tabs
  if tabs then
    for i = 1, #tabs do
      local tab_and_content = tabs[i]
      local tab = recursive_build(elem, tab_and_content.tab, refs)
      local content = recursive_build(elem, tab_and_content.content, refs)
      elem.add_tab(tab, content)
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
  return elem.tags[script.mod_name] or {}
end

--- Set (override) a GUI element's tags.
-- These tags are automatically written to and read from a subtable keyed by mod name, preventing conflicts.
-- @tparam LuaGuiElement elem
-- @tparam table tags
function flib_gui.set_tags(elem, tags)
  local elem_tags = elem.tags
  elem_tags[script.mod_name] = tags
  elem.tags = elem_tags
end

--- Delete a GUI element's tags.
-- These tags are automatically written to and read from a subtable keyed by mod name, preventing conflicts.
--
-- @tparam LuaGuiElement elem
function flib_gui.delete_tags(elem)
  local elem_tags = elem.tags
  elem_tags[script.mod_name] = nil
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
  local existing = elem_tags[script.mod_name]

  if not existing then
    elem_tags[script.mod_name] = {}
    existing = elem_tags[script.mod_name]
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
