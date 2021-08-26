local util = require("scripts.util")

local intergalactic_transceiver = {}

--[[
  BEHAVIORS:
    - If the transceiver loses power, drain it rapidly
    - Once 100% is reached, notify the players and add an activate button
    - Once activated, play the cutscene and win the game
    - Update stats GUI with the charge progress

  STATI:
    - Normal / no power: if charged, drain and warn. If not charged, do nothing
    - Charging: Update charge status
    - Fully charged: notify of status
]]

function intergalactic_transceiver.init()
  global.intergalactic_transceiver = {
    forces = {},
    inactive = {},
  }
end

function intergalactic_transceiver.build(entity)
  local existing = global.intergalactic_transceiver.forces[entity.force.index]
  if existing then
    local position = entity.position
    local force = entity.force
    local player = entity.last_user
    local surface = entity.surface
    entity.destroy()

    local new_entity = surface.create_entity{
      name = "kr-inactive-intergalactic-transceiver",
      position = position,
      force = force,
      player = player,
      create_build_effect_smoke = false,
    }
    if new_entity and new_entity.valid then
      global.intergalactic_transceiver.inactive[new_entity.unit_number] = new_entity
    end

    return
  end

  global.intergalactic_transceiver.forces[entity.force.index] = entity
end

function intergalactic_transceiver.destroy(entity)
  local force_index = entity.force.index
  global.intergalactic_transceiver.forces[force_index] = nil
end

function intergalactic_transceiver.destroy_inactive(entity)
  global.intergalactic_transceiver.inactive[entity.unit_number] = nil
end

function intergalactic_transceiver.iterate()

end

function intergalactic_transceiver.spawn_flying_texts()
  for unit_number, entity in pairs(global.intergalactic_transceiver.inactive) do
    if entity.valid then
      util.entity_flying_text(entity, {"message.kr-transceiver-is-inactive"}, {r = 1})
    else
      global.shelter.inactive[unit_number] = nil
    end
  end
end

return intergalactic_transceiver
