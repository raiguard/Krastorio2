local function onInitAndConf()
	if not global.krastorio.script_initialization_status["planetary-teleporters"] then
		initializePlanetaryTeleportersGlobalVariables()
		global.krastorio.script_initialization_status["planetary-teleporters"] = true
	end
end

function initializePlanetaryTeleportersGlobalVariables()
	global.planetary_teleporters = {}
	global.planetary_teleporter_index = 1
end

return
{ 
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },
	{ onInitAndConf, "on_configuration_changed" }
}
