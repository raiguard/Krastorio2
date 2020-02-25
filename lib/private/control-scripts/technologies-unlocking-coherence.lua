-- If mods change the tech tree in update this will fix the recipe unlocking changed
function technologiesUnlockingCoherence(event)
	for index, force in pairs(game.forces) do
		force.reset_technology_effects()
	end
end

return { callback = technologiesUnlockingCoherence, event_name = "on_configuration_changed" }
