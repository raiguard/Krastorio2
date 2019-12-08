-----------------------------------------------------------------------------
-- This script is used for merge multiple callback on the same event,
-- because factorio support only one callback per event per mod.
-- All callbacks must be added from the method addCallBack() and must be defined
-- how is written in the function description.
-- After must be call activeCallbacks() to active the callbacks,
-- each time the function is called will overwrite the previuos calls listen.

-- -- VARIABLES
-- function and variable container
local _control_callback_merger = {}

-- list of callbacks
_control_callback_merger.callbacks = {}

-- -- FUNCTIONS

-- @input could be a defined in this two way:
-- table->{callback, event_name}
-- table->{callback = callback, event = event_name}
-- on_init, on_configuration_changed, on_load
-- must be added like an event, for example
-- script.on_init(F) -> {F, "on_init"}
-- script.on_event(defines.events.E, F) ->
-- {F, E}
function _control_callback_merger.addCallBack(input)
	local callback   = input.callback or input[1] or false
	local event_name = input.event_name or input[2] or false
	if not callback or not event_name then
		return false
	end
	if not _control_callback_merger.callbacks[event_name] then
		_control_callback_merger.callbacks[event_name] = {}
	end
	table.insert(_control_callback_merger.callbacks[event_name], callback)	
end

-- A table of callbacks(tables) defined as in the function
function _control_callback_merger.addCallBacks(_table)
	for _, callback_def in pairs(_table) do
		_control_callback_merger.addCallBack(callback_def)
	end
end

local function createCollectiveCallback(_callbacks)
	return 
	function(...)
		local callbacks = _callbacks
		for _, callback in pairs(callbacks) do
			callback(...)
		end
	end
end

-- Each time this function is called will overwrite the previuos calls listen.
function _control_callback_merger.activeCallbacks()
	for event_name, callbacks in pairs(_control_callback_merger.callbacks) do
		local cc = createCollectiveCallback(callbacks)
		if     event_name == "on_init" then			
			script.on_init(cc)
		elseif event_name == "on_configuration_changed" then
			script.on_configuration_changed(cc)
		elseif event_name == "on_load" then
			script.on_load(cc)
		elseif defines.events[event_name] then -- Check if is a vanilla event
			script.on_event(defines.events[event_name], cc)
		else
			script.on_event(event_name, cc)
		end
	end	
end

return _control_callback_merger
-----------------------------------------------------------------------------
