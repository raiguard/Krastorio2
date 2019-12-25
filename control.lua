-- Path 
local control_scripts_path = "lib/private/control-scripts/"

-- Lib
ControlCallbackMerger = require(control_scripts_path .. "control-callbacks-merger")
local ccm = ControlCallbackMerger:new()
-- Scrips
local scripts =
{
	-- Generate creep under biter nests
	require(control_scripts_path .. "creep-generator"),
	-- Adding inserters changeable drop lane 
	require(control_scripts_path .. "inserters-changeable-drop-lane"),
	-- Enable a auto snapping for loaders
	require(control_scripts_path .. "loaders-snapping"),
	-- Reset technologies unlocking when the game effect could be modified
	require(control_scripts_path .. "technologies-unlocking-coherence"),
	-- Radioactive damages
	require(control_scripts_path .. "radioactivity"),
	-- Shelter
	require(control_scripts_path .. "shelter"),
}

-- Load all callbacks
for _, script in pairs(scripts) do
	if script.callback then
		ccm:addCallBack(script)
	else -- is multiple callbacks
		ccm:addCallBacks(script)
	end
end

-- Active merged callbacks
ccm:activeCallbacks()
