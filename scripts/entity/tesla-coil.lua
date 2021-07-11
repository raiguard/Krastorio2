local tesla_coil = {}

function tesla_coil.init()
  return {}
end

function tesla_coil.build(source_entity, player)
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

-- function tesla_coil.destroy(source_entity)

-- end

return tesla_coil
