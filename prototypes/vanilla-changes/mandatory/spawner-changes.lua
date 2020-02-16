-----------------------------------------------------------------------------
-- -- Functions

-- Return a table with spawner integration sprite.
local function getSpawnerIntegrationSprite()
	return
	{
		filename = kr_entities_path .. "spawner/spawner-idle-integration.png",
		variation_count = 4,
		width = 258,
		height = 188,
		shift = util.by_pixel(2, -2),
		frame_count = 1,
		line_length = 1,
		hr_version =
		{
			filename = kr_entities_path .. "spawner/hr-spawner-idle-integration.png",
			variation_count = 4,
			width = 522,
			height = 380,
			shift = util.by_pixel(3, -3),
			frame_count = 1,
			line_length = 1,
			scale = 0.5
		}
	}
end

-- Return a table with spawner idle animation sprite.
-- @ variation, multiplier of y.
-- @ tint, color of mask.
local function getSpawnerIdleAnimation(variation, tint)
	return
	{
		layers =
		{
			{
				filename = kr_entities_path .. "spawner/spawner-idle.png",
				line_length = 4,
				width = 248,
				height = 180,
				frame_count = 8,
				animation_speed = 0.18,
				direction_count = 1,
				run_mode = "forward-then-backward",
				shift = util.by_pixel(2, -4),
				y = variation * 180 * 2,
				hr_version =
				{
					filename = kr_entities_path .. "spawner/hr-spawner-idle.png",
					line_length = 4,
					width = 490,
					height = 354,
					frame_count = 8,
					animation_speed = 0.18,
					direction_count = 1,
					run_mode = "forward-then-backward",
					shift = util.by_pixel(3, -2),
					y = variation * 354 * 2,
					scale = 0.5
				}
			},
			{
				filename = kr_entities_path .. "spawner/spawner-idle-mask.png",
				flags = { "mask" },
				width = 140,
				height = 118,
				frame_count = 8,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				shift = util.by_pixel(-2, -14),
				line_length = 4,
				tint = tint,
				y = variation * 118 * 2,
				hr_version =
				{
					filename = kr_entities_path .. "spawner/hr-spawner-idle-mask.png",
					flags = { "mask" },
					width = 276,
					height = 234,
					frame_count = 8,
					animation_speed = 0.18,
					run_mode = "forward-then-backward",
					shift = util.by_pixel(-1, -14),
					line_length = 4,
					tint = tint,
					y = variation * 234 * 2,
					scale = 0.5
				}
			},
			{
				filename = kr_entities_path .. "spawner/spawner-idle-shadow.png",
				draw_as_shadow = true,
				width = 232,
				height = 176,
				frame_count = 8,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				shift = util.by_pixel(36, -2),
				line_length = 4,
				y = variation * 176 * 2,
				hr_version =
				{
					filename = kr_entities_path .. "spawner/hr-spawner-idle-shadow.png",
					draw_as_shadow = true,
					width = 464,
					height = 406,
					frame_count = 8,
					animation_speed = 0.18,
					run_mode = "forward-then-backward",
					shift = util.by_pixel(36, 10),
					line_length = 4,
					y = variation * 406 * 2,
					scale = 0.5
				}
			}
		}
	}
end

-- Return a table with spawner die animation sprite.
-- @ variation, multiplier of y.
-- @ tint, color of mask.
local function getSpawnerDieAnimation(variation, tint)
	return
	{
		layers =
		{
			{
				filename = kr_entities_path .. "spawner/spawner-die.png",
				line_length = 8,
				width = 248,
				height = 178,
				frame_count = 8,
				direction_count = 1,
				shift = util.by_pixel(2, -2),
				y = variation * 178,
				hr_version =
				{
					filename = kr_entities_path .. "spawner/hr-spawner-die.png",
					line_length = 8,
					width = 490,
					height = 354,
					frame_count = 8,
					direction_count = 1,
					shift = util.by_pixel(3, -2),
					y = variation * 354,
					scale = 0.5
				}
			},
			{
				filename = kr_entities_path .. "spawner/spawner-die-mask.png",
				flags = { "mask" },
				width = 140,
				height = 118,
				frame_count = 8,
				direction_count = 1,
				shift = util.by_pixel(-2, -14),
				line_length = 8,
				tint = tint,
				y = variation * 118,
				hr_version =
				{
					filename = kr_entities_path .. "spawner/hr-spawner-die-mask.png",
					flags = { "mask" },
					width = 276,
					height = 234,
					frame_count = 8,
					direction_count = 1,
					shift = util.by_pixel(-1, -14),
					line_length = 8,
					tint = tint,
					y = variation * 234,
					scale = 0.5
				}
			},
			{
				filename = kr_entities_path .. "spawner/spawner-die-shadow.png",
				draw_as_shadow = true,
				width = 232,
				height = 176,
				frame_count = 8,
				direction_count = 1,
				shift = util.by_pixel(36, -2),
				line_length = 8,
				y = variation * 176,
				hr_version =
				{
					filename = kr_entities_path .. "spawner/hr-spawner-die-shadow.png",
					draw_as_shadow = true,
					width = 466,
					height = 406,
					frame_count = 8,
					direction_count = 1,
					shift = util.by_pixel(36, 10),
					line_length = 8,
					y = variation * 406,
					scale = 0.5
				}
			}
		}
	}
end

-- Given a sprite return the first tint founded inside, or false.
-- @sprite, sprite where search the tint (a table).
local function getAnyTint(sprite)
	local founded_tint = false
	
	if sprite["tint"] then
		founded_tint = sprite["tint"]
	end
	if not founded_tint then
		for _, v in pairs(sprite) do
			if type(v) == "table" then
				founded_tint = getAnyTint(v)
				if founded_tint then
					break
				end
			end
		end
	end
	return founded_tint
end

-- Given a spawner change the idle(animation) and integration sprites
-- with the custom Krastorio 2 sprite trying to keep the old tint mask.
-- @spawner, spawner entity to change animations.
-- @default_tint, tint to use in case that one sprite don't have a tint for the mask.
local function applyNewIdleSprites(spawner, default_tint)
	default_tint = default_tint or biter_spawner_tint
	local tint = nil
	for i = 1, #spawner.animations do
		tint = getAnyTint(spawner.animations[i])
		if tint then
			spawner.animations[i] = getSpawnerIdleAnimation(i-1, tint)
		else
			spawner.animations[i] = getSpawnerIdleAnimation(i-1, default_tint)
		end
		tint = false
	end
	spawner.integration = getSpawnerIntegrationSprite()
end

-- Given a spawner change the die sprites.
-- with the custom Krastorio 2 sprite trying to keep the old tint mask.
-- @spawner, spawner entity to change animations.
local function applyNewDieSprites(spawner, default_tint)
	default_tint = default_tint or biter_spawner_tint
	local tint = false
	for i = 1, #spawner.animation do
		tint = getAnyTint(spawner.animation[i])
		if tint then
			spawner.animation[i] = getSpawnerDieAnimation(i-1, tint)
		else
			spawner.animation[i] = getSpawnerDieAnimation(i-1, default_tint)
		end
		tint = false
	end
end


local function spawnAnyOf(result_units, spawn_types, main_type)
	if result_units then
		for _, result_unit in pairs(result_units) do
			if spawn_types[result_unit[1]] or string.find(result_unit[1], main_type) then
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------
-- -- Modifing spawner

-- Sub set of possible biter faction unit
local biter_types =
{
	["small-biter"]      = true,
	["medium-biter"]     = true,
	["big-biter"]        = true,
	["behemoth-biter"]   = true
}

local spitter_types =
{
	["small-spitter"]    = true,
	["medium-spitter"]   = true,
	["big-spitter"]      = true,
	["behemoth-spitter"] = true
}

-- Improver for ArmouredBiters mod
if mods["ArmouredBiters"] then
	biter_types["small-armoured-biter"]    = true
	biter_types["medium-armoured-biter"]   = true
	biter_types["big-armoured-biter"]      = true
	biter_types["behemoth-armoured-biter"] = true
end

-- Improver for fancy Natural_Evolution_Enemies mod
if mods["Natural_Evolution_Enemies"] then
	for i = 1, 20 do
		biter_types["ne-biter-breeder-" .. i]        = true
		biter_types["ne-biter-fire-" .. i]           = true
		biter_types["ne-biter-fast-" .. i]           = true
		biter_types["ne-biter-fastL-" .. i]          = true
		biter_types["ne-biter-wallbreaker-" .. i]    = true
		biter_types["ne-biter-tank-" .. i]           = true
		
		spitter_types["ne-spitter-breeder-" .. i]    = true
		spitter_types["ne-spitter-fire-" .. i]       = true
		spitter_types["ne-spitter-ulaunch-" .. i]    = true
		spitter_types["ne-spitter-webshooter-" .. i] = true
		spitter_types["ne-spitter-mine-" .. i]       = true
	end
end

-- Improver for bobenemies
if mods["bobenemies"] then
	biter_types["bob-big-piercing-biter"]         = true
	biter_types["bob-huge-acid-biter"]            = true
	biter_types["bob-huge-explosive-biter"]       = true
	biter_types["bob-giant-poison-biter"]         = true
	biter_types["bob-giant-fire-biter"]           = true
	biter_types["bob-titan-biter"]                = true
	biter_types["bob-behemoth-biter"]             = true
	biter_types["bob-leviathan-biter"]            = true
	
	spitter_types["bob-big-electric-spitter"]     = true
	spitter_types["bob-huge-explosive-spitter"]   = true
	spitter_types["bob-huge-acid-spitter"]        = true
	spitter_types["bob-huge-acid-spitter-corpse"] = true
	spitter_types["bob-giant-fire-spitter"]       = true
	spitter_types["bob-giant-poison-spitter"]     = true
	spitter_types["bob-titan-spitter"]            = true
	spitter_types["bob-behemoth-spitter"]         = true
	spitter_types["bob-leviathan-spitter"]        = true
end

-- Apply for any spawner that spawn the know enemy units
for _, spawner in pairs(data.raw["unit-spawner"]) do
	if spawnAnyOf(spawner.result_units, biter_types, "biter") then
		applyNewIdleSprites(spawner, biter_spawner_tint)
		if spawner.corpse and data.raw["corpse"][spawner.corpse] then -- if exist the entity corpse associated
			applyNewDieSprites(data.raw["corpse"][spawner.corpse], biter_spawner_tint)
		end
	elseif spawnAnyOf(spawner.result_units, spitter_types, "spitter") then
		applyNewIdleSprites(spawner, spitter_spawner_tint)
		if spawner.corpse and data.raw["corpse"][spawner.corpse] then
			applyNewDieSprites(data.raw["corpse"][spawner.corpse], spitter_spawner_tint)
		end
	end
end

-- -- -- Vanilla enemy units

-- -- Spawners spawn results rate

-- From evolution_factor 0.3 the weight for medium-biter is linearly rising from 0 to 0.3,
-- this means for example that when the evolution_factor is 0.45 the probability of spawning,
-- a small biter is 66% while probability for medium biter is 33%.
-- For evolution factor of 1 the spawning probabilities are: small-biter 0%, medium-biter 1/8, big-biter 4/8, behemoth biter 3/8.
spawn_rates =
{
	["small-biter"]      = {{0.0, 0.5}, {1.0, 0.1}},
	["medium-biter"]     = {{0.2, 0.0}, {0.6, 0.3}, {1.0, 0.1}},
	["big-biter"]        = {{0.5, 0.0}, {1.0, 0.5}},
	["behemoth-biter"]   = {{0.9, 0.0}, {1.0, 0.2}},
	["small-spitter"]    = {{0.25, 0.0}, {0.5, 0.3}, {1.0, 0.1}},
	["medium-spitter"]   = {{0.4, 0.0}, {0.7, 0.3}, {1.0, 0.1}},
	["big-spitter"]      = {{0.5, 0.0}, {1.0, 0.5}},
	["behemoth-spitter"] = {{0.9, 0.0}, {1.0, 0.2}}
}

for _, spawner in pairs(data.raw["unit-spawner"]) do
	local result_units = spawner.result_units
	if result_units then
		for _, result_unit in pairs(result_units) do
			if spawn_rates[result_unit[1]] then
				result_unit[2] = spawn_rates[result_unit[1]]
			end
		end
	end
end

-- -- Spawner stats

data.raw["unit-spawner"]["biter-spawner"].max_health = 1500
data.raw["unit-spawner"]["spitter-spawner"].max_health = 1500

-- -- Biters stats

data.raw["unit"]["medium-biter"].max_health = 100
data.raw["unit"]["big-biter"].max_health = 500
data.raw["unit"]["behemoth-biter"].max_health = 4500

data.raw["unit"]["behemoth-biter"].pollution_to_join_attack = 500

-- -- Spitters stats

data.raw["unit"]["medium-spitter"].max_health = 75
data.raw["unit"]["big-spitter"].max_health = 375
data.raw["unit"]["behemoth-spitter"].max_health = 3000

data.raw["unit"]["behemoth-spitter"].pollution_to_join_attack = 500

-- -- Worms stats

data.raw["turret"]["medium-worm-turret"].max_health = 750
data.raw["turret"]["big-worm-turret"].max_health = 3000
data.raw["turret"]["behemoth-worm-turret"].max_health = 7500