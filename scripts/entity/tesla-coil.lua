local area = require("__flib__.area")
local event = require("__flib__.event")

local tesla_coil = {}

function tesla_coil.init()
  global.tesla_coils = {
    by_beam = {},
    by_turret = {},
    by_tower = {},
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

function tesla_coil.add_target(turret, target)
  local data = global.tesla_coils.by_turret[turret.unit_number]
  if not data then error("Turret fired at something after being destroyed!?") end

  local target_unit_number = target.unit_number
  local target_data = data.targets.by_target[target_unit_number]
  if not target_data then
    target_data = {entity = target, target_unit_number = target.unit_number}
    data.targets.by_target[target_unit_number] = target_data
    local beam = data.entities.turret.surface.create_entity({
      name = "kr-tesla-coil-electric-beam",
      source = data.entities.turret,
      source_offset = {0, -2.2},
      position = data.entities.turret.position,
      target = target_data.entity,
      duration = 0,
      max_length = 20,
      force = data.entities.turret.force,
    })
    local beam_number = event.register_on_entity_destroyed(beam)
    target_data.beam = beam
    target_data.beam_number = beam_number
    data.targets.by_beam[beam_number] = target_data
    global.tesla_coils.by_beam[beam_number] = data
  end
end

function tesla_coil.remove_target(beam_number)
  local data = global.tesla_coils.by_beam[beam_number]
  if data then
    global.tesla_coils.by_beam[beam_number] = nil
    local target_data = data.targets.by_beam[beam_number]
    data.targets.by_beam[beam_number] = nil
    data.targets.by_target[target_data.target_unit_number] = nil
    -- TODO: Give the target the partial amount of energy remaining
  end
end

function tesla_coil.

return tesla_coil
