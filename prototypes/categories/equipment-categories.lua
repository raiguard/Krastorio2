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
	-- New universal equipment category (all grids can use this)
	{
		type = "equipment-category",
		name = "universal-equipment"
	},	
	-- New vehicle equipment category (only vehicles grids can use these)
	{
		type = "equipment-category",
		name = "vehicle-equipment"
	},
	{
		type = "equipment-category",
		name = "vehicle-motor"
	},
	{
		type = "equipment-category",
		name = "aircraft-equipment"
	}
})
