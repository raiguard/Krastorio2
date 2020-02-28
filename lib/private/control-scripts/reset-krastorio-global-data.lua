local function addRemoteInterface()
	if not remote.interfaces["kr-restore"] then
		remote.add_interface("kr-restore",
		{
			reset_global_data = 
			function()
				intergalactic_transceiverVariablesInitializing()
				initializeCreepCollectorConstats()
				creepVariablesInitializing()
				initializePlanetaryTeleportersGlobalVariables()
				setupKRRadioactivityGlobalVariables()
				shelterVariablesInitializing()
				game.print({"other.forced-reset-message"})
			end
		})
	end
end

local function onInit()
	addRemoteInterface()
end

local function onLoad()
	addRemoteInterface()
end

return
{ 
	-- -- Bootstrap
	-- Adding interfaces
	{ onInit, "on_init" },
	{ onLoad, "on_load" }    
}