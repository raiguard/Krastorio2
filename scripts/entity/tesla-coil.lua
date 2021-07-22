local area = require("__flib__.area")
local event = require("__flib__.event")

local tesla_coil = {}

function tesla_coil.init()
  global.tesla_coils = {
    by_beam = {},
    by_turret = {},
    by_tower = {},
    grids = {},
  }
end

function tesla_coil.build(source_entity)
  local surface = source_entity.surface
  local unit_number = source_entity.unit_number

  local data = {
    entities = {
      collision = surface.create_entity {
        name = "kr-tesla-coil-collision",
        position = source_entity.position,
        force = source_entity.force,
        create_build_effect_smoke = false,
      },
      tower = source_entity,
      turret = surface.create_entity{
        name = "kr-tesla-coil-turret",
        position = source_entity.position,
        force = game.forces["kr-internal-turrets"],
        create_build_effect_smoke = false,
      },
    },
    targets = {
      by_beam = {},
      by_target = {},
    },
  }
  data.tower_unit_number = unit_number
  data.turret_unit_number = data.entities.turret.unit_number

  global.tesla_coils.by_tower[unit_number] = data
  global.tesla_coils.by_turret[data.turret_unit_number] = data
end

function tesla_coil.destroy(source_entity)
  local unit_number = source_entity.unit_number
  local data = global.tesla_coils.by_tower[unit_number]
  if data then
    for _, entity in pairs(data.entities) do
      if entity and entity.valid then
        entity.destroy()
      end
    end
    global.tesla_coils.by_tower[unit_number] = nil
    global.tesla_coils.by_turret[data.turret_unit_number] = nil
    for beam_number in pairs(data.targets.by_beam) do
      global.tesla_coils.by_beam[beam_number] = nil
    end
  end
end

local function get_grid_info(target)
  local grid, absorber
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

  if grid and (grid.get_contents()["energy-absorber"] or 0) > 0 then
    for _, equipment in pairs(grid.equipment) do
      if equipment.name == "energy-absorber" then
        absorber = equipment
        break
      end
    end
  end

  return grid, absorber
end

function tesla_coil.add_target(data, target)
  local target_unit_number = target.unit_number
  -- Check if the tower is powered
  if data.entities.tower.energy < 10000000 then -- TODO: Add to constants
    return
  end
  -- Check the target's equipment grid for an energy absorber
  local grid, absorber = get_grid_info(target)
  if grid and absorber then
    -- Create beam entity
    local beam = data.entities.turret.surface.create_entity({
      name = "kr-tesla-coil-electric-beam",
      source = data.entities.turret,
      source_offset = {0, -2.2},
      position = data.entities.turret.position,
      target = target,
      duration = 0,
      max_length = 20,
      force = data.entities.turret.force,
    })
    local beam_number = event.register_on_entity_destroyed(beam)
    -- Create data table
    local target_data = {
      absorber = absorber,
      beam = beam,
      beam_number = beam_number,
      entity = target,
      grid = grid,
      unit_number = target_unit_number
    }
    data.targets.by_target[target_unit_number] = target_data
    data.targets.by_beam[beam_number] = target_data
    global.tesla_coils.by_beam[beam_number] = data
  elseif grid then
    global.tesla_coils.grids[target_unit_number] = grid
  end
end

function tesla_coil.remove_target(beam_number)
  local data = global.tesla_coils.by_beam[beam_number]
  if data then
    local target_data = data.targets.by_beam[beam_number]
    -- Remove reference to the target's equipment grid
    global.tesla_coils.grids[target_data.unit_Number] = nil
    -- Remove target data table from all locations
    global.tesla_coils.by_beam[beam_number] = nil
    data.targets.by_beam[beam_number] = nil
    data.targets.by_target[target_data.unit_number] = nil
    -- TODO: Give the target the partial amount of energy remaining
  end
end

function tesla_coil.update_target(data, target_data)
  log("UPDATE")
  -- TODO: Check if the `absorber` entry in target data is still there
end

function tesla_coil.process_turret_fire(turret, target)
  local data = global.tesla_coils.by_turret[turret.unit_number]
  if not data then error("Turret fired at something after being destroyed!?") end

  local target_data = data.targets.by_target[target.unit_number]
  if not target_data then
    tesla_coil.add_target(data, target)
  end
  tesla_coil.update_target(data, target_data)

end

return tesla_coil
