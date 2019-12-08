
function technologiesUnlockingCoherence(event)
	for index, force in pairs(game.forces) do
		force.reset_technology_effects()
	end
end

return { callback = technologiesUnlockingCoherence, event_name = "on_configuration_changed" }