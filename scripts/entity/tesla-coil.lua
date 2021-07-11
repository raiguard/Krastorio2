local tesla_coil = {}

function tesla_coil.init()
  return {}
end

function tesla_coil.build(source_entity)
  local surface = source_entity.surface
  local unit_number = source_entity.unit_number

  global.tesla_coils[unit_number] = {
    collision = surface.create_entity {
      name = "kr-tesla-coil-collision",
      position = source_entity.position,
      force = source_entity.force,
      create_build_effect_smoke = false,
    },
    land_mine = surface.create_entity{
      name = "kr-tesla-coil-land-mine",
      position = source_entity.position,
      force = source_entity.force,
      create_build_effect_smoke = false,
    },
    tower = source_entity,
  }
end

function tesla_coil.destroy(source_entity)
  local unit_number = source_entity.unit_number
  local data = global.tesla_coils[unit_number]
  if data then
    for _, entity in pairs(data) do
      if entity and entity.valid then
        entity.destroy()
      end
    end
    global.tesla_coils[unit_number] = nil
  else
    error("WTF?")
  end
end

return tesla_coil
