local util = require("scripts.util")

local shelter = {}

function shelter.init()
  global.shelter = {}

  for _, force in pairs(game.forces) do
    shelter.force_init(force)
  end
end

function shelter.force_init(force)
  global.shelter[force.index] = {
    inactive_shelters = {},
    spawn_points = {},
  }
end

function shelter.build(entity)
  local force = entity.force
  local surface = entity.surface
  local force_data = global.shelter[force.index]
  if not force_data then return end
  local spawn_points = force_data.spawn_points

  if spawn_points[surface.index] then
    force_data.inactive_shelters[entity.unit_number] = entity
    entity.active = false
    entity.operable = false
    util.entity_flying_text(entity, {"message.kr-shelter-is-inactive"}, {r = 1})
  else
    -- Build entities
    local _, _, base_name = string.find(entity.name, "^(.*)%-container")
    local shelter_data = {
      container = entity,
    }

    for key, suffix in pairs{electric = "", light = "-light"} do
      local name = base_name..suffix
      shelter_data[key] = surface.create_entity{
        name = name,
        position = entity.position,
        force = force,
        player = entity.last_user,
        create_build_effect_smoke = false,
      }
    end

    -- Set spawn point
    shelter_data.former_spawn_point = force.get_spawn_position(surface)
    force.set_spawn_position({x = entity.position.x, y = entity.position.y + 3.5}, surface)

    spawn_points[surface.index] = shelter_data
  end
end

function shelter.destroy(entity)
  local force = entity.force
  local force_data = global.shelter[force.index]

  if force_data then
    local surface_index = entity.surface.index
    local inactive = force_data.inactive_shelters[entity.unit_number]
    if inactive then
      force_data.inactive_shelters[entity.unit_number] = nil
    else
      local spawn_points = force_data.spawn_points
      local shelter_data = spawn_points[surface_index]
      if shelter_data then
        -- Destroy entities
        shelter_data.electric.destroy()
        shelter_data.light.destroy()
        spawn_points[surface_index] = nil

        -- Restore former spawn point
        force.set_spawn_position(shelter_data.former_spawn_point, surface_index)
      end
    end
  end
end

function shelter.spawn_flying_texts()
  for _, force_data in pairs(global.shelter) do
    for _, entity in pairs(force_data.inactive_shelters) do
      util.entity_flying_text(entity, {"message.kr-shelter-is-inactive"}, {r = 1})
    end
  end
end

return shelter
