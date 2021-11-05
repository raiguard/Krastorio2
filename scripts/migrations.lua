local on_tick_n = require("__flib__.on-tick-n")

local compatibility = require("scripts.compatibility")
local creep = require("scripts.creep")
local freeplay = require("scripts.freeplay")
local inserter = require("scripts.inserter")
local intergalactic_transceiver = require("scripts.intergalactic-transceiver")
local patreon = require("scripts.patreon")
local planetary_teleporter = require("scripts.planetary-teleporter")
local radioactivity = require("scripts.radioactivity")
local roboport = require("scripts.roboport")
local shelter = require("scripts.shelter")
local tesla_coil = require("scripts.tesla-coil")
local util = require("scripts.util")
local virus = require("scripts.virus")

local migrations = {}

function migrations.generic()
  freeplay.add_bonus_items()
  freeplay.add_to_crash_site()
  freeplay.disable_rocket_victory()
  util.ensure_turret_force()

  intergalactic_transceiver.get_max_energy()
  radioactivity.refresh_players()
  radioactivity.reset_entities_items()
  roboport.find_variants()
  tesla_coil.get_absorber_buffer_capacity()
  tesla_coil.reset_grids_cache()

  compatibility.aai_industry()
  compatibility.disco_science()
  compatibility.schall_uranium()

  for _, player in pairs(game.players) do
    inserter.refresh_gui(player)
    roboport.refresh_gui(player)
  end
end

local function find_on_all_surfaces(filters)
  local output = {}
  for _, surface in pairs(game.surfaces) do
    local entities = surface.find_entities_filtered(filters)
    for _, entity in pairs(entities) do
      table.insert(output, entity)
    end
  end
  return output
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

    local old_global = global
    global = {}

    -- REINITIALIZE

    on_tick_n.init()

    creep.init()
    inserter.init()
    intergalactic_transceiver.init()
    patreon.init()
    planetary_teleporter.init()
    radioactivity.init()
    roboport.init()
    shelter.init()
    tesla_coil.init()
    virus.init()

    -- MIGRATE

    -- Creep
    global.creep.on_biter_base_built = old_global.creep_on_biter_base_built
    global.creep.on_chunk_generated = old_global.creep_on_chunk_generated
    if not old_global.creep_on_chunk_generated then
      global.creep.surfaces[game.get_surface("nauvis").index] = nil
    end

    -- Intergalactic Transceiver
    -- There should only be one of each, so this one is easy
    for _, transceiver in pairs(find_on_all_surfaces({ name = "kr-intergalactic-transceiver" })) do
      intergalactic_transceiver.build(transceiver)
    end
    for _, transceiver in pairs(find_on_all_surfaces({ name = "kr-activated-intergalactic-transceiver" })) do
      global.intergalactic_transceiver.forces[transceiver.force.index] = { entity = transceiver }
    end

    -- Patreon items
    for player_name in pairs(old_global.patreon_item_given) do
      local player = game.get_player(player_name)
      if player then
        global.patreon_items_given[player.index] = true
      end
    end

    -- Planetary teleporter
    global.planetary_teleporter = {
      data = old_global.planetary_teleporters,
      guis = old_global.planetary_teleporter_guis,
      players = old_global.planetary_teleporter_players,
      unnamed_translations = old_global.planetary_teleporter_unnamed_translations,
    }

    -- Radioactivity
    local old_enabled = old_global.radioactivity_enabled
    -- The old `global` didn't store the variable until it was needed
    if old_enabled == nil then
      old_enabled = true
    end
    global.radioactivity.enabled = old_enabled

    -- Shelter
    for _, entity in pairs(find_on_all_surfaces({
      name = { "kr-shelter-light", "kr-shelter", "kr-shelter-plus-light", "kr-shelter-plus" },
    })) do
      entity.destroy()
    end
    for _, container in pairs(find_on_all_surfaces({ name = { "kr-shelter-container", "kr-shelter-plus-container" } })) do
      shelter.build(container)
    end

    -- Tesla coils
    for _, tower in pairs(find_on_all_surfaces({ name = "kr-tesla-coil" })) do
      tesla_coil.build(tower)
    end
  end,
}

return migrations
