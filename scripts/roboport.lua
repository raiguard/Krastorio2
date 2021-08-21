local constants = require("scripts.constants")
local util = require("scripts.util")

local roboport = {}

function roboport.change_mode(entity, player)
  local matched, _, base_name, suffix = string.find(entity.name, "^(.-)(%-%w-%-mode)$")
  if not matched then
    base_name = entity.name
    suffix = ""
  end

  local new_mode_data = constants.next_roboport_mode[suffix]
  local new_name = base_name..new_mode_data.suffix

  if not game.entity_prototypes[new_name] then
    util.error_flying_text(player, {"message.kr-roboport-modes-not-supported"}, {position = entity.position})
    return
  end

  local energy = entity.energy
  local health = entity.health

  local new_entity = entity.surface.create_entity{
    name = new_name,
    position = entity.position,
    direction = entity.direction,
    force = entity.force,
    fast_replace = true,
    player = player,
    raise_built = true,
    create_build_effect_smoke = false,
  }

  if new_entity then
    new_entity.energy = energy
    new_entity.health = health

    util.change_mode_fx(new_entity, {"message.kr-"..new_mode_data.text.."-mode"}, new_mode_data.color)
  end
end

return roboport
