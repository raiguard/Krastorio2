local util = {}

--- @class FlyingTextOptions
--- @field color Color?
--- @field position MapPosition?
--- @field sound LuaPlayer.play_sound_param?

--- @param player LuaPlayer
--- @param text LocalisedString
--- @param options FlyingTextOptions?
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

--- @param entity LuaEntity
--- @param text LocalisedString
--- @param color Color?
function util.entity_flying_text(entity, text, color)
  for _, player in pairs(game.players) do
    if player.surface == entity.surface then
      player.create_local_flying_text({
        text = text,
        color = color,
        position = entity.position,
      })
    end
  end
end

--- @param entity LuaEntity
--- @param text LocalisedString
--- @param color Color
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

--- @param commands_list table<string, function>
function util.add_commands(commands_list)
  for name, func in pairs(commands_list) do
    commands.add_command(name, { "command-help." .. name }, function(e)
      local player = game.get_player(e.player_index) --[[@as LuaPlayer]]
      if not player.admin then
        player.print({ "cant-run-command-not-admin", name })
        return
      end

      func(e)
    end)
  end
end

--- @param e EventData.on_player_setup_blueprint
--- @return LuaItemStack?
function util.get_blueprint(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  local bp = player.blueprint_to_setup
  if bp and bp.valid_for_read then
    return bp
  end

  bp = player.cursor_stack
  if not bp or not bp.valid_for_read then
    return
  end

  if bp.type == "blueprint-book" then
    local item_inventory = bp.get_inventory(defines.inventory.item_main)
    if item_inventory then
      bp = item_inventory[bp.active_index]
    else
      return
    end
  end

  return bp
end

return util
