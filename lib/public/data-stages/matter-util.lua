krastorio.matter_func = {}

-- -- -- PUBLIC

-- For use this functions call it with (ex):
-- local matter = require("__Krastorio__/lib/matter-util")
-- matter.whatfunctionyouwant()

--[[
  This function will create two recipes for convert one item to matter
  and the recipe for re-convert into the original(or another) item using matter,
  for the two(or one) generated recipes will be add a limitation on productivity modules too
  
  Can be converted only items, fluids and tools(science pack), not other items is accepted for conversions
  
  This is how must be defined the args table, only argument of function call
  (the first tree variable is mandatory, the other is optional)
  args=
  {
    item_name = a, -- (string) the name of raw product.
    minimum_conversion_quantity = b, -- (integer) the quantity of item necessary to make one conversion, is also the returned quantity from one deconversion.
    matter_value = c, -- (integer) how much matter is gained by conversion and necessary to create the item from matter(minimum_conversion_quantity corresponds to matter_value).
    conversion_matter_value = d, -- (optional)(integer) Different value from the matter_value of the item, that specify the matter gained by converting this item to matter (used when wanted different values on conversions).
    return_item = e, -- (optional)(string) if the return item from the decoversion(matter to item) is different from the first one.
    unlocked_by_technology = f, -- (optional)(string) what technology(the name) unlock the recipes, if isn't setted will be the first that make access to matter conversions.
    energy_required = g, -- (optional)(integer) how much time need the conversion.
    only_conversion = h, -- (optional)(boolean) if this param is true will be added only the recipe to get matter from the item, but not the deconversion from matter.
    only_deconversion = i, -- (optional)(boolean) if this param is true will be added only the recipe to get the item(or return_item) from matter, but not the conversion to matter.
    need_stabilizer = l, (optional)(boolean) if the item need stabilizer to be deconverted from matter to the original item(or return_item).
    allow_productivity = m, (optional)(boolean) if true, productivity modules can be used on de-conversion from matter (matter->item).
  }
]]
--
-- @args, all defined arguments of function
function krastorio.matter_func.createMatterRecipe(args)
  local _item = krastorio.items.getItem(args.item_name)
  if _item then
    local true_item_type = _item.type
    if true_item_type == "tool" then
      true_item_type = "item"
    end

    local _return_item = krastorio.items.getItem(args.return_item)
    if not _return_item then
      _return_item = _item
    end
    local true_return_item_type = _return_item.type
    if true_return_item_type == "tool" then
      true_return_item_type = "item"
    end

    local _energy_required = args.energy_required or 2

    local _technology = args.unlocked_by_technology or "kr-matter-processing"

    if args.only_deconversion == nil or args.only_deconversion ~= true then
      local item_to_matter = {
        type = "recipe",
        name = _item.name .. "-to-matter",
        localised_name = { "recipe-name.to-matter", { true_item_type .. "-name." .. _item.name } },
        category = "matter-conversion",
        subgroup = "matter-conversion",
        allow_as_intermediate = false,
        icons = {
          { icon = kr_arrows_icons_path .. "arrow-m.png", icon_size = 64 },
        },
        energy_required = _energy_required,
        enabled = false,
        hidden = false,
        hide_from_player_crafting = true,
        always_show_made_in = true,
        always_show_products = true,
        show_amount_in_title = false,
        ingredients = {
          { type = true_item_type, name = _item.name, amount = args.minimum_conversion_quantity },
        },
        results = {
          { type = "fluid", name = "matter", amount = args.conversion_matter_value or args.matter_value },
        },
        order = "z[" .. _item.name .. "-to-matter]",
      }

      -- complete the icons overlay
      krastorio.icons.addOverlayIcons(item_to_matter, krastorio.icons.getIconsForOverlay(_item), 64, 0.28, { -8, -6 })

      table.insert(item_to_matter.icons, {
        icon = kr_fluids_icons_path .. "matter.png",
        icon_size = 64,
        scale = 0.28,
        shift = { 4, 8 },
      })

      data:extend({ item_to_matter })
      krastorio.technologies.addUnlockRecipe(_technology, item_to_matter.name)
    end

    if args.only_conversion == nil or args.only_conversion ~= true then
      local stab_string = ""
      if args.need_stabilizer ~= nil and args.need_stabilizer == true then
        stab_string = "-with-stabilizer"
      end

      local matter_to_item = {
        type = "recipe",
        name = "matter-to-" .. _return_item.name,
        localised_name = { "recipe-name.matter-to", { true_return_item_type .. "-name." .. _item.name } },
        category = "matter-deconversion",
        subgroup = "matter-deconversion",
        allow_as_intermediate = false,
        icons = {
          { icon = kr_arrows_icons_path .. "arrow-i.png", icon_size = 64 },
          { icon = kr_fluids_icons_path .. "matter.png", icon_size = 64, scale = 0.28, shift = { 8, -6 } },
        },
        energy_required = _energy_required,
        enabled = false,
        hide_from_player_crafting = true,
        always_show_made_in = true,
        always_show_products = true,
        show_amount_in_title = false,
        ingredients = {
          { type = "fluid", name = "matter", amount = args.matter_value, catalyst_amount = args.matter_value },
        },
        results = {
          { type = true_return_item_type, name = _return_item.name, amount = args.minimum_conversion_quantity },
        },
        order = "z[matter-to-" .. _return_item.name .. "]",
      }

      -- complete the icons overlay
      krastorio.icons.addOverlayIcons(
        matter_to_item,
        krastorio.icons.getIconsForOverlay(_return_item),
        64,
        0.28,
        { -4, 8 }
      )

      if args.need_stabilizer ~= nil and args.need_stabilizer == true then
        matter_to_item.localised_description = { "recipe-description.matter-recipe-with-stabilizer" }
        matter_to_item.main_product = _return_item.name
        table.insert(matter_to_item.ingredients, {
          type = "item",
          name = "charged-matter-stabilizer",
          amount = 1,
          catalyst_amount = 1,
        })
        table.insert(matter_to_item.results, {
          type = "item",
          name = "matter-stabilizer",
          probability = 0.99,
          amount = 1,
          amount_max = 1,
          catalyst_amount = 1,
        })
      end

      data:extend({ matter_to_item })
      krastorio.technologies.addUnlockRecipe(_technology, matter_to_item.name)
      if args.allow_productivity then
        krastorio.modules.addProductivityLimitation(matter_to_item.name)
      end
    end
  end
end

--[[
  This is the argument that must be given for remove a matter recipe:
  
  item_name, -- (string) the name of raw product 
  return_item -- (optional)(string) if the return item from the decoversion(matter to item) is different from the first one
--]]
-- @item_name
-- @return_item
function krastorio.matter_func.removeMatterRecipe(item_name, return_item)
  local _item = krastorio.items.getItem(item_name)
  local _return_item = krastorio.items.getItem(return_item)
  if not _return_item then
    _return_item = _item
  end
  local matter_recipe_name = _item.name .. "-to-matter"
  local de_matter_recipe_name = "matter-to-" .. _return_item.name

  if krastorio.recipes.exist(matter_recipe_name) then
    krastorio.modules.removeProductivityLimitation(matter_recipe_name)
    data.raw.recipe[matter_recipe_name] = nil
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies(matter_recipe_name)
  end

  if krastorio.recipes.exist(de_matter_recipe_name) then
    krastorio.modules.removeProductivityLimitation(de_matter_recipe_name)
    data.raw.recipe[de_matter_recipe_name] = nil
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies(de_matter_recipe_name)
  end
end

function krastorio.matter_func.removeAllKrastorioMatterRecipes()
  krastorio.matter_func.removeMatterRecipe("wood")
  krastorio.matter_func.removeMatterRecipe("iron-ore")
  krastorio.matter_func.removeMatterRecipe("copper-ore")
  krastorio.matter_func.removeMatterRecipe("raw-rare-metals")
  krastorio.matter_func.removeMatterRecipe("sand")
  krastorio.matter_func.removeMatterRecipe("stone")
  krastorio.matter_func.removeMatterRecipe("coal")
  krastorio.matter_func.removeMatterRecipe("water")
  krastorio.matter_func.removeMatterRecipe("mineral-water")
  krastorio.matter_func.removeMatterRecipe("crude-oil")
  krastorio.matter_func.removeMatterRecipe("uranium-ore")
  krastorio.matter_func.removeMatterRecipe("uranium-238")
  krastorio.matter_func.removeMatterRecipe("uranium-235")
  krastorio.matter_func.removeMatterRecipe("raw-imersite")
  krastorio.matter_func.removeMatterRecipe("imersite-powder")
  krastorio.matter_func.removeMatterRecipe("quartz")
  krastorio.matter_func.removeMatterRecipe("glass")
  krastorio.matter_func.removeMatterRecipe("sulfur")
  krastorio.matter_func.removeMatterRecipe("silicon")
  krastorio.matter_func.removeMatterRecipe("copper-plate")
  krastorio.matter_func.removeMatterRecipe("iron-plate")
  krastorio.matter_func.removeMatterRecipe("steel-plate")
  krastorio.matter_func.removeMatterRecipe("plastic-bar")
  krastorio.matter_func.removeMatterRecipe("biomass")
  krastorio.matter_func.removeMatterRecipe("matter-cube")
end

-- -- -- KRASTORIO ONLY (Use it if you know what you are doing)

function krastorio.matter_func.createStandardKrastorioMatterRecipes()
  -- -- Bidirectional

  -- matter technology
  ----
  -- wood
  local wood = {
    item_name = "wood",
    minimum_conversion_quantity = 10,
    matter_value = 2,
    energy_required = 1,
  }
  krastorio.matter_func.createMatterRecipe(wood)

  -- biomass
  local wood = {
    item_name = "biomass",
    minimum_conversion_quantity = 10,
    matter_value = 5,
    energy_required = 1,
  }
  krastorio.matter_func.createMatterRecipe(wood)
  ----

  -- iron ore
  local iron_ore = {
    item_name = "iron-ore",
    minimum_conversion_quantity = 10,
    matter_value = 5,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-iron-processing",
  }
  krastorio.matter_func.createMatterRecipe(iron_ore)

  -- copper ore
  local copper_ore = {
    item_name = "copper-ore",
    minimum_conversion_quantity = 10,
    matter_value = 5,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-copper-processing",
  }
  krastorio.matter_func.createMatterRecipe(copper_ore)

  -- raw rare metals
  local raw_rare_metals = {
    item_name = "raw-rare-metals",
    minimum_conversion_quantity = 10,
    matter_value = 8,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-rare-metals-processing",
  }
  krastorio.matter_func.createMatterRecipe(raw_rare_metals)

  -- stone
  local stone = {
    item_name = "stone",
    minimum_conversion_quantity = 10,
    matter_value = 3.5,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-stone-processing",
  }
  krastorio.matter_func.createMatterRecipe(stone)

  -- coal
  local coal = {
    item_name = "coal",
    minimum_conversion_quantity = 10,
    matter_value = 3.5,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-coal-processing",
  }
  krastorio.matter_func.createMatterRecipe(coal)

  -- water
  local water = {
    item_name = "water",
    minimum_conversion_quantity = 100,
    matter_value = 0.5,
    only_deconversion = true,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-water-processing",
  }
  krastorio.matter_func.createMatterRecipe(water)

  -- mineral water
  local crude_oil = {
    item_name = "mineral-water",
    minimum_conversion_quantity = 100,
    matter_value = 5,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-water-processing",
  }
  krastorio.matter_func.createMatterRecipe(crude_oil)

  -- crude oil
  local crude_oil = {
    item_name = "crude-oil",
    minimum_conversion_quantity = 100,
    matter_value = 6,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-oil-processing",
  }
  krastorio.matter_func.createMatterRecipe(crude_oil)

  -- uranium-ore
  local uranium_ore = {
    item_name = "uranium-ore",
    minimum_conversion_quantity = 10,
    matter_value = 8,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-uranium-processing",
  }
  krastorio.matter_func.createMatterRecipe(uranium_ore)

  -- uranium 238
  local uranium_238 = {
    item_name = "uranium-238",
    minimum_conversion_quantity = 10,
    matter_value = 47.1,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-uranium-processing",
  }
  krastorio.matter_func.createMatterRecipe(uranium_238)

  -- raw-imersite
  local raw_imersite = {
    item_name = "raw-imersite",
    minimum_conversion_quantity = 10,
    matter_value = 10,
    energy_required = 1,
    only_conversion = true,
    unlocked_by_technology = "kr-matter-minerals-processing",
  }
  krastorio.matter_func.createMatterRecipe(raw_imersite)

  -- imersite powder
  local imersite_powder = {
    item_name = "imersite-powder",
    minimum_conversion_quantity = 10,
    matter_value = 3.35,
    energy_required = 1,
    unlocked_by_technology = "kr-matter-minerals-processing",
  }
  krastorio.matter_func.createMatterRecipe(imersite_powder)

  -- -- Only to matter (item -> matter)

  -- quartz
  local quartz = {
    item_name = "quartz",
    minimum_conversion_quantity = 10,
    matter_value = 1.84,
    energy_required = 1,
    only_conversion = true,
    unlocked_by_technology = "kr-matter-stone-processing",
  }
  krastorio.matter_func.createMatterRecipe(quartz)

  -- -- Only from matter (matter -> item)

  -- sand
  local sand = {
    item_name = "sand",
    minimum_conversion_quantity = 10,
    matter_value = 1.17,
    energy_required = 1,
    only_deconversion = true,
    unlocked_by_technology = "kr-matter-stone-processing",
  }
  krastorio.matter_func.createMatterRecipe(sand)

  -- sulfur
  local sulfur = {
    item_name = "sulfur",
    minimum_conversion_quantity = 10,
    matter_value = 8,
    energy_required = 4,
    need_stabilizer = true,
    only_deconversion = true,
    unlocked_by_technology = "kr-matter-oil-processing",
  }
  krastorio.matter_func.createMatterRecipe(sulfur)

  -- -- -- Intermediate (need stabilizer)
  -- -- Only from matter (matter -> item)

  -- other

  -- glass
  local glass = {
    item_name = "glass",
    minimum_conversion_quantity = 10,
    matter_value = 3.5,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-stone-processing",
  }
  krastorio.matter_func.createMatterRecipe(glass)

  -- silicon
  local k_silicon = {
    item_name = "silicon",
    minimum_conversion_quantity = 10,
    matter_value = 4.67,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-stone-processing",
  }
  krastorio.matter_func.createMatterRecipe(k_silicon)

  -- copper_plate
  local copper_plate = {
    item_name = "copper-plate",
    minimum_conversion_quantity = 10,
    matter_value = 7.5,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-copper-processing",
  }
  krastorio.matter_func.createMatterRecipe(copper_plate)

  -- iron_plate
  local iron_plate = {
    item_name = "iron-plate",
    minimum_conversion_quantity = 10,
    matter_value = 7.5,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-iron-processing",
  }
  krastorio.matter_func.createMatterRecipe(iron_plate)

  -- rare metals
  local rare_metals = {
    item_name = "rare-metals",
    minimum_conversion_quantity = 10,
    matter_value = 14,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-rare-metals-processing",
  }
  krastorio.matter_func.createMatterRecipe(rare_metals)

  -- steel plate (vanilla)
  local steel_plate = {
    item_name = "steel-plate",
    minimum_conversion_quantity = 10,
    matter_value = 17.2,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-iron-processing",
  }
  krastorio.matter_func.createMatterRecipe(steel_plate)

  -- plastic bar
  local plastic_bar = {
    item_name = "plastic-bar",
    minimum_conversion_quantity = 10,
    matter_value = 6.6,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-oil-processing",
  }
  krastorio.matter_func.createMatterRecipe(plastic_bar)

  -- matter cube
  local matter_cube = {
    item_name = "matter-cube",
    minimum_conversion_quantity = 1,
    matter_value = 1000,
    energy_required = 15,
    need_stabilizer = true,
    unlocked_by_technology = "kr-matter-cube",
  }
  krastorio.matter_func.createMatterRecipe(matter_cube)
end

-- Remove all matter recipe, and recreate the Krastorio matter recipes
-- will keep all matter recipes of other mods
function krastorio.matter_func.recreateStandardKrastorioMatterRecipes()
  krastorio.matter_func.removeAllKrastorioMatterRecipes()
  krastorio.matter_func.createStandardKrastorioMatterRecipes()
end

return krastorio.matter_func
