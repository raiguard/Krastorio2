local event = require("__flib__.event")

local constants = require("scripts.constants")

local tesla_coil = {}

function tesla_coil.init()
  global.tesla_coil = {
    by_beam = {},
    by_tower = {},
    by_turret = {},
    grids = {},
    grids_by_unit_number = {},
  }
end

function tesla_coil.reset_grids_cache()
  global.tesla_coil.grids_by_unit_number = {}
end

function tesla_coil.get_absorber_buffer_capacity()
  global.tesla_coil.absorber_buffer_capacity =
    game.equipment_prototypes["energy-absorber"].energy_source.buffer_capacity
end

function tesla_coil.build(source_entity)
  local surface = source_entity.surface
  local unit_number = source_entity.unit_number

  local data = {
    entities = {
      collision = surface.create_entity({
        name = "kr-tesla-coil-collision",
        position = source_entity.position,
        force = source_entity.force,
        create_build_effect_smoke = false,
      }),
      tower = source_entity,
      turret = surface.create_entity({
        name = "kr-tesla-coil-turret",
        position = source_entity.position,
        force = game.forces["kr-internal-turrets"],
        create_build_effect_smoke = false,
      }),
    },
    targets = {
      by_beam = {},
      by_target = {},
    },
  }
  data.tower_unit_number = unit_number
  data.turret_unit_number = data.entities.turret.unit_number

  global.tesla_coil.by_tower[unit_number] = data
  global.tesla_coil.by_turret[data.turret_unit_number] = data
end

function tesla_coil.destroy(source_entity)
  local unit_number = source_entity.unit_number
  local data = global.tesla_coil.by_tower[unit_number]
  if data then
    for _, entity in pairs(data.entities) do
      if entity and entity.valid then
        entity.destroy()
      end
    end
    global.tesla_coil.by_tower[unit_number] = nil
    global.tesla_coil.by_turret[data.turret_unit_number] = nil
    for beam_number in pairs(data.targets.by_beam) do
      global.tesla_coil.by_beam[beam_number] = nil
    end
  end
end

local function get_grid_info(target)
  local existing = global.tesla_coil.grids_by_unit_number[target.unit_number]
  if existing then
    return existing
  end

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
    for _, grid_data in pairs(global.tesla_coil.grids) do
      if grid == grid_data.grid then
        grid_data.unit_number = target.unit_number
        global.tesla_coil.grids_by_unit_number[target.unit_number] = grid_data
        return grid_data
      end
    end
  end
end

function tesla_coil.add_target(data, target)
  local target_unit_number = target.unit_number
  -- Check if the tower is powered
  if data.entities.tower.energy < constants.tesla_coil.required_energy then
    return
  end
  -- Check the target's equipment grid for an energy absorber
  local grid_data = get_grid_info(target)
  if grid_data and grid_data.absorber then
    -- Check if the absorber has space
    local capacity = global.tesla_coil.absorber_buffer_capacity
    if grid_data.absorber.energy < capacity then
      -- Create beam entity
      local beam = data.entities.turret.surface.create_entity({
        name = "kr-tesla-coil-electric-beam",
        source = data.entities.turret,
        source_offset = { 0, -2.2 },
        position = data.entities.turret.position,
        target = target,
        duration = 0,
        max_length = 20,
        force = data.entities.turret.force,
      })
      local beam_number = event.register_on_entity_destroyed(beam)
      -- Create data table
      local target_data = {
        absorber = grid_data.absorber,
        beam = beam,
        beam_number = beam_number,
        entity = target,
        grid = grid_data.grid,
        unit_number = target_unit_number,
      }
      data.targets.by_target[target_unit_number] = target_data
      data.targets.by_beam[beam_number] = target_data
      global.tesla_coil.by_beam[beam_number] = data
      return target_data
    end
  end
end

function tesla_coil.remove_target(beam_number)
  local data = global.tesla_coil.by_beam[beam_number]
  if data then
    local target_data = data.targets.by_beam[beam_number]
    -- Destroy beam if it still exists
    if target_data.beam.valid then
      target_data.beam.destroy()
    end
    -- Remove target data table from all locations
    global.tesla_coil.by_beam[beam_number] = nil
    data.targets.by_beam[beam_number] = nil
    data.targets.by_target[target_data.unit_number] = nil
  end
end

function tesla_coil.update_target(data, target_data)
  local absorber = target_data.absorber
  -- Check if the tower is powered
  if not absorber.valid or data.entities.tower.energy < constants.tesla_coil.required_energy then
    tesla_coil.remove_target(target_data.beam_number)
    return
  end
  local capacity = global.tesla_coil.absorber_buffer_capacity
  local energy = absorber.energy
  if energy < capacity then
    -- Calculate how much to add
    local to_add = constants.tesla_coil.charging_rate / 60
    local result = energy + to_add
    local tower = data.entities.tower
    if result > capacity then
      absorber.energy = capacity
    else
      absorber.energy = result
    end
    tower.energy = tower.energy - (to_add * constants.tesla_coil.loss_multiplier)
  else
    tesla_coil.remove_target(target_data.beam_number)
  end
end

function tesla_coil.process_turret_fire(turret, target)
  local data = global.tesla_coil.by_turret[turret.unit_number]
  if not data then
    error("Turret fired at something after being destroyed!?")
  end

  local target_data = data.targets.by_target[target.unit_number]
  if not target_data then
    target_data = tesla_coil.add_target(data, target)
  end
  if target_data then
    tesla_coil.update_target(data, target_data)
  end
end

function tesla_coil.on_equipment_inserted(e)
  local equipment = e.equipment
  if not equipment.valid or equipment.name ~= "energy-absorber" then
    return
  end
  local grid = e.grid
  if not grid.valid then
    return
  end

  -- Add this to the list of compatible grids
  if grid.get_contents()["energy-absorber"] == 1 then
    table.insert(global.tesla_coil.grids, { absorber = equipment, grid = grid })
  end
end

function tesla_coil.on_equipment_removed(e)
  local equipment = e.equipment
  if equipment ~= "energy-absorber" then
    return
  end
  local grid = e.grid
  if not grid.valid then
    return
  end

  -- Remove from the compatible grids list
  for i, grid_data in pairs(global.tesla_coil.grids) do
    if grid == grid_data.grid and not grid.get_contents()["energy-absorber"] then
      table.remove(global.tesla_coil.grids, i)
      if grid_data.unit_number then
        global.tesla_coil.grids_by_unit_number[grid_data.unit_number] = nil
      end
    end
  end
end

-- Remove a character's grid from the cache if their armor inventory changed
function tesla_coil.on_player_armor_inventory_changed(e)
  local player = game.get_player(e.player_index)
  local character = player.character
  if character and character.valid then
    global.tesla_coil.grids_by_unit_number[character.unit_number] = nil
  end
end

function tesla_coil.remove_entity_from_cache(entity)
  local unit_number = entity.unit_number
  if not unit_number then
    return
  end

  global.tesla_coil.grids_by_unit_number[unit_number] = nil
end

return tesla_coil
