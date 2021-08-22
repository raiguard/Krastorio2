local creep = require("scripts.creep")
local inserter = require("scripts.inserter")
local planetary_teleporter = require("scripts.planetary-teleporter")
local roboport = require("scripts.roboport")
local tesla_coil = require("scripts.tesla-coil")
local util = require("scripts.util")
local virus = require("scripts.virus")

local migrations = {}

function migrations.generic()
  util.add_to_crash_site()
  util.disable_rocket_victory()
  util.ensure_turret_force()

  roboport.find_variants()
  tesla_coil.get_absorber_buffer_capacity()

  for _, player in pairs(game.players) do
    inserter.refresh_gui(player)
    roboport.refresh_gui(player)
  end
end


migrations.versions = {
  ["1.1.2"] = function()
    local shelters = global.spawn_points
    local filters = { name = { "kr-shelter-light", "kr-shelter-plus-light" } }
    if shelters then
      for _, surface in pairs(game.surfaces) do
        for _, light in pairs(surface.find_entities_filtered(filters)) do
          local force = light.force.index
          local surface_data = shelters[surface.index]
          if surface_data then
            local shelter_data = surface_data[force]
            if
              shelter_data
              and surface.find_entities_filtered({
                name = { "kr-shelter-container", "kr-shelter-plus-container" },
                position = light.position,
              })[1]
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
  end,
  ["1.2.0"] = function()
    -- NUKE EVERYTHING
    global = {}

    -- Re-initialize
    creep.init()
    inserter.init()
    planetary_teleporter.init()
    roboport.init()
    tesla_coil.init()
    virus.init()

    -- TODO: Add collision entities and data for tesla coils
    -- TODO: Convert data format for planetary teleporters
  end
}

return migrations
