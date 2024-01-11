local on_tick_n = require("__flib__.on-tick-n")
local table = require("__flib__.table")

local compatibility = require("scripts.compatibility")
local creep = require("scripts.creep")
local energy_absorber = require("scripts.energy-absorber")
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
  freeplay.add_starting_items()
  freeplay.set_custom_intro()
  freeplay.disable_rocket_victory()
  util.ensure_turret_force()

  energy_absorber.init()
  inserter.find_droplanes()
  intergalactic_transceiver.get_max_energy()
  radioactivity.refresh_players()
  radioactivity.reset_entities_items()
  roboport.find_variants()
  tesla_coil.get_absorber_buffer_capacity()

  compatibility.aai_industry()
  compatibility.disco_science()
  compatibility.nuclear_fuel()
  compatibility.schall_uranium()

  for _, player in pairs(game.players) do
    inserter.refresh_gui(player)
    roboport.refresh_gui(player)
  end
end

--- @param filters EntityPrototypeFilter[]
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
      data = old_global.planetary_teleporters or {},
      guis = old_global.planetary_teleporter_guis or {},
      players = old_global.planetary_teleporter_players or {},
      unnamed_translations = old_global.planetary_teleporter_unnamed_translations or {},
    }

    -- Radioactivity
    local old_enabled = old_global.radioactivity_enabled
    -- The old `global` didn't store the variable until it was needed
    if old_enabled == nil then
      old_enabled = true
    end
    global.radioactivity.enabled = old_enabled

    -- Shelter
    for _, entity in
      pairs(find_on_all_surfaces({
        name = { "kr-shelter-light", "kr-shelter", "kr-shelter-plus-light", "kr-shelter-plus" },
      }))
    do
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
  ["1.2.17"] = function()
    -- If we migrated from pre-1.2.0, we don't need to do this
    if global.tesla_coil.beams and global.tesla_coil.turrets then
      return
    end

    -- Destroy all extra entities
    local towers = {}
    for _, tower_data in pairs(global.tesla_coil.by_tower or global.tesla_coil.towers) do
      local tower = tower_data.entities.tower
      if tower and tower.valid then
        table.insert(towers, tower)
      end

      for name, entity in pairs(tower_data.entities) do
        if name ~= "tower" and entity.valid then
          entity.destroy()
        end
      end

      --- @diagnostic disable
      if tower_data.targets and tower_data.targets.by_beam then
        for _, target_data in pairs(tower_data.targets.by_beam) do
          local beam = target_data.beam
          if beam and beam.valid then
            target_data.beam.destroy()
          end
        end
      end
      --- @diagnostic enable
    end

    for _, beam_data in pairs(global.tesla_coil.beams or {}) do
      if beam_data.beam and beam_data.beam.valid then
        beam_data.beam.destroy()
      end
    end

    -- Restart from scratch
    global.tesla_coil = nil
    tesla_coil.init()

    for _, tower in pairs(towers) do
      tesla_coil.build(tower)
    end
  end,
  ["1.2.20"] = function()
    -- Remove invalid entity references
    global.tesla_coil.targets = table.map(global.tesla_coil.targets, function(target_data)
      if target_data.entity and target_data.entity.valid then
        return target_data
      end
    end)

    -- Clean up any remaining MiniWiki buttons
    for _, player in pairs(game.players) do
      local frame = player.gui.top.mod_gui_top_frame --- @diagnostic disable-line
      if frame then
        local frame = frame.mod_gui_inner_frame
        if frame then
          local button = frame["kr-wiki-toggle-wiki"]
          if button then
            button.destroy()
          end
        end
      end
    end
  end,
  ["1.2.22"] = function()
    for _, surface in pairs(game.surfaces) do
      for _, tesla_coil in pairs(surface.find_entities_filtered({ name = "kr-tesla-coil" })) do
        -- 60 kW / 60 ticks per second
        tesla_coil.power_usage = 60000 / 60
      end
    end
  end,
  ["1.3.0"] = function()
    energy_absorber.init()
    if game.finished or game.finished_but_continuing then
      for _, force in pairs(game.forces) do
        force.technologies["kr-logo"].enabled = true
      end
    end
  end,
  ["1.3.4"] = function()
    -- Unlock new recipes
    for _, force in pairs(game.forces) do
      force.reset_technology_effects()
    end
  end,
  ["1.3.7"] = function()
    global.inserter_has_droplane_gui = nil
  end,
  ["1.3.8"] = function()
    -- Clean up any invalid inserter and roboport GUIs
    local new = {}
    for player_index, player_gui in pairs(global.inserter_guis) do
      if player_gui.valid then
        new[player_index] = player_gui
      end
    end
    global.inserter_guis = new
    local new = {}
    for player_index, player_gui in pairs(global.roboport_guis) do
      if player_gui.valid then
        new[player_index] = player_gui
      end
    end
    global.roboport_guis = new
  end,
  ["1.3.10"] = function()
    -- Clean up any orphaned internal entities
    local valid_unit_numbers = {}
    for _, data in pairs(global.tesla_coil.towers) do
      for _, entity in pairs(data.entities) do
        if entity.valid then
          valid_unit_numbers[entity.unit_number or 0] = true
        end
      end
    end
    for _, data in pairs(global.planetary_teleporter.data) do
      for _, entity in pairs(data.entities) do
        if entity.valid then
          valid_unit_numbers[entity.unit_number or 0] = true
        end
      end
    end
    for _, surface in pairs(game.surfaces) do
      for _, entity in
        pairs(surface.find_entities_filtered({
          name = {
            "kr-planetary-teleporter-turret",
            "kr-planetary-teleporter-front-layer",
            "kr-planetary-teleporter-collision-1",
            "kr-planetary-teleporter-collision-2",
            "kr-planetary-teleporter-collision-3",
            "kr-tesla-coil-turret",
            "kr-tesla-coil-collision",
          },
        }))
      do
        if entity.valid and not valid_unit_numbers[entity.unit_number] then
          entity.destroy()
        end
      end
    end
  end,
}

return migrations
