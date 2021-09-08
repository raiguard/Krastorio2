if not mods["Squeak Through"] then
  return
end

require("__Squeak Through__/config")

function addExcludedEntityToSqueakThrough(name, category)
  ---@diagnostic disable-next-line
  table.insert(exclusions, {
    {
      apply_when_object_exists = {
        type = category,
        name = name,
      },
      excluded_prototype_names = {
        name,
      },
    },
  })
end

local exclusions_to_add = {
  ["ammo-turret"] = {
    "kr-railgun-turret",
    "kr-rocket-turret",
  },
  ["accumulator"] = {
    "kr-energy-storage",
    "kr-intergalactic-transceiver",
  },
  ["assembling-machine"] = {
    "kr-greenhouse",
    "kr-advanced-furnace",
    "kr-electrolysis-plant",
    "kr-filtration-plant",
    "kr-air-filter",
    "kr-fuel-refinery",
    "kr-atmospheric-condenser",
    "kr-bio-lab",
    "kr-fuel-refinery",
    "kr-advanced-chemical-plant",
    "kr-matter-assembler",
    "kr-matter-plant",
    "kr-quantum-computer",
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
    "kr-shelter-container",
    "kr-shelter-plus-container",
  },
  ["lab"] = {
    "biusart_lab",
    "kr-singularity-lab",
  },
  ["furnace"] = {
    "kr-crusher",
    "kr-fluid-burner",
    "kr-crusher",
    "kr-air-purifier",
    "kr-fusion-reactor",
    "kr-stabilizer-charging-station",
  },
  ["mining-drill"] = {
    "kr-mineral-water-pumpjack",
    "kr-quarry-drill",
  },
  ["electric-energy-interface"] = {
    "kr-wind-turbine",
    "kr-shelter",
    "kr-shelter-plus",
    "kr-activated-intergalactic-transceiver",
  },
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
  ["storage-tank"] = {
    "fluid-storage-1",
    "fluid-storage-2",
  },
  ["generator"] = {
    "kr-advanced-steam-turbine",
    "kr-gas-power-station",
  },
  ["radar"] = {
    "kr-sentinel",
  },
  ["solar-panel"] = {
    "kr-advanced-solar-panel",
  },
  ["roboport"] = {
    "kr-small-roboport",
    "kr-large-roboport",
  },
}

if settings.startup["loaders"] and settings.startup["loaders"].value then
  if mods["space-exploration"] then
    exclusions_to_add["loader"] = {
      "kr-loader",
      "kr-fast-loader",
      "kr-express-loader",
      "kr-superior-loader",
    }
  else
    exclusions_to_add["loader"] = {
      "kr-loader",
      "kr-fast-loader",
      "kr-express-loader",
      "kr-superior-loader",
      "kr-se-loader",
    }
  end
end

for category_name, entities in pairs(exclusions_to_add) do
  for _, entity_name in pairs(entities) do
    if krastorio.entities.exist(category_name, entity_name) then
      addExcludedEntityToSqueakThrough(entity_name, category_name)
      data.raw[category_name][entity_name].squeak_behaviour = false
    end
  end
end
