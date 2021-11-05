local util = require("scripts.util")

local shelter = {}

function shelter.init()
  global.shelter = {
    forces = {},
    inactive = {},
  }

  for _, force in pairs(game.forces) do
    shelter.force_init(force)
  end
end

function shelter.force_init(force)
  global.shelter.forces[force.index] = {}
end

function shelter.build(entity)
  local force = entity.force
  local surface = entity.surface
  local force_shelters = global.shelter.forces[force.index]

  if force_shelters[surface.index] then
    global.shelter.inactive[entity.unit_number] = entity
    entity.active = false
    entity.operable = false
  else
    -- Build entities
    local _, _, base_name = string.find(entity.name, "^(.*)%-container")
    local shelter_data = {
      container = entity,
    }

    for key, suffix in pairs({ electric = "", light = "-light" }) do
      local name = base_name .. suffix
      shelter_data[key] = surface.create_entity({
        name = name,
        position = entity.position,
        force = force,
        player = entity.last_user,
        create_build_effect_smoke = false,
      })
    end

    -- Set spawn point
    shelter_data.former_spawn_point = force.get_spawn_position(surface)
    force.set_spawn_position({ x = entity.position.x, y = entity.position.y + 3.5 }, surface)

    force_shelters[surface.index] = shelter_data
  end
end

function shelter.destroy(entity)
  local inactive = global.shelter.inactive[entity.unit_number]
  if inactive then
    global.shelter.inactive[entity.unit_number] = nil
  else
    local force = entity.force

    local force_shelters = global.shelter.forces[force.index]
    if not force_shelters then
      return
    end

    local surface_index = entity.surface.index
    local shelter_data = force_shelters[surface_index]
    if not shelter_data then
      return
    end

    -- Destroy entities
    shelter_data.electric.destroy()
    shelter_data.light.destroy()
    force_shelters[surface_index] = nil

    -- Restore former spawn point
    force.set_spawn_position(shelter_data.former_spawn_point, surface_index)
  end
end

function shelter.spawn_flying_texts()
  for unit_number, entity in pairs(global.shelter.inactive) do
    if entity.valid then
      util.entity_flying_text(entity, { "message.kr-shelter-is-inactive" }, { r = 1 })
    else
      global.shelter.inactive[unit_number] = nil
    end
  end
end

return shelter
