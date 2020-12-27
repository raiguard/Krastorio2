if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
	-- Space collisions
	------------------------------------------------------------------------------------------------
	-- Null error check
	if se_allow_in_space == nil then
		se_allow_in_space = {}
	end

	-- Whitelisting the K2 entities in right way how SE manage the space entities,
	-- all entities in the se_allow_in_space CAN(POSITIVE) BE placed in the space
	se_allow_in_space["kr-fuel-refinery"]                     = true

	se_allow_in_space["kr-medium-container"]                  = true
	se_allow_in_space["kr-medium-active-provider-container"]  = true
	se_allow_in_space["kr-medium-buffer-container"]           = true
	se_allow_in_space["kr-medium-passive-provider-container"] = true
	se_allow_in_space["kr-medium-requester-container"]        = true
	se_allow_in_space["kr-medium-storage-container"]          = true

	se_allow_in_space["kr-big-container"]                     = true
	se_allow_in_space["kr-big-active-provider-container"]     = true
	se_allow_in_space["kr-big-buffer-container"]              = true
	se_allow_in_space["kr-big-passive-provider-container"]    = true
	se_allow_in_space["kr-big-requester-container"]           = true
	se_allow_in_space["kr-big-storage-container"]             = true

	se_allow_in_space["kr-antimatter-reactor"]                = true
	se_allow_in_space["kr-singularity-beacon"]                = true
	se_allow_in_space["kr-singularity-lab"]                   = true

	se_allow_in_space["kr-quarry-drill"]                      = true

	se_allow_in_space["fluid-storage-1"]                      = true
	se_allow_in_space["fluid-storage-2"]                      = true

	se_allow_in_space["kr-sentinel"]                          = true

	se_allow_in_space["kr-advanced-solar-panel"]              = true

	se_allow_in_space["kr-energy-storage"]                    = true
	se_allow_in_space["kr-intergalactic-transceiver"]         = true

	se_allow_in_space["kr-superior-inserter"]                 = true
	se_allow_in_space["kr-superior-long-inserter"]            = true
	se_allow_in_space["kr-superior-filter-inserter"]          = true
	se_allow_in_space["kr-superior-long-filter-inserter"]     = true
	se_allow_in_space["kr-superior-long-filter-inserter"]     = true

	se_allow_in_space["kr-se-loader"]                         = true

	-- Adding space collisions (Disabling some Krastorio 2 entities in space),
	-- this is a BLACKLIST, all entities in this table CAN'T(NOT) be placed in the space.
	local krastorio_entities_to_add =
	{
		["assembling-machine"] =
		{
			"kr-advanced-furnace",
			"kr-electrolysis-plant",
			"kr-filtration-plant",
			"kr-air-filter"
		},
		["boiler"] =
		{
			"se-electric-boiler"
		},
		["generator"] =
		{
			"kr-advanced-steam-turbine"
		},
		["furnace"] =
		{
			"kr-crusher",
			"kr-air-purifier"
		},
		["lab"] =
		{
			"biusart-lab"
		},
		["loader-1x1"] =
		{
			"kr-loader",
			"kr-fast-loader",
			"kr-express-loader",
			"kr-advanced-loader",
			"kr-superior-loader"
		},
		["mining-drill"] =
		{
			"kr-water-pumpjack"
		},
		["electric-energy-interface"] =
		{
			"kr-wind-turbine"
		}
	}

	for category_name, entities in pairs(krastorio_entities_to_add) do
		for _, entity_name in pairs(entities) do
			krastorio.entities.addCollisionMaskOnEntity(category_name, entity_name, space_collision_layer or "layer-14")
		end
	end
	------------------------------------------------------------------------------------------------
	-- Mark tech that are touched by SE
	function string.starts_with(string_to_check, start_string)
		return string.sub(string_to_check, 1, string.len(start_string)) == start_string
	end

	for technology_name, technology in pairs(data.raw.technology) do
		if string.starts_with(technology_name, "se-") then
			technology.check_science_packs_incompatibilities = false
		end
	end
	------------------------------------------------------------------------------------------------
end
