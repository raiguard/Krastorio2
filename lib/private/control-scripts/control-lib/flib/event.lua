--- Syntax sugar for event manipulation.
-- Along with the list of functions below, this module dynamically generates syntax-shortcuts for all @{defines.events}
-- events. These shortcuts are only to be used when registering a handler to a single event. To register a handler to
-- multiple events, use @{event.register}.
--
-- To use a shortcut, replace `event.register(defines.events.on_built_entity, handler, filters)` with
-- `event.on_built_entity(handler, filters)`. You can also deregister the handler using `event.on_built_entity(nil)`.
-- @module event
-- @alias flib_event
-- @usage local event = require("__flib__.event")
-- @see event.lua
local flib_event = {}

-- generate syntax shortcuts
for name, id in pairs(defines.events) do
  flib_event[name] = function(handler, filters)
    return script.on_event(id, handler, filters)
  end
end

--- Functions
-- @section

--- Register or deregister a handler to be run during mod init.
-- @function on_init
-- @tparam function|nil handler The handler to register, or `nil` to deregister the registered handler.
-- @usage
-- -- register a handler to run during mod init
-- event.on_init(function() log("on_init") end)
-- -- deregister the registered handler, if one exists
-- event.on_init(nil)
flib_event.on_init = script.on_init

--- Register or deregister a handler to be run during mod load.
-- @function on_load
-- @tparam function|nil handler The handler to register, or `nil` to deregister the registered handler.
-- @usage
-- -- register a handler to run during mod load
-- event.on_load(function() log("on_load") end)
-- -- deregister the registered handler, if one exists
-- event.on_load(nil)
flib_event.on_load = script.on_load

--- Register or deregister a handler to be run when mod configuration changes.
-- @function on_configuration_changed
-- @tparam function|nil handler The handler to register, or `nil` to deregister the registered handler.
-- @usage
-- -- register a handler to run when mod configuration changes
-- event.on_configuration_changed(function() log("on_configuration_changed") end)
-- -- deregister the registered handler, if one exists
-- event.on_configuration_changed(nil)
flib_event.on_configuration_changed = script.on_configuration_changed

--- Register or deregister a handler to run every N ticks.
-- @function on_nth_tick
-- @tparam number nth_tick
-- @tparam function|nil handler The handler to register, or `nil` to deregister the registered handler.
-- @usage
-- -- register a handler to run every 30 ticks
-- event.on_nth_tick(30, function(e) log("30th tick!") end)
-- -- deregister the registered handler, if one exists
-- event.on_nth_tick(30, nil)
flib_event.on_nth_tick = script.on_nth_tick

-- TODO Nexela link EventFilters to https://lua-api.factorio.com/latest/Event-Filters.html

--- Register or deregister a handler to or from an event or group of events.
-- Unlike `script.on_event`, `event.register` supports adding compatible filters to multiple events at once.
-- Additionally, `event.register` supports registering to custom-inputs and other events simultaneously.
-- @tparam EventId|EventId[] ids
-- @tparam function|nil handler The handler to register, or `nil` to deregister the registered handler.
-- @tparam[opt] EventFilters filters
-- @usage
-- -- register a handler to a defines.events event that supports filters
-- event.register(defines.events.on_built_entity, function(e) log("ghost built!") end, {{filter="ghost"}})
-- -- register a handler to a custom-input
-- event.register("my-input", function(e) log("my-input pressed!") end)
-- -- register a handler to multiple events of different types
-- event.register({"my-input", defines.events.on_lua_shortcut}, function(e) log("do something!") end)
-- -- deregister a handler from a single event, if one is registered
-- event.register("my-input", nil)
-- -- deregister a handler from multiple events, if one is registered
-- event.register({"my-input", defines.events.on_lua_shortcut}, nil)
function flib_event.register(ids, handler, filters)
  if type(ids) ~= "table" then
    ids = {ids}
  end
  for i = 1, #ids do
    -- the game doesn't like you passing filters to events that don't support them, even if they're `nil`
    if filters then
      script.on_event(ids[i], handler, filters)
    else
      script.on_event(ids[i], handler)
    end
  end
  return
end

--- Register an entity to raise `on_entity_destroyed` when it's destroyed.
-- @function register_on_entity_destroyed
-- Once an entity is registered it's registered forever (until it's destroyed) and persists through save/load.
--
-- Registered is global across all mods: once an entity is registered the event will be fired for all mods when its
-- destroyed.
--
-- An entity registered multiple times will only fire the event once and gives back the same registration number.
--
-- Depending on when a given entity is destroyed on_entity_destroyed will be fired at the end of the current tick or end
-- of the next tick.
-- @tparam LuaEntity entity The entity to register.
-- @treturn number The registration number.
flib_event.register_on_entity_destroyed = script.register_on_entity_destroyed

--- Generate a new, unique event ID.
-- @function generate_id
-- @treturn number
-- @usage
-- -- generate a new event ID
-- local my_event = event.generate_id()
-- -- raise that event with custom parameters
-- event.raise(my_event, {whatever_you_want=true, ...})
flib_event.generate_id = script.generate_event_name

--- Retrieve the handler for an event, if one exists.
-- @function get_handler
-- @tparam EventId id
-- @treturn function The registered handler, or `nil` if one isn't registered.
flib_event.get_handler =  script.get_event_handler

-- TODO Nexela link EventData to https://lua-api.factorio.com/latest/events.html

--- Raise an event as if it were actually called.
-- @function raise
-- This will only work for events that actually support being raised, and custom mod events.
-- @tparam EventId id
-- @tparam table event_data The event data that will be passed to the handlers.
-- @usage
-- event.raise(defines.events.on_gui_click, {player_index=e.player_index, element=my_button, ...})
flib_event.raise = script.raise_event

--- Retrieve the mod event order.
-- @function get_order
-- @treturn string
flib_event.get_order = script.get_event_order

--- Set the filters for the given event(s).
-- @tparam EventId|EventId[] ids
-- @tparam EventFilters filters The filters to set, or `nil` to clear the filters.
-- @usage
-- -- set the filters for a single event
-- event.set_filters(defines.events.on_built_entity, {
--   {filter="ghost"},
--   {filter="type", type="assembling-machine"}
-- })
-- -- set the filters for multiple events that have compatible formats
-- event.set_filters({defines.events.on_built_entity, defines.events.on_robot_built_entity}, {
--   {filter="ghost"},
--   {filter="type", type="assembling-machine"}
-- })
-- -- clear event filters if any are set
-- event.set_filters(defines.events.on_robot_built_entity, nil)
function flib_event.set_filters(ids, filters)
  if type(ids) ~= "table" then
    ids = {ids}
  end
  for i = 1, #ids do
    script.set_event_filter(ids[i], filters)
  end
  return
end

--- Retrieve the filters for the given event.
-- @function get_filters
-- @tparam EventId id
-- @treturn EventFilters filters The filters, or `nil` if there are none defined.
flib_event.get_filter = script.get_event_filter

--- Concepts
-- @section

--- @Concept EventId
-- One of the following:
-- <ul>
--   <li>A member of @{defines.events}.</li>
--   <li>A positive @{number} corresponding to a custom event ID.</li>
--   <li>A @{string} corresponding to a custom-input name.</li>
-- </ul>

return flib_event