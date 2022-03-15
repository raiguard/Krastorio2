-- require('__debugadapter__/debugadapter.lua')
local kr_color_lib = require(kr_path .. "lib/private/data-stages/colorRGB")

if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Chaning the name of the antimatter reactor for not be the same of the antimatter reactor of SE
  data.raw["burner-generator"]["kr-antimatter-reactor"].localised_name = { "entity-name.kr-singularity-reactor" }

  -- Remove the SE fuel refiny to not be redundant
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("se-fuel-refining", "kr-fuel", true)
  data.raw.technology["se-fuel-refining"] = nil
  krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-petroleum-gas")
  krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-light-oil")
  krastorio.technologies.addUnlockRecipe("kr-fuel", "solid-fuel-from-heavy-oil")
  -- Adding to Krastorio fuel refinery the SE fuel refinery crafting category
  krastorio.entities.addCraftingCategory("assembling-machine", "kr-fuel-refinery", "fuel-refining")

  -- Fix double radars techs
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("radar", "kr-radar", true)
  krastorio.technologies.addUnlockRecipe("kr-radar", "radar")
  data.raw.technology["radar"] = nil

  -- Fix laboratory science packs
  if data.raw.lab["kr-singularity-lab"] then
    table.insert(data.raw.lab["kr-singularity-lab"].inputs, "space-science-pack")
    table.insert(data.raw.lab["kr-singularity-lab"].inputs, "se-deep-space-science-pack")
  end

  -- Rebalance the electric boiler to not create infinite energy
  if krastorio.general.getSafeSettingValue("se-electric-boiler") then
    data.raw["boiler"]["se-electric-boiler"].target_temperature = 99
  end

  -- Adding new space loader if krastorio 2 loaders are enabled
  if krastorio.general.getSafeSettingValue("kr-loaders") then
    local kr_se_graphic_path = kr_graphic_mod_path .. "compatibility/space-exploration/"
    data:extend({
      kr_loader_item({
        name = "kr-se-loader",
        icon = kr_se_graphic_path .. "kr-se-loader.png",
        icon_size = 32,
        order = "d[loader]-a5[se-loader]",
        subgroup = "belt",
      }),
      createKrastorioLoader({
        name = "kr-se-loader",
        speed = data.raw["transport-belt"]["se-space-transport-belt"].speed,
        belt_animation_set = data.raw["transport-belt"]["se-space-transport-belt"].belt_animation_set,
        order = "z-l[loader]-z[loader]",
        icon = kr_se_graphic_path .. "kr-se-loader.png",
        icon_size = 32,
        tint = kr_color_lib.convert(240, 240, 240, 125),
        apply_rust = false,
        se_allow_in_space = true,
        energy_required = data.raw["recipe"]["se-space-transport-belt"].energy_required,
      }),
      kr_loader_recipe({
        name = "kr-se-loader",
        -- Copying the recipe category is the right way. It would enable the use of lubricant, but this will break old games.
        -- category = data.raw["recipe"]["se-space-splitter"].category,
        ingredients = {
          { "steel-gear-wheel", 10 },
          -- { "kr-fast-loader", 2 },
          { "steel-plate", 10 },
          { "se-space-transport-belt", 1 },
          -- { type = "fluid", name = "lubricant", amount = 40},
        },
        subgroup = "belt",
      }),
    })
    krastorio.technologies.addUnlockRecipe("se-space-platform-scaffold", "kr-se-loader")
    for _, color in pairs({ "black", "blue", "cyan", "green", "magenta", "red", "white", "yellow" }) do
      data:extend({
        createKrastorioLoader({
          name = "kr-se-deep-space-loader-" .. color,
          localised_name = { "entity-name.kr-se-deep-space-loader" },
          speed = data.raw["transport-belt"]["se-deep-space-transport-belt-" .. color].speed,
          belt_animation_set = data.raw["transport-belt"]["se-deep-space-transport-belt-" .. color].belt_animation_set,
          order = data.raw["transport-belt"]["se-deep-space-transport-belt-" .. color].order,
          icon = kr_se_graphic_path .. "kr-se-deep-space-loader-black.png",
          icon_size = 64,
          tint = kr_color_lib.convert(50, 50, 50, 100),
          apply_rust = false,
          se_allow_in_space = true,
          upgrade = "kr-se-loader",
          result = "kr-se-deep-space-loader-black",
        }),
      })
    end
    data:extend({
      kr_loader_item({
        name = "kr-se-deep-space-loader-black",
        icon = kr_se_graphic_path .. "kr-se-deep-space-loader-black.png",
        icon_size = 64,
        order = "e-g",
        subgroup = "belt",
      }),
      kr_loader_recipe({
        name = "kr-se-deep-space-loader-black",
        category = data.raw["recipe"]["se-deep-space-splitter"].category,
        energy_required = data.raw["recipe"]["se-deep-space-splitter"].energy_required,
        ingredients = {
          { "se-naquium-cube", 1 },
          { "imersium-gear-wheel", 10 },
          { "kr-se-loader", 2 },
          { type = "fluid", name = "lubricant", amount = 100 },
          { "se-deep-space-transport-belt-black", 1 },
          { "se-superconductive-cable", 1 },
          { "se-dynamic-emitter", 1 },
          { "ai-core", 1 },
        },
        subgroup = "belt",
      }),
    })
    krastorio.technologies.addUnlockRecipe("se-deep-space-transport-belt", "kr-se-deep-space-loader-black")
  end

  -- -- Singularity laboratory fixes
  -- Special collision
  data.raw["lab"]["kr-singularity-lab"].collision_mask = data.raw["lab"]["se-space-science-lab"].collision_mask
  krastorio.entities.addLabInput("kr-singularity-lab", "se-deep-space-science-pack")
end
