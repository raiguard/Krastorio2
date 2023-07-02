local constants = require("scripts.constants")

local tesla_coil = {}

function tesla_coil.init()
  global.tesla_coil = {
    --- @type table<uint, BeamData>
    beams = {},
    --- @type table<uint, TowerData>
    turrets = {},
    --- @type table<uint, TowerData>
    towers = {},
    --- @type table<uint, TargetData>
    targets = {},
  }
end

function tesla_coil.get_absorber_buffer_capacity()
  global.tesla_coil.absorber_buffer_capacity =
    game.equipment_prototypes["energy-absorber"].energy_source.buffer_capacity
end

-- TOWER
-- The entity that is interacted with

--- @param source_entity LuaEntity
function tesla_coil.build(source_entity)
  local surface = source_entity.surface
  local unit_number = source_entity.unit_number --[[@as uint]]

  local turret = surface.create_entity({
    name = "kr-tesla-coil-turret",
    position = source_entity.position,
    force = game.forces["kr-internal-turrets"],
    create_build_effect_smoke = false,
    raise_built = true,
  })
  if not turret or not turret.valid then
    game.print(
      "Building tesla failed due to AAI Programmable Vehicles; This tesla coil will not function. To fix this, change the 'Deadzone construction denial range' map setting to zero."
    )
    source_entity.active = false
    return
  end
  turret.destructible = false

  local collision_entity = surface.create_entity({
    name = "kr-tesla-coil-collision",
    position = source_entity.position,
    force = "neutral",
    create_build_effect_smoke = false,
    raise_built = true,
  })
  collision_entity.destructible = false

  --- @class TowerData
  local data = {
    entities = {
      collision = collision_entity,
      tower = source_entity,
      turret = turret,
    },
    tower_unit_number = unit_number,
    turret_unit_number = turret.unit_number,
  }

  global.tesla_coil.turrets[data.turret_unit_number] = data
  global.tesla_coil.towers[unit_number] = data
end

--- @param entity LuaEntity
function tesla_coil.destroy(entity)
  -- Beams will automatically get destroyed
  local unit_number = entity.unit_number --[[@as uint]]
  local tower_data = global.tesla_coil.towers[unit_number]
  if tower_data then
    global.tesla_coil.turrets[tower_data.turret_unit_number] = nil
    global.tesla_coil.towers[unit_number] = nil

    for _, entity in pairs(tower_data.entities) do
      if entity and entity.valid and entity.type ~= "electric-energy-interface" then
        entity.destroy()
      end
    end
  end
end

-- TARGET
-- An entity that will receive energy from a tesla coil

--- @param grid LuaEquipmentGrid
--- @return LuaEquipment|nil
local function find_absorber_in_grid(grid)
  -- Find the energy absorber
  for _, equipment in pairs(grid.equipment) do
    if equipment.name == "energy-absorber" then
      return equipment
    end
  end
end

--- @param target LuaEntity
--- @return GridData?
local function get_grid_data(target)
  --- @type LuaEquipmentGrid
  local grid
  if target.type == "character" then
    local armor_inventory = target.get_inventory(defines.inventory.character_armor)
    if armor_inventory and armor_inventory.valid then
      local armor = armor_inventory[1]
      if armor and armor.valid_for_read then
        grid = armor.grid
      end
    end
  else
    grid = target.grid
  end

  if grid then
    --- @class GridData
    local data = {
      absorber = find_absorber_in_grid(grid),
      grid = grid,
    }

    return data
  end
end

--- Updates the absorber object in a target's equipment grid
--- @param grid LuaEquipmentGrid
function tesla_coil.update_target_grid(grid)
  for _, target_data in pairs(global.tesla_coil.targets) do
    local grid_data = target_data.grid_data
    if grid_data.grid.valid and grid_data.grid == grid then
      grid_data.absorber = find_absorber_in_grid(grid)
    end
  end
end

--- @param target LuaEntity
--- @param tower_data TowerData
function tesla_coil.add_target(target, tower_data)
  local target_unit_number = target.unit_number --[[@as uint]]
  local tower = tower_data.entities.tower
  if not tower.valid or tower.energy < constants.tesla_coil.required_energy then
    return
  end
  -- Check the target's equipment grid for an energy absorber
  local grid_data = get_grid_data(target)
  if grid_data and grid_data.absorber and grid_data.absorber.valid then
    --- @class TargetData
    local target_data = {
      connections = {
        --- @type table<uint, ConnectionData>
        by_beam = {},
        --- @type table<uint, ConnectionData>
        by_tower = {},
      },
      entity = target,
      --- @type uint?
      full_tick = nil,
      grid_data = grid_data,
      unit_number = target_unit_number,
    }
    global.tesla_coil.targets[target_unit_number] = target_data

    return target_data
  end
end

--- @param target_unit_number uint
function tesla_coil.remove_target(target_unit_number)
  global.tesla_coil.targets[target_unit_number] = nil
end

-- CONNECTION
-- A connection between a tower and a target, comprising of a beam
-- There can be unlimited connections per target

--- @param target_data TargetData
--- @param tower_data TowerData
--- @return boolean
function tesla_coil.add_connection(target_data, tower_data)
  -- Check if the absorber has space
  local capacity = global.tesla_coil.absorber_buffer_capacity
  local absorber = target_data.grid_data.absorber
  if not absorber or not absorber.valid then
    tesla_coil.remove_target(target_data.unit_number)
    return false
  end

  local tower = tower_data.entities.tower
  if not tower.valid then
    tesla_coil.remove_target(target_data.unit_number)
    return false
  end

  if absorber.energy >= capacity then
    return false
  end

  -- Create beam entity
  local beam = tower_data.entities.tower.surface.create_entity({
    name = "kr-tesla-coil-electric-beam",
    source = tower_data.entities.tower,
    source_offset = { 0, -2.2 },
    position = tower_data.entities.tower.position,
    target = target_data.entity,
    duration = 0,
    max_length = constants.tesla_coil.range,
    force = tower_data.entities.tower.force,
    raise_built = true,
  })
  if not beam then
    return false
  end
  local beam_number = script.register_on_entity_destroyed(beam)

  --- @class BeamData
  global.tesla_coil.beams[beam_number] = {
    beam = beam,
    beam_number = beam_number,
    target_data = target_data,
    tower_data = tower_data,
  }

  --- @class ConnectionData
  local connection_data = {
    beam = beam,
    beam_number = beam_number,
    tower_data = tower_data,
  }
  target_data.connections.by_beam[beam_number] = connection_data
  target_data.connections.by_tower[tower_data.tower_unit_number] = connection_data

  return true
end

--- @param target_data TargetData
--- @param tower_data TowerData
function tesla_coil.update_connection(target_data, tower_data)
  local absorber = target_data.grid_data.absorber

  -- Check if the tower is powered
  if not absorber or not absorber.valid or tower_data.entities.tower.energy < constants.tesla_coil.required_energy then
    tesla_coil.remove_connection(target_data, tower_data)
    return
  end

  local capacity = global.tesla_coil.absorber_buffer_capacity
  local energy = absorber.energy
  if energy < capacity then
    -- Calculate how much to add
    local to_add = constants.tesla_coil.charging_rate / 60 * constants.tesla_coil.cooldown
    local result = energy + to_add
    local tower = tower_data.entities.tower

    if result >= capacity then
      absorber.energy = capacity
      target_data.full_tick = game.tick
    else
      absorber.energy = result
      target_data.full_tick = nil
    end

    tower.energy = tower.energy - (to_add * constants.tesla_coil.loss_multiplier)
  elseif target_data.full_tick and target_data.full_tick + constants.tesla_coil.cooldown <= game.tick then
    tesla_coil.remove_connection(target_data, tower_data)
  end
end

--- @param target_data TargetData
--- @param tower_data TowerData
function tesla_coil.remove_connection(target_data, tower_data)
  local connection_data = target_data.connections.by_tower[tower_data.tower_unit_number]

  -- Destroy beam if it still exists
  if connection_data.beam.valid then
    connection_data.beam.destroy()
  end

  local beam_number = connection_data.beam_number
  global.tesla_coil.beams[beam_number] = nil

  target_data.connections.by_beam[beam_number] = nil
  target_data.connections.by_tower[tower_data.tower_unit_number] = nil

  if table_size(target_data.connections.by_beam) == 0 then
    tesla_coil.remove_target(target_data.unit_number)
  end
end

--- @param target LuaEntity
--- @param turret LuaEntity
function tesla_coil.process_turret_fire(target, turret)
  local tower_data = global.tesla_coil.turrets[turret.unit_number]
  if not tower_data then
    return
  end

  local target_data = global.tesla_coil.targets[target.unit_number]
  if not target_data then
    target_data = tesla_coil.add_target(target, tower_data)
  end

  if target_data then
    -- Just in case (#182)
    if not target_data.entity.valid then
      target_data.entity = target
    end
    local connection = target_data.connections.by_tower[tower_data.tower_unit_number]
    if connection or tesla_coil.add_connection(target_data, tower_data) then
      tesla_coil.update_connection(target_data, tower_data)
    end
  end
end

--- @param e EventData.on_player_armor_inventory_changed
function tesla_coil.on_player_armor_inventory_changed(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  local character = player.character
  if not character then
    return
  end
  --- @type TargetData
  local target_data = global.tesla_coil.targets[character.unit_number]
  if target_data then
    for _, connection_data in pairs(target_data.connections.by_tower) do
      tesla_coil.remove_connection(target_data, connection_data.tower_data)
    end
  end
  tesla_coil.remove_target(character.unit_number)
end

return tesla_coil

--[[
  -- Quick testing code
  event.register(remote.call("EditorExtensions", "debug_world_ready_event"), function()
    local surface = game.surfaces.nauvis

    local coils = {
      { x = -9.5, y = -9.5 },
      { x = 10.5, y = -9.5 },
      { x = -9.5, y = 10.5 },
      { x = 10.5, y = 10.5 },
    }
    for _, position in pairs(coils) do
      surface.create_entity({
        name = "kr-tesla-coil",
        direction = defines.direction.north,
        position = position,
        force = game.forces.player,
        raise_built = true,
        create_build_effect_smoke = false,
      })
    end
    surface.create_entity({
      name = "ee-infinity-accumulator-primary-output",
      position = { x = -1, y = -9 },
      force = game.forces.player,
      raise_built = true,
      create_build_effect_smoke = false,
    })
    surface.create_entity({
      name = "ee-super-substation",
      position = { x = 1, y = -9 },
      force = game.forces.player,
      raise_built = true,
      create_build_effect_smoke = false,
    })

    local character = game.get_player(1).character
    local armor_inventory = character.get_inventory(defines.inventory.character_armor)
    if armor_inventory and armor_inventory.valid then
      local armor = armor_inventory[1]
      if armor and armor.valid_for_read then
        armor.grid.put({ name = "energy-absorber", position = { 5, 5 } })
      end
    end
  end)
]]
