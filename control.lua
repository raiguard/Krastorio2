-- Lib
local ccm = require("lib/private/control-scripts/control-callbacks-merger")

-- Scrips
local scripts =
{
	-- Generate creep under biter nests
	require("lib/private/control-scripts/creep-generator"),
	-- Adding inserters changeable drop lane 
	require("lib/private/control-scripts/inserters-changeable-drop-lane")
}

-- Load all callbacks
for _, script in pairs(scripts) do
	if script.callback then
		ccm.addCallBack(script)
	else -- is multiple callbacks
		ccm.addCallBacks(script)
	end
end

-- Active callbacks
ccm.activeCallbacks()
