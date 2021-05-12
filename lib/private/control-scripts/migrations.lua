return {
  ["1.1.2"] = function()
    local shelters = global.spawn_points
    local filters = {name = {"kr-shelter-light", "kr-shelter-plus-light"}}
    if shelters then
      for _, surface in pairs(game.surfaces) do
        for _, light in pairs(surface.find_entities_filtered(filters)) do
          local force = light.force.index
          local surface_data = shelters[surface.index]
          if surface_data then
            local shelter_data = surface_data[force]
            if shelter_data
              and surface.find_entities_filtered{
                name = {"kr-shelter-container", "kr-shelter-plus-container"},
                position = light.position
              }[1]
            then
              shelter_data[#shelter_data + 1] = light
            else
              light.destroy()
            end
          else
            light.destroy()
          end
        end
      end
    end
  end
}
