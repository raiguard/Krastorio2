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
    last_alert_tick = game.tick,
    last_energy = entity.energy,
    status = "empty",
  }
end

function intergalactic_transceiver.destroy(entity)
  local force_index = entity.force.index
  global.intergalactic_transceiver.forces[force_index] = nil
end

function intergalactic_transceiver.destroy_inactive(entity)
  global.intergalactic_transceiver.inactive[entity.unit_number] = nil
end

local constants = {
  delta = 1e9,
  drain = 50e9,
  max_delta = 2e9
}

function intergalactic_transceiver.iterate()
  local transceivers = global.intergalactic_transceiver.forces
  for force_index, data in pairs(transceivers) do
    local entity = data.entity
    if entity and entity.valid then
      local current_energy = entity.energy
      local new_energy = current_energy
      local difference = current_energy - data.last_energy
      local status = "charging"
      -- If we're not receiving enough power
      if difference < constants.delta and current_energy > 0 then
        -- Drain the transceiver at 3 TJ / sec
        new_energy = math.max(0, current_energy - constants.drain)
        -- Update status
        if new_energy > 0 then
          status = "discharging"
        else
          status = "empty"
        end
      else
        -- TODO: Cache this
        -- The max that we allow, for graphical reasons
        -- If we allow the transceiver to fully charge, the animation stops, which we don't want, so we cap the energy
        -- just below the max
        local max_energy = entity.prototype.electric_energy_source_prototype.buffer_capacity - constants.delta
        -- If we're above the allowed max
        if current_energy > max_energy then
          -- Reset the energy to the allowed max
          new_energy = max_energy
          status = "ready"
        end
      end

      -- If we are updating the amount of energy in the transceiver
      if new_energy ~= current_energy then
        entity.energy = new_energy
      end
      -- Save data
      data.last_energy = new_energy
      data.status = status

      -- If we wish to show an alert and it's been more than a second since the last one
      if status ~= "charging" and game.tick - data.last_alert_tick >= 60 then
        data.last_alert_tick = game.tick
        for _, player in pairs(entity.force.players) do
          player.add_custom_alert(
            entity,
            {type = "item", name = "kr-intergalactic-transceiver"},
            status,
            true
          )
        end
      end
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
