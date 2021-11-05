local constants = require("scripts.constants")

local virus = {}

-- Modifier to change the quantity of objects iterated for each round of the function, based on the total
local function get_removal_count(count)
  for limit, per in pairs(constants.virus_iteration_counts) do
    if count <= limit then
      return per
    end
  end
end

local function iterate_biter_virus(virus_data)
  local surface = virus_data.surface
  if not surface or not surface.valid then
    global.virus.biter[surface.index] = nil
    return
  end

  local entities = virus_data.entities
  local entities_killed = virus_data.entities_killed
  local entities_to_kill = virus_data.entities_to_kill
  local force = virus_data.force
  local len = virus_data.entities_len

  -- Kill some entities
  for _ = 1, virus_data.amount_per_iteration do
    if entities_killed >= entities_to_kill then
      global.virus.biter[surface.index] = nil
      break
    end

    local i = math.random(1, len)
    local entity = entities[i]
    if entity and entity.valid then
      entity.die(force)

      -- Move the element at the end to the gap
      -- This removes the element at `i` while achieving O(1) performance
      entities[i] = entities[len]
      entities[len] = nil

      entities_killed = entities_killed + 1
      len = len - 1
    end
  end

  virus_data.entities_killed = entities_killed
  virus_data.tiles_len = len
end

local function init_biter_virus(player, surface)
  local biter_viruses = global.virus.biter
  if not biter_viruses[surface.index] then
    -- Reduce evolution factor
    local enemy = game.forces.enemy
    enemy.evolution_factor = enemy.evolution_factor * constants.biter_virus_evolution_multiplier

    -- Begin gradual enemy killoff
    local enemy_entities = surface.find_entities_filtered({ force = "enemy" })
    local len = #enemy_entities
    if len > 0 then
      biter_viruses[surface.index] = {
        amount_per_iteration = math.floor(len / get_removal_count(len)),
        entities = enemy_entities,
        entities_killed = 0,
        entities_len = len,
        entities_to_kill = len / 2.5,
        force = player.force,
        surface = surface,
      }
    end
  end
end

local function iterate_creep_virus(virus_data)
  local surface = virus_data.surface
  if not surface or not surface.valid then
    global.virus.creep[surface.index] = nil
    return
  end

  local creeps = virus_data.tiles
  local len = virus_data.tiles_len
  local tiles_to_replace = {}
  for i = 1, virus_data.amount_per_iteration do
    if len == 0 then
      global.virus.creep[surface.index] = nil
      break
    end
    local j = math.random(1, len)
    local tile = creeps[j]
    if tile and tile.valid then
      tiles_to_replace[i] = { name = tile.hidden_tile or "landfill", position = tile.position }
      -- Move the element at the end to the gap
      -- This removes the element at `i` while achieving O(1) performance
      creeps[j] = creeps[len]
      creeps[len] = nil
      len = len - 1
    end
  end
  virus_data.tiles_len = len
  surface.set_tiles(tiles_to_replace)
end

local function init_creep_virus(surface)
  local creep_viruses = global.virus.creep
  if not creep_viruses[surface.index] then
    -- Disable creep generation on this surface
    global.creep.surfaces[surface.index] = nil

    -- Begin creep removal
    -- FIXME: This causes insane amounts of lag with lots of creep tiles
    local creep_tiles = surface.find_tiles_filtered({ name = "kr-creep" })
    local num_creeps = #creep_tiles
    creep_viruses[surface.index] = {
      amount_per_iteration = math.floor(num_creeps / get_removal_count(num_creeps)),
      surface = surface,
      tiles = creep_tiles,
      tiles_len = num_creeps,
    }
  end
end

function virus.init()
  global.virus = {
    biter = {},
    creep = {},
  }
end

function virus.on_player_used_capsule(e)
  local item = e.item
  if not item or not item.valid then
    return
  end

  local player = game.get_player(e.player_index)
  local surface = player.surface

  if item.name == "kr-biter-virus" then
    init_biter_virus(player, surface)
  elseif item.name == "kr-creep-virus" then
    init_creep_virus(surface)
  end
end

function virus.iterate()
  for _, biter_virus in pairs(global.virus.biter) do
    iterate_biter_virus(biter_virus)
  end
  for _, creep_virus in pairs(global.virus.creep) do
    iterate_creep_virus(creep_virus)
  end
end

return virus
