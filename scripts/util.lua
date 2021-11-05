local util = {}

function util.ensure_turret_force()
  if not game.forces["kr-internal-turrets"] then
    game.create_force("kr-internal-turrets")
  end
end

function util.flying_text_with_sound(player, text, options)
  options = options or {}
  options.sound = options.sound or { path = "utility/cannot_build" }
  player.create_local_flying_text({
    color = options.color,
    create_at_cursor = not options.position,
    position = options.position,
    text = text,
  })
  player.play_sound(options.sound)
end

function util.entity_flying_text(entity, text, color)
  entity.surface.create_entity({
    type = "flying-text",
    name = "flying-text",
    position = entity.position,
    text = text,
    color = color,
  })
end

function util.change_mode_fx(entity, text, color)
  -- Flying text
  util.entity_flying_text(entity, text, color)
  -- Welding sound
  game.play_sound({
    path = "kr-welding",
    position = entity.position,
    volume_modifier = 1.0,
  })
  -- Welding particle
  entity.surface.create_particle({
    name = "kr-welding-particle",
    position = { entity.position.x, entity.position.y + 1 },
    movement = { 0.0, -0.05 },
    height = 1.0,
    vertical_speed = 0.015,
    frame_speed = 1,
  })
end

function util.add_commands(commands_list)
  for name, func in pairs(commands_list) do
    commands.add_command(name, { "command-help." .. name }, function(e)
      local player = game.get_player(e.player_index)
      if not player.admin then
        player.print({ "cant-run-command-not-admin", name })
        return
      end

      func(e)
    end)
  end
end

return util
