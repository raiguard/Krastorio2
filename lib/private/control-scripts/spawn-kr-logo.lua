if not remote.interfaces["kr-logo"] then
  remote.add_interface("kr-logo",
  {
    kr_spawn_logo = 
    function(surface_index, x, y)
      if type(x) ~= "number" then 
        error("Value for 'x' must be a point (number).")
      end
      if type(y) ~= "number" then 
        error("Value for 'y' must be a point (number).")
      end
      game.surfaces[surface_index].create_entity{name="kr-logo", position={x=x, y=y}}
    end
  })
end

if not commands.commands["kr-logo"] then
  commands.add_command("kr-spawn-logo", {"other.kr-restore-help"}, function(command)
    local parameters = {}
    for substring in command.parameter:gmatch("%S+") do
      table.insert(parameters, tonumber(substring))
    end

    if type(parameters[1]) ~= "number" then 
      error("Value for 'x' must be a point coordinate (number).")
    end
    if type(parameters[2]) ~= "number" then 
      error("Value for 'y' must be a point coordinate (number).")
    end
    
    local character = game.get_player(command.player_index).character
    if character then
      character.surface.create_entity{name="kr-logo", position={x=parameters[1], y=parameters[2]}}
    end
  end)
end

return {} 