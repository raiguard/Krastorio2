-- -- -- New Equipments categories
data:extend(
{
	-- -- Subgroups
	-- New character equipment category
	{
		type  = "item-subgroup",
		group = "combat",
		name  = "character-equipment",
		order = "e-e2"		
    },
	-- New vehicle equipment category
	{
		type = "item-subgroup",
		group = "combat",
		name = "vehicle-motor",
		order = "e-e3"		
    },
	-- -- Group
	-- New universal equipment category
	{
		type = "equipment-category",
		name = "universal-equipment"
	}	
})
