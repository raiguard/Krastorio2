if mods ["angelsbioprocessing"] then
	
	-- Remove angels alien science pack from non wanted labs
	local function removeFromLab(name, inputs)
		for key, pack in pairs(inputs) do
			if pack == name then
				table.remove(inputs, key)
				break
			end
		end
	end
	removeFromLab("token-bio", data.raw.lab["biusart-lab"].inputs)
	removeFromLab("token-bio", data.raw.lab["kr-singularity-lab"].inputs)
	
	krastorio.technologies.addResearchUnitIngredient("bio-farm-alien", "token-bio", 1, true)

	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-2", "token-bio", 1, true)
	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-3", "token-bio", 1, true)

	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-desert-2", "token-bio", 1, true)
	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-desert-3", "token-bio", 1, true)

	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-swamp-2", "token-bio", 1, true)
	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-swamp-3", "token-bio", 1, true)

	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-temperate-2", "token-bio", 1, true)
	krastorio.technologies.addResearchUnitIngredient("bio-arboretum-temperate-3", "token-bio", 1, true)

	krastorio.technologies.addResearchUnitIngredient("bio-desert-farm", "token-bio", 1, true)

	krastorio.technologies.addResearchUnitIngredient("bio-swamp-farm", "token-bio", 1, true)

	krastorio.technologies.addResearchUnitIngredient("bio-temperate-farm", "token-bio", 1, true)
	
end
