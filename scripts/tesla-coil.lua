local charging_rate = 3000000 -- 3 MW
local cooldown = 10
local loss_multiplier = 1.8
local range = 20
local required_energy = 10000000 -- 10 MW

local absorber_buffer_capacity = prototypes.equipment["energy-absorber-equipment"].energy_source.buffer_capacity

-- TOWER
-- The entity that is interacted with

--- @param e EntityBuiltEvent
local function on_entity_built(e)
  local entity = e.entity or e.created_entity or e.destination
  if not entity or not entity.valid then
    return
  end
  local entity_name = entity.name

  -- Internal entities should not be cloned
  if
    e.name == defines.events.on_entity_cloned
    and (entity_name == "kr-tesla-coil-turret" or entity_name == "kr-tesla-coil-collision")
  then
    entity.destroy()
    return
  end

  if entity_name ~= "kr-tesla-coil" then
    return
  end

  local surface = entity.surface
  local unit_number = entity.unit_number --[[@as uint]]

  local turret = surface.create_entity({
    name = "kr-tesla-coil-turret",
    position = entity.position,
    force = game.forces["kr-internal-turrets"],
    create_build_effect_smoke = false,
    raise_built = true,
  })
  if not turret or not turret.valid then
    game.print(
      "Building tesla failed due to AAI Programmable Vehicles; This tesla coil will not function. To fix this, change the 'Deadzone construction denial range' map setting to zero."
    )
    entity.active = false
    return
  end
  turret.destructible = false

  local collision_entity = surface.create_entity({
    name = "kr-tesla-coil-collision",
    position = entity.position,
    force = entity.force,
    create_build_effect_smoke = false,
    raise_built = true,
  })
  collision_entity.destructible = false

  --- @class TowerData
  local data = {
    entities = {
      collision = collision_entity,
      tower = entity,
      turret = turret,
    },
    tower_unit_number = unit_number,
    turret_unit_number = turret.unit_number,
  }

  storage.tesla_coil.turrets[data.turret_unit_number] = data
  storage.tesla_coil.towers[unit_number] = data
end

--- @param entity LuaEntity
local function destroy_if_valid(entity)
  if entity.valid then
    entity.destroy()
  end
end

--- @param e EntityDestroyedEvent
local function on_entity_destroyed(e)
  local entity = e.entity
  if not entity or not entity.valid or entity.name ~= "kr-tesla-coil" then
    return
  end

  local unit_number = entity.unit_number
  assert(unit_number)
  local tower_data = storage.tesla_coil.towers[unit_number]
  if not tower_data then
    return
  end

  destroy_if_valid(tower_data.entities.collision)
  destroy_if_valid(tower_data.entities.turret)

  storage.tesla_coil.turrets[tower_data.turret_unit_number] = nil
  storage.tesla_coil.towers[unit_number] = nil
end

-- TARGET
-- An entity that will receive energy from a tesla coil

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
      absorber = grid.find("energy-absorber-equipment"),
      grid = grid,
    }

    return data
  end
end

--- Updates the absorber object in a target's equipment grid
--- @param grid LuaEquipmentGrid
local function update_target_grid(grid)
  for _, target_data in pairs(storage.tesla_coil.targets) do
    local grid_data = target_data.grid_data
    if grid_data.grid.valid and grid_data.grid == grid then
      grid_data.absorber = grid.find("energy-absorber-equipment")
    end
  end
end

--- @param target LuaEntity
--- @param tower_data TowerData
local function add_target(target, tower_data)
  local target_unit_number = target.unit_number --[[@as uint]]
  local tower = tower_data.entities.tower
  if not tower.valid or tower.energy < required_energy then
    return
  end
  -- Check the target's equipment grid for an energy absorber
  local grid_data = get_grid_data(target)
  if grid_data and grid_data.absorber and grid_data.absorber.valid then
    --- @class TargetData
    local target_data = {
      connections = {
        --- @type table<number, ConnectionData>
        by_beam = {},
        --- @type table<number, ConnectionData>
        by_tower = {},
      },
      entity = target,
      --- @type number?
      full_tick = nil,
      grid_data = grid_data,
      unit_number = target_unit_number,
    }
    storage.tesla_coil.targets[target_unit_number] = target_data

    return target_data
  end
end

--- @param target_unit_number number
local function remove_target(target_unit_number)
  storage.tesla_coil.targets[target_unit_number] = nil
end

-- CONNECTION
-- A connection between a tower and a target, comprising of a beam
-- There can be unlimited connections per target

--- @param target_data TargetData
--- @param tower_data TowerData
--- @return boolean
local function add_connection(target_data, tower_data)
  -- Check if the absorber has space
  local absorber = target_data.grid_data.absorber
  if not absorber or not absorber.valid then
    remove_target(target_data.unit_number)
    return false
  end

  local tower = tower_data.entities.tower
  if not tower.valid then
    remove_target(target_data.unit_number)
    return false
  end

  if absorber.energy >= absorber_buffer_capacity then
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
    max_length = range,
    force = tower_data.entities.tower.force,
    raise_built = true,
  })
  if not beam then
    return false
  end
  local beam_number = script.register_on_object_destroyed(beam)

  --- @class BeamData
  storage.tesla_coil.beams[beam_number] = {
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
local function remove_connection(target_data, tower_data)
  local connection_data = target_data.connections.by_tower[tower_data.tower_unit_number]

  -- Destroy beam if it still exists
  if connection_data.beam.valid then
    connection_data.beam.destroy()
  end

  local beam_number = connection_data.beam_number
  storage.tesla_coil.beams[beam_number] = nil

  target_data.connections.by_beam[beam_number] = nil
  target_data.connections.by_tower[tower_data.tower_unit_number] = nil

  if table_size(target_data.connections.by_beam) == 0 then
    remove_target(target_data.unit_number)
  end
end

--- @param target_data TargetData
--- @param tower_data TowerData
local function update_connection(target_data, tower_data)
  local absorber = target_data.grid_data.absorber

  -- Check if the tower is powered
  if not absorber or not absorber.valid or tower_data.entities.tower.energy < required_energy then
    remove_connection(target_data, tower_data)
    return
  end

  local energy = absorber.energy
  if energy < absorber_buffer_capacity then
    -- Calculate how much to add
    local to_add = charging_rate / 60 * cooldown
    local result = energy + to_add
    local tower = tower_data.entities.tower

    if result >= absorber_buffer_capacity then
      absorber.energy = absorber_buffer_capacity
      target_data.full_tick = game.tick
    else
      absorber.energy = result
      target_data.full_tick = nil
    end

    tower.energy = tower.energy - (to_add * loss_multiplier)
  elseif target_data.full_tick and target_data.full_tick + cooldown <= game.tick then
    remove_connection(target_data, tower_data)
  end
end

--- @param target LuaEntity
--- @param turret LuaEntity
local function process_turret_fire(target, turret)
  local tower_data = storage.tesla_coil.turrets[turret.unit_number]
  if not tower_data then
    return
  end

  local target_data = storage.tesla_coil.targets[target.unit_number]
  if not target_data then
    target_data = add_target(target, tower_data)
  end

  if target_data then
    -- Just in case (#182)
    if not target_data.entity.valid then
      target_data.entity = target
    end
    local connection = target_data.connections.by_tower[tower_data.tower_unit_number]
    if connection or add_connection(target_data, tower_data) then
      update_connection(target_data, tower_data)
    end
  end
end

-- EVENTS

--- @param e EventData.on_object_destroyed
local function on_object_destroyed(e)
  local beam_data = storage.tesla_coil.beams[e.registration_number]
  if beam_data then
    remove_connection(beam_data.target_data, beam_data.tower_data)
  end
end

--- @param e EventData.on_equipment_inserted
local function on_equipment_inserted(e)
  if not e.equipment.valid or e.equipment.name ~= "energy-absorber-equipment" then
    return
  end
  update_target_grid(e.grid)
end

--- @param e EventData.on_equipment_removed
local function on_equipment_removed(e)
  if e.equipment == "energy-absorber-equipment" then
    update_target_grid(e.grid)
  end
end

--- @param e EventData.on_script_trigger_effect
local function on_script_trigger_effect(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    process_turret_fire(e.target_entity, e.source_entity)
  end
end

local tesla_coil = {}

function tesla_coil.on_init()
  storage.tesla_coil = {
    --- @type table<number, BeamData>
    beams = {},
    --- @type table<number, TowerData>
    turrets = {},
    --- @type table<number, TowerData>
    towers = {},
    --- @type table<number, TargetData>
    targets = {},
  }
end

tesla_coil.events = {
  [defines.events.on_built_entity] = on_entity_built,
  [defines.events.on_entity_cloned] = on_entity_built,
  [defines.events.on_entity_died] = on_entity_destroyed,
  [defines.events.on_equipment_inserted] = on_equipment_inserted,
  [defines.events.on_equipment_removed] = on_equipment_removed,
  [defines.events.on_object_destroyed] = on_object_destroyed,
  [defines.events.on_player_mined_entity] = on_entity_destroyed,
  [defines.events.on_robot_built_entity] = on_entity_built,
  [defines.events.on_robot_mined_entity] = on_entity_destroyed,
  [defines.events.on_script_trigger_effect] = on_script_trigger_effect,
  [defines.events.script_raised_built] = on_entity_built,
  [defines.events.script_raised_destroy] = on_entity_destroyed,
  [defines.events.script_raised_revive] = on_entity_built,
}

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
        armor.grid.put({ name = "energy-absorber-equipment", position = { 5, 5 } })
      end
    end
  end)
]]
