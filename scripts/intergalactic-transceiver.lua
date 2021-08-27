local util = require("scripts.util")

local intergalactic_transceiver = {}

--[[
  BEHAVIORS:
    - If the transceiver loses power, drain it rapidly
    - Once 100% is reached, notify the players and add an activate button
    - Once activated, play the cutscene and win the game
    - Update stats GUI with the charge progress

  STATUSES:
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

  global.intergalactic_transceiver.forces[entity.force.index] = {
    entity = entity,
    last_energy = entity.energy,
  }
end

function intergalactic_transceiver.destroy(entity)
  local force_index = entity.force.index
  global.intergalactic_transceiver.forces[force_index] = nil
end

function intergalactic_transceiver.destroy_inactive(entity)
  global.intergalactic_transceiver.inactive[entity.unit_number] = nil
end

function intergalactic_transceiver.iterate()
  local transceivers = global.intergalactic_transceiver.forces
  for force_index, data in pairs(transceivers) do
    -- TODO: Keep track of "state" in the data
    local entity = data.entity
    if entity and entity.valid then
      local current_energy = entity.energy
      local difference = current_energy - data.last_energy
      -- If we were charging at less than 60 GW, the singularity is not stable and is losing energy.
      -- Remove 1 TJ every 20 ticks.
      -- If we're within 20 ticks of being fully charged, maintain the not-quite-charged status to continue the
      -- animation and power draw.
      -- TODO: Add these to constants
      -- TODO: Cache this
      local max_energy = entity.prototype.electric_energy_source_prototype.buffer_capacity - 2e9
      if difference < 2e9 and current_energy > 0 then
        entity.energy = math.max(0, current_energy - 8e11)
      else
        if max_energy <= current_energy then
          entity.energy = math.min(max_energy - 2e9, current_energy)
          for _, player in pairs(entity.force.players) do
            player.add_custom_alert(
              entity,
              {type = "item", name = "kr-intergalactic-transceiver"},
              "TRANSCEIVER IS READY",
              true
            )
          end
        end
      end
      data.last_energy = current_energy
    else
      transceivers[force_index] = nil
    end
  end
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
