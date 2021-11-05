if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Space collisions
  ------------------------------------------------------------------------------------------------

  -- Whitelisting the K2 entities in right way how SE manage the space entities,
  -- all entities in the se_allow_in_space CAN(POSITIVE) BE placed in the space
  local allow_in_space = {
    ["accumulator"] = {
      "kr-energy-storage",
      "kr-intergalactic-transceiver",
    },
    ["assembling-machine"] = {
      "kr-fuel-refinery",
    },
    ["beacon"] = {
      "kr-singularity-beacon",
    },
    ["burner-generator"] = {
      "kr-antimatter-reactor",
    },
    ["container"] = {
      "kr-medium-container",
      "kr-big-container",
    },
    ["electric-energy-interface"] = {
      "kr-tesla-coil",
    },
    ["inserter"] = {
      "kr-superior-inserter",
      "kr-superior-long-inserter",
      "kr-superior-filter-inserter",
      "kr-superior-long-filter-inserter",
      "kr-superior-long-filter-inserter",
    },
    ["lab"] = {
      "kr-singularity-lab",
    },
    -- kr-se-loader is given the property in data-final-fixes, when it is created
    -- ["loader-1x1"] =
    -- {
    --  "kr-se-loader"
    -- },
    ["logistic-container"] = {
      "kr-medium-active-provider-container",
      "kr-medium-buffer-container",
      "kr-medium-passive-provider-container",
      "kr-medium-requester-container",
      "kr-medium-storage-container",

      "kr-big-active-provider-container",
      "kr-big-buffer-container",
      "kr-big-passive-provider-container",
      "kr-big-requester-container",
      "kr-big-storage-container",
    },
    ["mining-drill"] = {
      "kr-quarry-drill",
    },
    ["radar"] = {
      "kr-sentinel",
    },
    ["solar-panel"] = {
      "kr-advanced-solar-panel",
    },
    ["storage-tank"] = {
      "kr-fluid-storage-1",
      "kr-fluid-storage-2",
    },
  }

  for category_name, entities in pairs(allow_in_space) do
    for _, entity_name in pairs(entities) do
      local entity = data.raw[category_name][entity_name]
      if entity then
        entity.se_allow_in_space = true
      end
    end
  end

  -- Adding space collisions (Disabling some Krastorio 2 entities in space),
  -- this is a BLACKLIST, all entities in this table CAN'T(NOT) be placed in the space.
  local krastorio_entities_to_add = {
    ["assembling-machine"] = {
      "kr-advanced-furnace",
      "kr-electrolysis-plant",
      "kr-filtration-plant",
      "kr-air-filter",
    },
    ["boiler"] = {
      "se-electric-boiler",
    },
    ["generator"] = {
      "kr-advanced-steam-turbine",
    },
    ["furnace"] = {
      "kr-crusher",
      "kr-air-purifier",
    },
    ["lab"] = {
      "biusart-lab",
    },
    ["loader-1x1"] = {
      "kr-loader",
      "kr-fast-loader",
      "kr-express-loader",
      "kr-advanced-loader",
      "kr-superior-loader",
    },
    ["mining-drill"] = {
      "kr-water-pumpjack",
    },
    ["electric-energy-interface"] = {
      "kr-wind-turbine",
    },
  }

  local collision_mask_util_extended = require(
    "__space-exploration__/collision-mask-util-extended/data/collision-mask-util-extended"
  )
  local space_collision_layer = collision_mask_util_extended.get_make_named_collision_mask("space-tile")

  for category_name, entities in pairs(krastorio_entities_to_add) do
    for _, entity_name in pairs(entities) do
      krastorio.entities.addCollisionMaskOnEntity(category_name, entity_name, space_collision_layer)
    end
  end
  ------------------------------------------------------------------------------------------------
  -- Mark tech that are touched by SE
  function string.starts_with(string_to_check, start_string)
    return string.sub(string_to_check, 1, string.len(start_string)) == start_string
  end

  for technology_name, technology in pairs(data.raw.technology) do
    if string.starts_with(technology_name, "se-") then
      technology.check_science_packs_incompatibilities = false
    end
  end
  ------------------------------------------------------------------------------------------------
end
