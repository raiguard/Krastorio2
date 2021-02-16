--- GUI structuring tools and event handling.
-- **NOTICE: This module will be deprecated when Factorio 1.2 releases. Use the @{gui-beta} module instead.**
-- @module gui
-- @alias flib_gui
-- @usage local gui = require("__flib__.gui")
-- @see gui.lua
local flib_gui = {}

local table = require("__flib__.table")

local string_gmatch = string.gmatch
local string_gsub = string.gsub
local string_sub = string.sub

local handlers = {}
local templates = {}

local template_lookup = {}
local handler_lookup = {}
local handler_groups = {}

local function generate_template_lookup(t, template_string)
  for k, v in pairs(t) do
    if type(v) == "table" then
      local new_string = template_string..k
      if v.type or v.template then
        template_lookup[new_string] = v
      else
        generate_template_lookup(v, new_string..".")
      end
    end
  end
end

local function generate_handler_lookup(t, event_string, groups)
  groups[#groups+1] = event_string
  for k, v in pairs(t) do
    if k ~= "extend" then
      local new_string = event_string.."."..k
      -- shortcut syntax: key is a defines.events or a custom-input name, value is just the handler
      if type(v) == "function" then
        v = {
          id = defines.events[k] or k,
          handler = v
        }
      end
      if v.handler then
        v.id = v.id or defines.events[k] or k
        v.filters = {}
        v.groups = table.deep_copy(groups)
        handler_lookup[new_string] = v
        -- assign handler to groups
        for i=1,#groups do
          local group = handler_groups[groups[i]]
          if group then
            group[#group+1] = new_string
          else
            handler_groups[groups[i]] = {new_string}
          end
        end
      else
        generate_handler_lookup(v, new_string, groups)
      end
    end
  end
  groups[#groups] = nil
end

local function generate_filter_lookup()
  -- add filter lookup to each handler
  for _, players in pairs(global.__flib.gui) do
    for player_index, filters in pairs(players) do
      if player_index ~= "__size" then
        for filter, handler_name in pairs(filters) do
          if filter ~= "__size" then
            local handler_table = handler_lookup[handler_name]
            if handler_table then
              local handler_filters = handler_table.filters
              local player_filters = handler_filters[player_index]
              if player_filters then
                player_filters[filter] = filter
                player_filters.__size = player_filters.__size + 1
              else
                handler_filters[player_index] = {__size=1, [filter]=filter}
              end
            end
          end
        end
      end
    end
  end
end

--- Setup functions
-- @section

--- Initial setup.
-- Must be called during `on_init` **before** any structures are built.
--
-- If adding the module to an existing mod, this must be called in `on_configuration_changed` for that version as well.
--
-- This function can also be used to wipe all GUI filters for all players.
function flib_gui.init()
  if not global.__flib then
    global.__flib = {gui={}}
  else
    global.__flib.gui = {}
    for _, data in pairs(handler_lookup) do
      data.filters = {}
    end
  end
end

--- Generate template and handler lookup tables.
-- Must be called during `on_init` **after** @{gui.init}, and during `on_init` and `on_load` **after** all templates and
-- handlers have been added, but **before** any structures are built.
function flib_gui.build_lookup_tables()
  generate_template_lookup(templates, "")
  -- go one level deep before calling the function, to avoid adding an unnecessary prefix to all group names
  for k, v in pairs(handlers) do
    generate_handler_lookup(v, k, {})
  end
  if global.__flib and global.__flib.gui then
    generate_filter_lookup()
  end
end

--- Purge all filters tied to non-existent handlers from `global`.
-- Must be called during `on_configuration_changed`.
-- This function is necessary in order to prevent crashes when a handler was removed between mod versions, but still has
-- filters assigned to it stored in `global`.
function flib_gui.check_filter_validity()
  local filters_table = global.__flib.gui
  for event_name, event_filters in pairs(filters_table) do
    for player_index, player_filters in pairs(event_filters) do
      if player_index ~= "__size" then
        for filter, handler_name in pairs(player_filters) do
          if filter ~= "__size" then
            local handler_data = handler_lookup[handler_name]
            if not handler_data then
              player_filters[filter] = nil
              player_filters.__size = player_filters.__size - 1
            end
          end
        end
        if player_filters.__size == 0 then
          event_filters[player_index] = nil
          event_filters.__size = event_filters.__size - 1
          if event_filters.__size == 0 then
            filters_table[event_name] = nil
          end
      end
      end
    end
  end
end

--- Register handlers for all GUI events to pass through the module.
-- This will loop through all GUI-related `defines.events` events and register them to @{gui.dispatch_handlers}.
--
-- This function should be called in the root scope.
-- @usage
-- -- register handlers for all GUI events
-- gui.register_handlers()
--
-- -- overwrite a handler to add custom logic
-- event.on_gui_opened(function(e)
--   -- pass through the GUI module
--   if not gui.dispatch_handlers(e) then
--     -- run our custom logic if no handlers were dispatched
--     inventory.on_gui_opened(e)
--   end
-- end)
function flib_gui.register_handlers()
  for name, id in pairs(defines.events) do
    if string_sub(name, 1, 6) == "on_gui" then
      script.on_event(id, flib_gui.dispatch_handlers)
    end
  end
end

--- Add content to the @{gui.templates} table.
-- The table you provide will be merged with the current contents of the table.
--
-- This table must be complete **before** @{gui.build_lookup_tables} is run, and must not be changed afterwards.
--
-- **NOTE:** In order to be detected properly, a template must include either a `type` key or another `template` key.
-- If both of these are omitted, the template will not be added to the lookup table and will be unusable.
-- @tparam table input
-- @see gui.templates
function flib_gui.add_templates(input)
  templates = table.deep_merge{templates, input}
  -- because the reference is lost...
  flib_gui.templates = templates
end

--- Add content to the @{gui.handlers} table.
-- The table you provide will be merged with the current contents of the table.
--
-- This table must be complete **before** @{gui.build_lookup_tables} is run, and must not be changed afterwards.
-- @tparam table input
-- @see gui.handlers
function flib_gui.add_handlers(input)
  handlers = table.deep_merge{handlers, input}
  -- because the reference is lost...
  flib_gui.handlers = handlers
end

--- Functions
-- @section

-- navigate a structure to build a GUI
local function recursive_build(parent, structure, output, filters, player_index)
  -- load template
  local structure_template = structure.template
  if structure_template then
    local loaded_template_names = {}
    -- recursively apply templates until there are none left
    while structure_template do
      if loaded_template_names[structure_template] then
        error("Template loop detected in ["..structure_template.."]")
      end
      loaded_template_names[structure_template] = true
      structure.template = nil
      for k,v in pairs(template_lookup[structure_template]) do
        structure[k] = structure[k] or v
      end
      structure_template = structure.template
    end
  end

  -- process structure
  local elem
  local structure_type = structure.type
  if structure_type == "condition" then
    if structure.condition then
      -- add children
      local children = structure.children
      if children then
        for i=1,#children do
          output, filters = recursive_build(parent, children[i], output, filters, player_index)
        end
      end
    end
  elseif structure_type == "tab-and-content" then
    local tab, content
    output, filters, tab = recursive_build(parent, structure.tab, output, filters, player_index)
    output, filters, content = recursive_build(parent, structure.content, output, filters, player_index)
    parent.add_tab(tab, content)
  else
    -- create element
    elem = parent.add(structure)
    -- apply style modifications
    if structure.style_mods then
      for k, v in pairs(structure.style_mods) do
        elem.style[k] = v
      end
    end
    -- apply modifications
    if structure.elem_mods then
      for k, v in pairs(structure.elem_mods) do
        elem[k] = v
      end
    end
    -- register handlers
    if structure.handlers then
      local elem_index = elem.index
      local group = handler_groups[structure.handlers]
      if not group then error("Invalid GUI handler name ["..structure.handlers.."]") end
      for i=1,#group do
        local name = group[i]
        local saved_filters = filters[name]
        if not saved_filters then
          filters[name] = {elem_index}
        else
          saved_filters[#saved_filters+1] = elem_index
        end
      end
    end
    -- add to output table
    if structure.save_as then
      -- recursively create tables as needed
      local prev = output
      local prev_key
      local nav
      for key in string_gmatch(structure.save_as, "([^%.]+)") do
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
    -- add children
    local children = structure.children
    if children then
      for i=1,#children do
        output, filters = recursive_build(elem, children[i], output, filters, player_index)
      end
    end
  end

  return output, filters, elem
end

--- Build a GUI structure.
-- @tparam LuaGuiElement parent
-- @tparam GuiStructure[] structures
-- @treturn GuiOutputTable output
-- @treturn GuiOutputFiltersTable filters
-- @usage
-- gui.build(player.gui.screen, {
--   {type="frame", direction="vertical", handlers="window", save_as="window", children={
--     -- titlebar
--     {type="flow", save_as="titlebar_flow", children={
--       {type="label", style="frame_title", caption="Menu", elem_mods={ignored_by_interaction=true}},
--       {type="empty-widget", style="flib_titlebar_drag_handle", elem_mods={ignored_by_interaction=true}},
--       {type="condition", condition=(not is_dialog_frame), children={
--         {template="frame_action_button",
--           sprite="utility/close_white",
--           handlers="titlebar.close_button",
--           save_as="titlebar.close_button"
--         }
--       }}
--     }},
--     {type="frame", style="inside_shallow_frame_with_padding", children={
--       {type="table", style="slot_table", column_count=10, save_as="content.slot_table"}
--     }},
--     {type="condition", condition=is_dialog_frame, children={
--       {type="flow", style="dialog_buttons_horizontal_flow", children={
--         {type="button", style="back_button", caption={"gui.back"}, handlers="footer.back_button"},
--         {type="empty-widget",
--           style="flib_dialog_footer_drag_handle",
--           style_mods={right_margin=0},
--           save_as="footer.drag_handle"
--         }
--       }}
--     }}
--   }}
-- })
function flib_gui.build(parent, structures)
  local output = {}
  local filters = {}
  local player_index = parent.player_index or parent.player.index
  for i=1,#structures do
    output, filters = recursive_build(
      parent,
      structures[i],
      output,
      filters,
      player_index
    )
  end
  for name, filters_table in pairs(filters) do
    flib_gui.update_filters(name, player_index, filters_table, "add")
  end
  return output, filters
end

--- Dispatch GUI handlers for the given event.
-- Only needed if not using @{gui.register_handlers} or if overriding a handler registered using that function.
-- @tparam Concepts.EventData event_data
-- @treturn boolean If a handler was dispatched.
-- @usage
-- event.on_gui_opened(function(e)
--   -- dispatch any matching handlers
--   if not gui.dispatch_handlers(e) then
--     -- run custom logic if no handlers were dispatched
--     inventory.on_gui_opened(e)
--   end
-- end)
function flib_gui.dispatch_handlers(event_data)
  if not event_data.element or not event_data.player_index then return false end

  local event_filters = global.__flib.gui[event_data.name]
  if not event_filters then return false end

  local player_filters = event_filters[event_data.player_index]
  if not player_filters then return false end

  local element = event_data.element
  local element_name = string_gsub(element.name, "__.*", "")

  local handler_name = player_filters[element.index] or player_filters[element_name]
  if handler_name then
    handler_lookup[handler_name].handler(event_data)
    return true
  else
    return false
  end
end

--- Add or remove GUI filters to or from a handler or group of handlers.
-- When destroying a GUI element with a filter, be certain to call this function destroying that filter, to avoid
-- memory leaks.
-- @tparam string name The handler name, or group name.
-- @tparam number player_index
-- @tparam GuiFilter[]|nil filters An array of filters, or `nil` to clear all filters when in `remove` mode.
-- @tparam string mode One of "add" or "remove".
-- @usage
-- -- add a filter to a group of events
-- gui.update_filters("main.content.inventory_button", player_index, {"demo_inventory_button"}, "add")
-- -- remove a filter from a group of events
-- gui.update_filters("main.content.inventory_button", player_index, {"demo_inventory_button"}, "remove")
-- -- remove all filters tied to a group of events
-- gui.update_filters("main.content.inventory_button", player_index, nil, "remove")
-- -- add a filter to a specific event
-- gui.update_filters("main.titlebar.drag_handle.on_gui_click", player_index, {elems.drag_handle.index}, "add")
function flib_gui.update_filters(name, player_index, filters, mode)
  local handler_names = handler_groups[name] or {name}
  for i = 1, #handler_names do
    local handler_name = handler_names[i]
    local handler_data = handler_lookup[handler_name]
    if not handler_data then error("GUI handler ["..handler_name.."] does not exist!") end
    local id = handler_data.id
    local handler_filters = handler_data.filters

    -- saved filters table (in global)
    local __gui = global.__flib.gui
    local saved_event_filters = __gui[id]
    if not saved_event_filters then
      __gui[id] = {__size=1, [player_index]={__size=0}}
      saved_event_filters = __gui[id]
    end
    local saved_player_filters = saved_event_filters[player_index]
    if not saved_player_filters then
      saved_event_filters[player_index] = {__size=0}
      saved_event_filters.__size = saved_event_filters.__size + 1
      saved_player_filters = saved_event_filters[player_index]
    end

    -- handler filters table (in lookup)
    local handler_player_filters = handler_filters[player_index]
    if not handler_player_filters then
      handler_filters[player_index] = {__size=0}
      handler_player_filters = handler_filters[player_index]
    end

    -- update filters
    if mode == "add" then
      for _, filter in pairs(filters) do
        saved_player_filters[filter] = handler_name
        saved_player_filters.__size = saved_player_filters.__size + 1
        handler_player_filters[filter] = filter
        handler_player_filters.__size = handler_player_filters.__size + 1
      end
    elseif mode == "remove" then
      -- if a filters table wasn't provided, remove all of them
      for key, filter in pairs(filters or handler_player_filters) do
        if key ~= "__size" then
          saved_player_filters[filter] = nil
          saved_player_filters.__size = saved_player_filters.__size - 1
          handler_player_filters[filter] = nil
          handler_player_filters.__size = handler_player_filters.__size - 1
        end
      end

      -- clean up empty tables
      if saved_player_filters.__size == 0 then
        saved_event_filters[player_index] = nil
        saved_event_filters.__size = saved_event_filters.__size - 1
        if saved_event_filters.__size == 0 then
          __gui[id] = nil
        end
      end
      if handler_player_filters.__size == 0 then
        handler_filters[player_index] = nil
      end
    else
      error("Invalid GUI filter update mode ["..mode.."]")
    end
  end
end

--- Remove all GUI filters for the given player.
-- @tparam number player_index
function flib_gui.remove_player_filters(player_index)
  for group_name in pairs(handler_groups) do
    -- check for a level-1 group to minimize calls to update_filters()
    if not string.find(group_name, "%.") then
      flib_gui.update_filters(group_name, player_index, nil, "remove")
    end
  end
end

--- Fields
-- @section

--- GUI handlers, built using @{gui.add_handlers}.
-- @usage
-- -- add handlers
-- gui.add_handlers{
--   -- you can organize the handlers however you like
--   base = {
--     titlebar = {
--       -- this is a handler group for a specific GUI element
--       close_button = {
--         -- name of `defines.events` event -> handler function
--         on_gui_click = function(e)
--           log(serpent.block(e))
--         end
--       }
--     }
--   }
-- }
--
-- -- use the handlers
-- gui.build(player.gui.screen, {
--   {type="sprite-button",
--     style="frame_action_button",
--     sprite="utility/close_white",
--     handlers="base.titlebar.close_button"
--   }
-- })
flib_gui.handlers = handlers

--- One-dimensional handler lookup table, generated using @{gui.build_lookup_tables}.
-- This is what @{gui.dispatch_handlers} uses to retrieve and dispatch handlers tied to certain elements.
-- Each value is a table containing the event ID, handler, groups that handler belongs to, and a mapping of the GUI
-- filters currently assigned to the handler.
-- @usage
-- -- given:
-- gui.add_handlers{
--   base = {
--     titlebar = {
--       close_button = {
--         on_gui_click = function(e)
--           log(serpent.block(e))
--         end
--       }
--     }
--   }
-- }
-- gui.build(player.gui.screen, {
--   {type="sprite-button",
--     style="frame_action_button",
--     sprite="utility/close_white",
--     handlers="base.titlebar.close_button"
--   }
-- })
--
-- -- contents of gui.handler_lookup will be:
-- {
--   ["base.titlebar.close_button.on_gui_click"] = {
--     id = defines.events.on_gui_click,
--     handler = function(e)
--       __DebugAdapter.print(e)
--     end,
--     groups = {
--       "base",
--       "base.titlebar",
--       "base.titlebar.close_button"
--     },
--     filters = {
--       [1] = { -- the player's index
--         __size = 1,
--         [5] = 5 -- the element's index, as both the key and the value
--       }
--     }
--   }
-- }
flib_gui.handler_lookup = handler_lookup

--- Mapping of group names to all handlers belonging to them, generated using @{gui.build_lookup_tables}.
-- This is what @{gui.build} uses to find handler groups when using the `handlers` parameter in a @{GuiStructure}.
-- @usage
-- -- given:
-- gui.add_handlers{
--   base = {
--     titlebar = {
--       close_button = {
--         on_gui_click = function(e)
--           log(serpent.block(e))
--         end,
--         my_custom_event = {id=constants.my_custom_event, handler=function(e)
--           log(serpent.block(e))
--         }
--       }
--     },
--     content = {
--       item_button = {
--         on_gui_click = function(e)
--           log(serpent.block(e))
--         end
--       }
--     }
--   }
-- }
--
-- -- contents of gui.handler_groups will be:
-- {
--   ["base"] = {
--     "base.titlebar.close_button.on_gui_click",
--     "base.titlebar.close_button.my_custom_event",
--     "base.content.item_button.on_gui_click"
--   },
--   ["base.titlebar"] = {
--     "base.titlebar.close_button.on_gui_click",
--     "base.titlebar.close_button.my_custom_event"
--   },
--   ["base.titlebar.close_button"] = {
--     "base.titlebar.close_button.on_gui_click",
--     "base.titlebar.close_button.my_custom_event"
--   },
--   ["base.content"] = {
--     "base.content.item_button.on_gui_click"
--   },
--   ["base.content.item_button"] = {
--     "base.content.item_button.on_gui_click"
--   }
-- }
flib_gui.handler_groups = handler_groups

--- GUI templates, built using @{gui.add_templates}.
-- @usage
-- -- add content to the table
-- gui.add_templates{
--   -- templates are usually defined as GuiStructures
--   frame_action_button = {type="sprite-button", style="frame_action_button", mouse_button_filter={"left"}},
--   -- you can divide and organize templates however you wish
--   pushers = {
--     horizontal = {type="empty-widget", style_mods={horizontally_stretchable=true}},
--     vertical = {type="empty-widget", style_mods={vertically_stretchable=true}}
--   },
--   -- templates can also be functions
--   list_box_with_label = function(name)
--     return
--       {type="flow", direction="vertical", children={
--         {type="label", style="bold_label", caption={"my-listbox-labels."..name}, save_as="listboxes."..name..".label"},
--         {type="list-box", save_as="listboxes."..name..".list_box"}
--       }}
--   end
-- }
--
-- -- use the templates
-- gui.build(player.gui.screen, {
--   -- use GuiStructure templates using the "template" parameter
--   {template="pushers.horizontal"},
--   {template="frame_action_button", sprite="utility/close_white"},
--   -- use function templates by calling them directly
--   -- you do not necessarily need to keep function templates in the `templates` table, but the module supports doing so
--   gui.templates.list_box_with_label("ingredients"),
--   gui.templates.list_box_with_label("products")
-- })
flib_gui.templates = templates

--- One-dimensional template lookup table, generating using @{gui.build_lookup_tables}.
-- This is what @{gui.build} uses to find templates when using the `templates` parameter in a @{GuiStructure}.
-- @usage
-- -- given:
-- gui.add_templates{
--   frame_action_button = {type="sprite-button", style="frame_action_button", mouse_button_filter={"left"}},
--   pushers = {
--     horizontal = {type="empty-widget", style_mods={horizontally_stretchable=true}},
--     vertical = {type="empty-widget", style_mods={vertically_stretchable=true}}
--   }
-- }
--
-- -- contents of template_lookup will be:
-- {
--   ["frame_action_button"] = {type="sprite-button", style="frame_action_button", mouse_button_filter={"left"}},
--   ["pushers.horizontal"] = {type="empty-widget", style_mods={horizontally_stretchable=true}},
--   ["pushers.vertical"] = {type="empty-widget", style_mods={vertically_stretchable=true}}
-- }
flib_gui.template_lookup = template_lookup

return flib_gui

--- Concepts
-- @section

--- An index or string used for filtering GUI handlers on specific elements.
-- Defined as one of the following:
-- <ul>
--   <li>A @{string} corresponding to an element's name. Partial names may be matched by separating the common section
--   from the unique section with two underscores `__`.</li>
--   <li>A @{uint} corresponding to an element's index.</li>
-- </ul>
-- @Concept GuiFilter

--- A series of nested tables used to build a GUI.
-- This is an extension of @{LuaGuiElement}, providing new features and options.
--
-- This inherits all required properties from its base @{LuaGuiElement}, i.e. if the `type` field is
-- `sprite-button`, the @{GuiStructure} must contain all the fields that a `sprite-button` @{LuaGuiElement} requires.
--
-- There are two new types that are exposed, each of which restrict what parameters can be added:
-- <ul>
--   <li><strong>condition:</strong> Accepts the `condition` and `children` parameters only.</li>
--   <li><strong>tab-and-content:</strong> Accepts the `tab` and `content` parameters only.</li>
-- </ul>
--
-- There are a number of new fields that can be applied to a @{GuiStructure} depending on the type:
--
-- **_template_**
--
-- A @{string} corresponding to a @{GuiStructure} in the @{gui.template_lookup} table. The contents of this "template"
-- will be used as a base, and any other paramters in this @{GuiStructure} will overwrite / add to this base.
--
-- **_condition_**
--
-- For `condition` types only. If true, the children of this @{GuiStructure} will be added to the parent of this
-- @{GuiStructure}. If false, they will not.
--
-- **_tab_**
--
-- For `tab-and-content` types only. A @{GuiStructure} defining a tab to be placed in a tabbed-pane.
--
-- **_content_**
--
-- For `tab-and-content` types only. A @{GuiStructure} defining the content that will be shown when the corresponding
-- tab is active.
--
-- **_style_mods_**
--
-- A key -> value dictionary defining modifications to make to the element's style. Available properties are listed in
-- @{LuaStyle}.
--
-- **_elem_mods_**
--
-- A key -> value dictionary defining modifications to make to the element. Available properties are listed in
-- @{LuaGuiElement}.
--
-- **_handlers_**
--
-- A @{string} corresponding to an item in the @{gui.handler_groups} table. The element will be registered to the
-- handlers in that group, and when the events are raised by the game relating to this element, the corresponding
-- handlers will be dispatched.
--
-- **_save_as_**
--
-- A @{string} defining a table path to save this element to, in the first return value of @{gui.build}. This is a
-- dot-deliminated list of nested table names, followed by a key to save the element as. The module will construct the
-- output table dynamically based on the contents of `save_as` throughout the structure.
--
-- **_children_**
--
-- An array of @{GuiStructure} that will be added as children of this element.
-- @usage
-- {type="frame", direction="vertical", handlers="window", save_as="window", children={
--   -- titlebar
--   {type="flow", save_as="titlebar_flow", children={
--     {type="label", style="frame_title", caption="Menu", elem_mods={ignored_by_interaction=true}},
--     {type="empty-widget", style="flib_titlebar_drag_handle", elem_mods={ignored_by_interaction=true}},
--     {type="condition", condition=(not is_dialog_frame), children={
--       {template="frame_action_button",
--         sprite="utility/close_white",
--         handlers="titlebar.close_button",
--         save_as="titlebar.close_button"
--       }
--     }}
--   }},
--   {type="frame", style="inside_shallow_frame_with_padding", children={
--     {type="table", style="slot_table", column_count=10, save_as="content.slot_table"}
--   }},
--   {type="condition", condition=is_dialog_frame, children={
--     {type="flow", style="dialog_buttons_horizontal_flow", children={
--       {type="button", style="back_button", caption={"gui.back"}, handlers="footer.back_button"},
--       {type="empty-widget",
--         style="flib_dialog_footer_drag_handle",
--         style_mods={right_margin=0},
--         save_as="footer.drag_handle"
--       }
--     }}
--   }}
-- }}
-- @Concept GuiStructure

--- First output of @{gui.build}, containing saved elements.
-- The layout of this table is defined in the @{GuiStructure} using the `save_as` parameter. Consists of nested tables
-- and key -> @{LuaGuiElement} pairs.
-- @Concept GuiOutputTable

--- Second output of @{gui.build}, containing a handler_name -> filters mapping.
-- This is useful for knowing which filters are assigned to which handlers for this specific structure, so you can
-- remove them later using @{gui.update_filters}.
-- @Concept GuiOutputFiltersTable
-- @usage
-- {
--   ["window.on_gui_closed"] = {23},
--   ["content_pane.ingredients_list.ingredient_button.on_gui_click"] = {"demo_ingredient_button", 30},
--   ["titlebar.close_button.on_gui_click"] = {21}
-- }
