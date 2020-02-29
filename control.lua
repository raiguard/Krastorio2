-- Path 
local control_scripts_path = "__Krastorio2__/lib/private/control-scripts/"
local control_lib_path = control_scripts_path .. "control-lib/control-lib-initialization"

-- Libs
ControlCallbackMerger = require(control_scripts_path .. "control-lib/control-callbacks-merger")
local ccm = ControlCallbackMerger:new()
require(control_lib_path)

-- Scrips
local scripts =
{
	-- -- KRASTORIO 2 SCRIPTS
	-- Generate creep under biter nests
	require(control_scripts_path .. "creep-generator"),
	-- Adding inserters changeable drop lane 
	require(control_scripts_path .. "inserters-changeable-drop-lane"),
	-- Adding change roboport state
	require(control_scripts_path .. "change-roboport-state"),
	-- Enable a auto snapping for loaders
	require(control_scripts_path .. "loaders-snapping"),
	-- Reset technologies unlocking when the game effect could be modified
	require(control_scripts_path .. "technologies-unlocking-coherence"),
	-- Radioactive damages
	require(control_scripts_path .. "radioactivity"),
	-- Shelter
	require(control_scripts_path .. "shelter"),
	-- Disable vanilla victory
	require(control_scripts_path .. "disable-vanilla-victory"),
	-- Create a crash site like in the Factorio campaign
	require(control_scripts_path .. "crash-site"),
	-- Wiki GUI
	require(control_scripts_path .. "wiki"),
	-- Supporter thanks
	require(control_scripts_path .. "supporters-thanks"),
	-- Intergalactic transceiver
	require(control_scripts_path .. "intergalactic-transceiver"),
	-- Creep collector
	require(control_scripts_path .. "creep-collector"),
	-- for future updates...
	require(control_scripts_path .. "planetary-teleporters"),
	-- Electric offshore pump
	require(control_scripts_path .. "electric-offshore-pump"),
	-- -- REMOTE INTERFACES
	require(control_scripts_path .. "reset-krastorio-global-data"),
	-- -- COMPATIBILITY
	-- DiscoScience
	require("__Krastorio2__/compatibility-scripts/control/DiscoScience")
}

-- Load all callbacks from control scripts (not for GUI events)
for _, script in pairs(scripts) do
	if script.callback then
		ccm:addCallBack(script)
	else -- is multiple callbacks
		ccm:addCallBacks(script)
	end
end

-- GUI events
local ce = krastorio.gui.getCollectiveClickEventsCallback()
ccm:addCallBack({ce, "on_gui_click"})
local se = krastorio.gui.getCollectiveSelectEventsCallback()
ccm:addCallBack({se, "on_gui_selection_state_changed"})

-- Active merged callbacks
ccm:activeCallbacks()

-- Cheat Stuff
if settings.startup["kr-bonus-items"].value then
script.on_event(defines.events.on_player_created, function(event)
	local iteminsert = game.players[event.player_index].insert
		iteminsert{name="construction-robot", count=50}
		iteminsert{name="modular-armor", count=1}
		iteminsert{name="car", count=1}
		iteminsert{name="big-battery-equipment", count=1}
		iteminsert{name="personal-roboport-equipment", count=1}
		iteminsert{name="small-portable-generator", count=2}
		iteminsert{name="cliff-explosives", count=50}
		iteminsert{name="landfill", count=50}
	end)
	end
