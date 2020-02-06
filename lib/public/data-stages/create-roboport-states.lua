local create_roboport_states = {}

local function removeFlag(flags, flat_to_remove)
	for i, flag in pairs(flags) do
		if flag == flat_to_remove then
			table.remove(flags, i)
		end
	end
end

function create_roboport_states.createRoboportVariations(roboport_name)
	local roboport = krastorio.entities.getEntity("roboport", roboport_name)
	if roboport then
		-- Logistic
		local logistic_roboport = util.table.deepcopy(roboport)
		logistic_roboport.name = logistic_roboport.name .. "-logistic-mode"
		logistic_roboport.localised_name = {"entity-name." .. roboport.name}
		logistic_roboport.localised_description = {"entity-description." .. roboport.name}
		removeFlag(logistic_roboport.flags, "placeable-player")
		logistic_roboport.construction_radius = 0		
		
		-- Construction
		local construction_roboport = util.table.deepcopy(roboport)
		construction_roboport.name = construction_roboport.name .. "-construction-mode"
		construction_roboport.localised_name = {"entity-name." .. roboport.name}
		construction_roboport.localised_description = {"entity-description." .. roboport.name}
		removeFlag(construction_roboport.flags, "placeable-player")
		construction_roboport.logistics_radius = 0
		
		data:extend({logistic_roboport, construction_roboport})
	end
end

return create_roboport_states