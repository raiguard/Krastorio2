local area = require("__flib__.area")

local tesla_coil = {}

function tesla_coil.init()
  return {
    by_tower = {},
    by_turret = {},
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
    targets = {},
  }
  -- Save data
  -- Needs a lookup by tower and by turret for the different reasons
  data.tower_unit_number = unit_number
  data.turret_unit_number = data.entities.turret.unit_number
  global.tesla_coils.by_tower[unit_number] = data
  global.tesla_coils.by_turret[data.turret_unit_number] = data

  -- TEMPORARY:
  -- TODO: Add a flib function to create an area from a centerpoint and width/height
  local Collision = area.load({
    left_top = {x = -18, y = -18},
    right_bottom = {x = 18, y = 18},
  }):center_on(data.entities.collision.position)
  local render_objects = {
    range = rendering.draw_circle{
      color = {r = 0.1, a = 0.05},
      filled = true,
      radius = 20,
      target = data.entities.turret,
      surface = source_entity.surface,
    },
    collision = rendering.draw_rectangle{
      color = {g = 0.05, a = 0.05},
      filled = true,
      left_top = Collision.left_top,
      right_bottom = Collision.right_bottom,
      surface = source_entity.surface,
    },
    number = rendering.draw_text{
      text = data.entities.turret.unit_number,
      color = {r = 0.2, g = 1, b = 1},
      target = source_entity,
      surface = source_entity.surface,
    },
  }
  data.render_objects = render_objects
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
    for _, id in pairs(data.render_objects) do
      rendering.destroy(id)
    end
    global.tesla_coils.by_tower[unit_number] = nil
    global.tesla_coils.by_turret[data.turret_unit_number] = nil
  else
    error("WTF?")
  end
end

function tesla_coil.update_target(turret, target)

end

function tesla_coil.iterate(tower, target)

end

return tesla_coil
