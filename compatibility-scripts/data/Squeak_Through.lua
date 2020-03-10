if not mods["Squeak Through"] then return end

require("__Squeak Through__/config")	

function addExcludedEntityToSqueakThrough(name, category)
	table.insert(exclusions, 
	{	
		{		   
			apply_when_object_exists = 
			{
				type = category,
				name = name,
			},
			excluded_prototype_names = 
			{
				name
			}
		}
	})
end	

local exclusions_to_add =
{	
	["lab"] =
	{
		"biusart_lab"
	},
	["furnace"] =
	{
		"kr-crusher"
	},
	["assembling-machine"] =
	{
		"kr-greenhouse"
	},
	["mining-drill"] =
	{
		"water-pumpjack"
	},
	["electric-energy-interface"] =
	{
		"kr-wind-turbine"
	},
	["container"] =
	{
		"medium-container",
		"big-container"
	},
	["logistic-container"] =
	{
		"medium-active-provider-container",
		"medium-buffer-container",
		"medium-passive-provider-container",
		"medium-requester-container",
		"medium-storage-container",
		"big-active-provider-container",
		"big-buffer-container",
		"big-passive-provider-container",
		"big-requester-container",
		"big-storage-container"
	}
}

if settings.startup["loaders"] and settings.startup["loaders"].value then
	if mods["space-exploration"] then
		exclusions_to_add["loader"] = 
		{
			"kr-loader",
			"kr-fast-loader",
			"kr-express-loader",
			"kr-superior-loader"
		}
	else
		exclusions_to_add["loader"] = 
		{
			"kr-loader",
			"kr-fast-loader",
			"kr-express-loader",
			"kr-superior-loader",
			"kr-se-loader"
		}		
	end
end

for category_name, entities in pairs(exclusions_to_add) do
	for _, entity_name in pairs(entities) do
		if krastorio.entities.exist(category_name, entity_name) then
			addExcludedEntityToSqueakThrough(entity_name, category_name)
			data.raw[category_name][entity_name].squeak_behaviour = false
		end
	end
end	
