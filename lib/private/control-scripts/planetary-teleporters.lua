function initializePlanetaryTeleportersVariables()
	global.planetary_teleporters = {}
	global.planetary_teleporter_index = 1
end

return
{ 
	-- -- Bootstrap
	-- For setup variables
	{ initializePlanetaryTeleportersVariables, "on_init" }
}
