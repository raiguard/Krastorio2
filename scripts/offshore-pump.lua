local compatibility = require("scripts.compatibility")

local offshore_pump = {}

function offshore_pump.build(entity)
  if not compatibility.should_build_pump() then
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
  })

  if new_entity and new_entity.valid then
    if script.active_mods["WaterAsAResource"] then
      remote.call("WaaR", "build", new_entity, true)
    end

    if damage > 0 then
      new_entity.damage(damage, game.forces.neutral)
    end
  end
end

function offshore_pump.setup_blueprint(entity)
  entity.name = "offshore-pump"
end

return offshore_pump
