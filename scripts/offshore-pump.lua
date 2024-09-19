local util = require("scripts.util")

--- @param e EntityBuiltEvent
local function on_entity_built(e)
  if not game.entity_prototypes["kr-electric-offshore-pump"] then
    return
  end

  local entity = e.entity or e.created_entity or e.destination
  if not entity.valid or entity.name ~= "offshore-pump" then
    return
  end

  local damage = entity.prototype.max_health - entity.health
  local position = entity.position
  local direction = entity.direction
  local force = entity.force
  local surface = entity.surface
  local player = entity.last_user

  entity.destroy()

  local new_entity = surface.create_entity({
    name = "kr-electric-offshore-pump",
    position = position,
    direction = direction,
    force = force,
    player = player,
    create_build_effect_smoke = false,
    raise_built = true,
  })

  if new_entity and new_entity.valid then
    if script.active_mods["WaterAsAResource"] then
      remote.call("WaaR", "build", new_entity, true)
    end

    if damage > 0 then
      new_entity.damage(damage --[[@as float]], game.forces.neutral)
    end
  end
end

--- @param e EventData.on_player_setup_blueprint
local function on_player_setup_blueprint(e)
  local blueprint = util.get_blueprint(e)
  if not blueprint then
    return
  end

  local entities = blueprint.get_blueprint_entities()
  if not entities then
    return
  end

  local should_update = false
  for _, entity in pairs(entities) do
    if entity.name == "kr-electric-offshore-pump" then
      should_update = true
      entity.name = "offshore-pump"
    end
  end

  if should_update then
    blueprint.set_blueprint_entities(entities)
  end
end

local offshore_pump = {}

offshore_pump.events = {
  [defines.events.on_built_entity] = on_entity_built,
  [defines.events.on_entity_cloned] = on_entity_built,
  [defines.events.on_player_setup_blueprint] = on_player_setup_blueprint,
  [defines.events.on_robot_built_entity] = on_entity_built,
  [defines.events.script_raised_built] = on_entity_built,
  [defines.events.script_raised_revive] = on_entity_built,
}

return offshore_pump
