-- Changes to Vanila laboratory with the new science system
local function removeFromLab(name, inputs)
	for key, pack in pairs(inputs) do
		if pack == name then
			table.remove(inputs, key)
			break
		end
	end
end

if data.raw.lab["lab"] then
	local vanilla_lab_inputs = data.raw.lab["lab"].inputs	
	
	-- Remove only (for compatibility) the vanilla know science pack that should not be here
	removeFromLab("production-science-pack", vanilla_lab_inputs)
	removeFromLab("utility-science-pack", vanilla_lab_inputs)
	removeFromLab("space-science-pack", vanilla_lab_inputs)
		
	-- Adding new science pack
	for key = #vanilla_lab_inputs, 1, -1  do -- make space at the begin for the new pack
		vanilla_lab_inputs[key+1] = vanilla_lab_inputs[key]
	end
	
	vanilla_lab_inputs[1] = "basic-tech-card"	
	
	-- -- Adapt Krastorio 2 tier 2 laboratory (BiusArt lab)
	if data.raw.lab["biusart-lab"] then
		local biusart_lab_inputs = data.raw.lab["biusart-lab"].inputs

		-- -- Copy progressively packs in Tier 2 lab (BiusArt lab)
		for i = 1, #vanilla_lab_inputs do
			biusart_lab_inputs[i] = vanilla_lab_inputs[i]
		end
		removeFromLab("basic-tech-card", biusart_lab_inputs)
		table.insert(biusart_lab_inputs, "production-science-pack")
		table.insert(biusart_lab_inputs, "utility-science-pack")
		table.insert(biusart_lab_inputs, "matter-tech-card")

	end

end