-----------------------------------------------------------------------------
-- -- Modifing spawner

-- Sub set of possible biter faction unit
local biter_types = {
  ["small-biter"] = true,
  ["medium-biter"] = true,
  ["big-biter"] = true,
  ["behemoth-biter"] = true,
}

local spitter_types = {
  ["small-spitter"] = true,
  ["medium-spitter"] = true,
  ["big-spitter"] = true,
  ["behemoth-spitter"] = true,
}

-- Improver for ArmouredBiters mod
if mods["ArmouredBiters"] then
  biter_types["small-armoured-biter"] = true
  biter_types["medium-armoured-biter"] = true
  biter_types["big-armoured-biter"] = true
  biter_types["behemoth-armoured-biter"] = true
end

-- Improver for fancy Natural_Evolution_Enemies mod
if mods["Natural_Evolution_Enemies"] then
  for i = 1, 20 do
    biter_types["ne-biter-breeder-" .. i] = true
    biter_types["ne-biter-fire-" .. i] = true
    biter_types["ne-biter-fast-" .. i] = true
    biter_types["ne-biter-fastL-" .. i] = true
    biter_types["ne-biter-wallbreaker-" .. i] = true
    biter_types["ne-biter-tank-" .. i] = true

    spitter_types["ne-spitter-breeder-" .. i] = true
    spitter_types["ne-spitter-fire-" .. i] = true
    spitter_types["ne-spitter-ulaunch-" .. i] = true
    spitter_types["ne-spitter-webshooter-" .. i] = true
    spitter_types["ne-spitter-mine-" .. i] = true
  end
end

-- Improver for bobenemies
if mods["bobenemies"] then
  biter_types["bob-big-piercing-biter"] = true
  biter_types["bob-huge-acid-biter"] = true
  biter_types["bob-huge-explosive-biter"] = true
  biter_types["bob-giant-poison-biter"] = true
  biter_types["bob-giant-fire-biter"] = true
  biter_types["bob-titan-biter"] = true
  biter_types["bob-behemoth-biter"] = true
  biter_types["bob-leviathan-biter"] = true

  spitter_types["bob-big-electric-spitter"] = true
  spitter_types["bob-huge-explosive-spitter"] = true
  spitter_types["bob-huge-acid-spitter"] = true
  spitter_types["bob-huge-acid-spitter-corpse"] = true
  spitter_types["bob-giant-fire-spitter"] = true
  spitter_types["bob-giant-poison-spitter"] = true
  spitter_types["bob-titan-spitter"] = true
  spitter_types["bob-behemoth-spitter"] = true
  spitter_types["bob-leviathan-spitter"] = true
end

-- -- -- Vanilla enemy units

-- -- Spawners spawn results rate

-- From evolution_factor 0.3 the weight for medium-biter is linearly rising from 0 to 0.3,
-- this means for example that when the evolution_factor is 0.45 the probability of spawning,
-- a small biter is 66% while probability for medium biter is 33%.
-- For evolution factor of 1 the spawning probabilities are: small-biter 0%, medium-biter 1/8, big-biter 4/8, behemoth biter 3/8.
spawn_rates = {
  ["small-biter"] = { { 0.0, 0.8 }, { 1.0, 0.01 } },
  ["medium-biter"] = { { 0.2, 0.0 }, { 0.6, 0.3 }, { 1.0, 0.1 } },
  ["big-biter"] = { { 0.5, 0.0 }, { 1.0, 0.5 } },
  ["behemoth-biter"] = { { 0.9, 0.0 }, { 1.0, 0.2 } },
  ["small-spitter"] = { { 0.25, 0.0 }, { 0.5, 0.3 }, { 1.0, 0.1 } },
  ["medium-spitter"] = { { 0.4, 0.0 }, { 0.7, 0.3 }, { 1.0, 0.1 } },
  ["big-spitter"] = { { 0.5, 0.0 }, { 1.0, 0.5 } },
  ["behemoth-spitter"] = { { 0.9, 0.0 }, { 1.0, 0.2 } },
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

data.raw["unit-spawner"]["biter-spawner"].max_health = 750
data.raw["unit-spawner"]["spitter-spawner"].max_health = 750

-- -- Biters stats

data.raw["unit"]["medium-biter"].max_health = 100
data.raw["unit"]["big-biter"].max_health = 500
data.raw["unit"]["behemoth-biter"].max_health = 3500

data.raw["unit"]["behemoth-biter"].pollution_to_join_attack = 500

-- -- Spitters stats

data.raw["unit"]["medium-spitter"].max_health = 75
data.raw["unit"]["big-spitter"].max_health = 350
data.raw["unit"]["behemoth-spitter"].max_health = 2500

data.raw["unit"]["behemoth-spitter"].pollution_to_join_attack = 500

-- -- Worms stats

data.raw["turret"]["medium-worm-turret"].max_health = 950
data.raw["turret"]["big-worm-turret"].max_health = 2500
data.raw["turret"]["behemoth-worm-turret"].max_health = 5000
