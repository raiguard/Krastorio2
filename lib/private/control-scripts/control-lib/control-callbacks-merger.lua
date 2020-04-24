-----------------------------------------------------------------------------
-- This script is used for merge multiple callbacks on the same event,
-- because Factorio support only one callback per event per mod.
-- All callbacks must be added from the method addCallBack()/addCallBacks()
-- and must be defined how is written in the function description.
-- After must be call activeCallbacks() to active the callbacks,
-- each time the function is called will overwrite the previuos calls listen.
-----------------------------------------------------------------------------
-- -- LIBRARY
local util = require("__core__/lualib/util")
-- -- VARIABLES
-- function and variable container
ControlCallbackMerger = 
{
	-- lists of callbacks
	simple_callbacks      = {},
	filtered_callbacks    = {},
	on_nth_tick_callbacks = {}
}
ControlCallbackMerger.__index = ControlCallbackMerger
-----------------------------------------------------------------------------
-- -- CONSTRUCTORS
-- @ccm, another ControlCallbackMerger object or nil
function ControlCallbackMerger:new(ccm)
	object = ccm or {}
	setmetatable(object, ControlCallbackMerger)
	return object
end
-----------------------------------------------------------------------------
-- -- FUNCTIONS

-- @input could be a defined in this two way:
-- table->{callback, event_name}
-- table->{callback = function, event = event_name}
-- table->{callback = function, event = event_name, filter = filter_table}
--
-- filter is an optional value,
-- if filter is a number the function will add the callback on event,
-- on_nth_tick, and the filter number will be the tick number,
-- also the event_name must be "on_nth_tick".
--
-- on_init, on_configuration_changed, on_load
-- must be added like an event, for example
-- script.on_init(F) -> {F, "on_init"}
-- script.on_event(defines.events.E, F) ->
-- {F, E}
-- 
-- an additional property is the index,
-- use to remove a callback later when the game is running
function ControlCallbackMerger:addCallBack(input)
	local callback   = input.callback   or input[1] or false
	local event_name = input.event_name or input[2] or false
	local filter     = input.filter     or input[3] or false
	local index      = input.index      or input[4] or false
	if not callback or not event_name then
		return false
	end
	if filter then
		if event_name == "on_nth_tick" or type(filter) == "number" then
			local ticks = filter or 1
			if not self.on_nth_tick_callbacks[ticks] then
				self.on_nth_tick_callbacks[ticks] = {}
			end
			if index then
				table.insert(self.on_nth_tick_callbacks[ticks], {callback, index})				
			else
				table.insert(self.on_nth_tick_callbacks[ticks], callback)
			end
		else
			if not self.filtered_callbacks[event_name] then
				self.filtered_callbacks[event_name] = {}
			end
			if index then
				table.insert(self.filtered_callbacks[event_name], {callback, filter, index})
			else
				table.insert(self.filtered_callbacks[event_name], {callback, filter})
			end
		end		
	else -- without filter callback
		if not self.simple_callbacks[event_name] then
			self.simple_callbacks[event_name] = {}
		end
		if index then
			table.insert(self.simple_callbacks[event_name], {callback, index})	
		else
			table.insert(self.simple_callbacks[event_name], callback)	
		end
	end
	return true
end

-- A table of callbacks(tables) defined as in the function
function ControlCallbackMerger:addCallBacks(callbacks)
	for _, callback in pairs(callbacks) do
		self:addCallBack(callback)
	end
end

-- Return a function that call all functions in the given table,
-- with the same argument(s) given to the collective function
-- @callbacks, table of functions
local function createCollectiveCallback(callbacks)
	return 
	function(...)
		for _, callback in pairs(callbacks) do
			callback(...)
		end
	end
end

local function mergeFilters(filters_group_a, filters_group_b)
	local finded = false
	local new_filters_group = util.table.deepcopy(filters_group_a)
	for _, filter_b in pairs(filters_group_b) do
		finded = false
		for _, filter_a in pairs(filters_group_a) do
			if util.table.compare(filter_a, filter_b) then
				finded = true
				break
			end
		end
		if not finded then
			table.insert(new_filters_group, filter_b)
		end
	end
	return new_filters_group
end

-- Each time this function is called will overwrite the previuos calls listen.
function ControlCallbackMerger:activeCallbacks()
	-- Merge simple and filtered callbacks if necessary
	for event_name, _ in pairs(self.simple_callbacks) do
		if self.filtered_callbacks[event_name] then			
			for _, callback in pairs(self.filtered_callbacks[event_name]) do
				table.insert(self.simple_callbacks[event_name], callback[1])
			end
			self.filtered_callbacks[event_name] = nil
		end
	end
	-- Simple
	for event_name, callbacks in pairs(self.simple_callbacks) do
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
	-- Filtered
	for event_name, callbacks in pairs(self.filtered_callbacks) do
		local cc = nil
		local collective_filter = {}
		if #callbacks > 1 then
			local cc_list = {}			
			for _, callback in pairs(callbacks) do
				table.insert(cc_list, callback[1])
				collective_filter = mergeFilters(collective_filter, callback[2])
			end
			cc = createCollectiveCallback(cc_list)
		else
			cc = callbacks[1][1]
			collective_filter = callbacks[1][2]
		end
		script.on_event(defines.events[event_name], cc, collective_filter)
	end
	-- On nth ticks
	for ticks, callbacks in pairs(self.on_nth_tick_callbacks) do
		local cc = nil
		if #callbacks > 1 then
			cc = createCollectiveCallback(callbacks)
		else
			cc = callbacks[1]
		end	
		script.on_nth_tick(ticks, cc)
	end
end
-----------------------------------------------------------------------------
return ControlCallbackMerger
-----------------------------------------------------------------------------
