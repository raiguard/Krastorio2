local on_tick_n = require("__flib__.on-tick-n")

local constants = require("scripts.constants")

local radioactivity = {}

function radioactivity.init()
  global.radioactivity = {
    entities = {"uranium-ore"},
    items = {"uranium-ore"},
    players = {},
  }
end

-- TODO: Only check if the player moves tiles, not if they move at all
function radioactivity.check_around_player(player)
  local in_range = player.character and player.surface.count_entities_filtered{
    name = global.radioactivity.entities,
    radius = constants.radioactivity_range,
    position = player.position
  } > 0
  local prev_state = global.radioactivity.players[player.index]
  global.radioactivity.players[player.index] = in_range or nil

  -- If we just entered range, update immediately and start the cycle
  if in_range and not prev_state then
    radioactivity.update_player(player)
  end
end

function radioactivity.update_player(player)
  if global.radioactivity.players[player.index] and player.character then
    -- Update alert and sound
    player.play_sound{
      path = "kr-radioactive",
      position = player.position,
      volume_modifier = 0.5,
    }
    player.add_custom_alert(
      player.character,
      {type = "virtual", name = "kr-nuclear-2"},
      {"other.kr-taking-radioactive-damage"},
      false
    )

    -- Damage the player
    -- TODO: Account for armor and energy shields
    local base_damage = 7.25
    player.character.damage(base_damage, "enemy", "radioactive")

    -- Do it again in one second
    on_tick_n.add(game.tick + 60, {action = "update_radioactivity", player_index = player.index})
  end
end

return radioactivity
