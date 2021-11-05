-- -- -- VANILLA EQUIPMENTS MODIFICATION

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

-- -- Utils Function

-- Add radioactive damage resistance to armors
-- @armor_name, armor name
-- @decrease, decrease value
-- @percent, percent value
function addRadioactiveResistance(armor_name, decrease, percent)
  local armor = data.raw["armor"][armor_name]
  if armor then
    if not armor.resistances then
      armor.resistances = {}
    end
    table.insert(armor.resistances, {
      ["type"] = "radioactive",
      ["decrease"] = decrease,
      ["percent"] = percent,
    })
  end
end

-- Update a icon and sprites a given table (dictionary),
-- formatted with: { categories{ items-->[path,icon_size,sprite.width,sprite.height]... }... }
-- Possible property:
-- [1] -> icon name
-- [2] -> icon size
-- [3] -> sprite width
-- [4] -> sprite height
-- [5] -> tier of overlay
-- [6] -> icon_mipmaps
-- @_objects_to_modify, list of graphics to modify with the format over described
-- @icons_path, path where is the new icons of this objects
-- @sprites_path, path where is the new sprites of this objects
function updateVanillaEquipmentGraphics(_objects_to_modify, icons_path, sprites_path)
  for category_name, items in pairs(_objects_to_modify) do
    for item_name, item in pairs(items) do
      if data.raw.item[item_name] then
        if not item[5] then -- tier
          data.raw.item[item_name].icon = icons_path .. item[1] -- icon name
          data.raw.item[item_name].icon_size = item[2] -- icon size
          data.raw.item[item_name].icon_mipmaps = item[6]
        else
          data.raw.item[item_name].icon = nil
          data.raw.item[item_name].icons = {
            { icon = icons_path .. item[1], icon_size = item[2], icon_mipmaps = item[6] },
            { icon = kr_equipments_tiers_icon_path .. tostring(item[5]) .. ".png", icon_size = 64 }, -- , scale = item[2]/64
          }
          data.raw.item[item_name].icon_size = item[2] -- icon size
        end
        if data.raw[category_name][item_name] then
          data.raw[category_name][item_name].sprite = {
            filename = sprites_path .. item[1],
            priority = "medium",
            width = item[3],
            height = item[4],
            hr_version = {
              filename = sprites_path .. "hr-" .. item[1],
              priority = "medium",
              width = item[3] * 2,
              height = item[4] * 2,
              scale = 0.5,
            },
          }
        end
      end
    end
  end
end

-- Update grid of specified vehicle, will integrate with the grid the equipment categories of old grid
-- that is different from "armor" that is dedicated to character equipment
-- @vehicle_type, prototype type of vehicle
-- @vehicle_name, name of vehicle
-- @equipment_grid_name, name of the new grid to apply
local function applyAndIntegrateEquipmentCategories(vehicle_type, vehicle_name, equipment_grid_name)
  if data.raw[vehicle_type][vehicle_name] then
    if
      data.raw[vehicle_type][vehicle_name].equipment_grid
      and data.raw["equipment-grid"][data.raw[vehicle_type][vehicle_name].equipment_grid]
    then
      local equipment_categories_set = {}
      for _, equipment_category in pairs(data.raw["equipment-grid"][equipment_grid_name].equipment_categories) do
        equipment_categories_set[equipment_category] = true
      end

      for _, equipment_category in pairs(data.raw["equipment-grid"][data.raw[vehicle_type][vehicle_name].equipment_grid].equipment_categories) do
        if equipment_category ~= "armor" and not equipment_categories_set[equipment_category] then
          table.insert(data.raw["equipment-grid"][equipment_grid_name].equipment_categories, equipment_category)
        end
      end
    end

    data.raw[vehicle_type][vehicle_name].equipment_grid = equipment_grid_name
  end
end

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

-- -- -- ARMORS
addRadioactiveResistance("modular-armor", 2, 15)
addRadioactiveResistance("power-armor", 3, 30)
addRadioactiveResistance("power-armor-mk2", 4, 45)

-- Armors:
table.insert(data.raw["equipment-grid"]["small-equipment-grid"].equipment_categories, "universal-equipment")
table.insert(data.raw["equipment-grid"]["small-equipment-grid"].equipment_categories, "robot-interaction-equipment")
table.insert(data.raw["equipment-grid"]["medium-equipment-grid"].equipment_categories, "universal-equipment")
table.insert(data.raw["equipment-grid"]["medium-equipment-grid"].equipment_categories, "robot-interaction-equipment")
table.insert(data.raw["equipment-grid"]["large-equipment-grid"].equipment_categories, "universal-equipment")
table.insert(data.raw["equipment-grid"]["large-equipment-grid"].equipment_categories, "robot-interaction-equipment")

-- Armor grids rebalance
data.raw["equipment-grid"]["small-equipment-grid"].width = 4
data.raw["equipment-grid"]["small-equipment-grid"].height = 4

data.raw["equipment-grid"]["medium-equipment-grid"].width = 6
data.raw["equipment-grid"]["medium-equipment-grid"].height = 6

data.raw["equipment-grid"]["large-equipment-grid"].width = 8
data.raw["equipment-grid"]["large-equipment-grid"].height = 8

-- -- Vanilla armors recipes changing

-- Heavy armor
krastorio.recipes.addOrReplaceIngredient("heavy-armor", "light-armor", { "light-armor", 1 })
krastorio.recipes.removeIngredient("heavy-armor", "copper-plate")

-- Modular armor
krastorio.recipes.addOrReplaceIngredient("modular-armor", "heavy-armor", { "heavy-armor", 1 })
krastorio.recipes.removeIngredient("modular-armor", "steel-plate")

-- Power armor (MK1)
krastorio.recipes.addOrReplaceIngredient("power-armor", "modular-armor", { "modular-armor", 1 })
krastorio.recipes.removeIngredient("power-armor", "steel-plate")

-- Power armor MK2
krastorio.recipes.addOrReplaceIngredient("power-armor-mk2", "power-armor", { "power-armor", 1 })
krastorio.recipes.removeIngredient("power-armor-mk2", "processing-unit")

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

-- -- -- VEHICLES
-- -- Creating new equipment vehicle grids and add it
data:extend({
  -----------------------------------------------------------------------------------------------------------------
  -- Car
  {
    type = "equipment-grid",
    name = "kr-car-grid",
    width = 6,
    height = 6,
    equipment_categories = {
      "universal-equipment",
      "robot-interaction-equipment",
      "vehicle-robot-interaction-equipment",
      "vehicle-equipment",
      "vehicle-motor",
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -- Tanks
  {
    type = "equipment-grid",
    name = "kr-tank-grid",
    width = 6,
    height = 11,
    equipment_categories = {
      "universal-equipment",
      "robot-interaction-equipment",
      "vehicle-robot-interaction-equipment",
      "vehicle-equipment",
      "vehicle-motor",
    },
  },
  {
    type = "equipment-grid",
    name = "kr-tank-grid-2",
    width = 12,
    height = 15,
    equipment_categories = {
      "universal-equipment",
      "robot-interaction-equipment",
      "vehicle-robot-interaction-equipment",
      "vehicle-equipment",
      "vehicle-motor",
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -- Train
  {
    type = "equipment-grid",
    name = "kr-locomotive-grid",
    width = 12,
    height = 12,
    equipment_categories = { "universal-equipment", "vehicle-equipment", "vehicle-motor" },
  },
  {
    type = "equipment-grid",
    name = "kr-wagons-grid",
    width = 6,
    height = 16,
    equipment_categories = {
      "universal-equipment",
      "vehicle-equipment",
      "robot-interaction-equipment",
      "vehicle-robot-interaction-equipment",
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -- spidertron
  {
    type = "equipment-grid",
    name = "kr-spidertron-equipment-grid",
    width = 10,
    height = 6,
    equipment_categories = {
      "universal-equipment",
      "robot-interaction-equipment",
      "vehicle-robot-interaction-equipment",
      "vehicle-equipment",
      "vehicle-motor",
    },
  },
})

if krastorio.general.getSafeSettingValue("kr-spidertron-exoskeleton") then
  table.insert(data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories, "spidertron-only")
end

-- -- General vehicles grids compatibility, modify grid and integrate it
applyAndIntegrateEquipmentCategories("car", "car", "kr-car-grid")
applyAndIntegrateEquipmentCategories("car", "tank", "kr-tank-grid")
applyAndIntegrateEquipmentCategories("locomotive", "locomotive", "kr-locomotive-grid")
applyAndIntegrateEquipmentCategories("locomotive", "nuclear-locomotive", "kr-locomotive-grid")
applyAndIntegrateEquipmentCategories("cargo-wagon", "cargo-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("spider-vehicle", "spidertron", "kr-spidertron-equipment-grid")
if data.raw["cargo-wagon"]["cargo-wagon"] then
  data.raw["cargo-wagon"]["cargo-wagon"].allow_robot_dispatch_in_automatic_mode = true
end
applyAndIntegrateEquipmentCategories("fluid-wagon", "fluid-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("artillery-wagon", "artillery-wagon", "kr-wagons-grid")

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

-- -- -- ITEMS(EQUIPMENTS)
local objects_to_modify = nil

-----------------------------------------------------------------------------------------------------------------
-- -- Personal roboports
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify = {
  ["roboport-equipment"] = {
    ["personal-roboport-equipment"] = { "personal-roboport-equipment.png", 64, 64, 64, 1, 4 },
    ["personal-roboport-mk2-equipment"] = { "personal-roboport-mk2-equipment.png", 64, 64, 64, 2, 4 },
  },
}

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

-- Personal roboports (both vanilla)
if data.raw["roboport-equipment"]["personal-roboport-equipment"] then
  data.raw["roboport-equipment"]["personal-roboport-equipment"].robot_limit = 20
  data.raw["roboport-equipment"]["personal-roboport-equipment"].construction_radius = 15
  data.raw["roboport-equipment"]["personal-roboport-equipment"].categories = { "robot-interaction-equipment" }
end

if data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"] then
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].robot_limit = 30
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].energy_source = {
    type = "electric",
    buffer_capacity = "50MJ",
    input_flow_limit = "5000KW",
    usage_priority = "secondary-input",
  }
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].charging_energy = "2000kW"
  data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].categories = { "robot-interaction-equipment" }
end

-- Personal roboport equipment (recipe)
krastorio.recipes.addIngredient("personal-roboport-equipment", { "steel-plate", 10 })
krastorio.recipes.replaceIngredient("personal-roboport-equipment", "battery", { "battery", 45 })
krastorio.recipes.replaceIngredient("personal-roboport-equipment", "advanced-circuit", { "advanced-circuit", 5 })
krastorio.recipes.replaceIngredient("personal-roboport-equipment", "iron-gear-wheel", { "iron-gear-wheel", 20 })
krastorio.recipes.removeIngredient("personal-roboport-equipment", "steel-plate")

-- Personal roboport mk2 equipment (recipe)
krastorio.recipes.replaceIngredient("personal-roboport-mk2-equipment", "processing-unit", { "processing-unit", 20 })

-----------------------------------------------------------------------------------------------------------------
-- -- Batteries
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify = {
  ["battery-equipment"] = {
    ["battery-equipment"] = { "battery-mk1-equipment.png", 64, 32, 64, 1 },
    ["battery-mk2-equipment"] = { "battery-mk2-equipment.png", 64, 32, 64, 2 },
  },
  ["active-defense-equipment"] = {
    ["personal-laser-defense-equipment"] = { "personal-laser-defense-mk1-equipment.png", 64, 64, 64, 1 },
  },
}
if data.raw.item["battery-equipment"] then
  data.raw.item["battery-equipment"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_universal_equipments_icons_path .. "battery-mk1-equipment.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_universal_equipments_icons_path .. "battery-equipment-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
if data.raw.item["battery-mk2-equipment"] then
  data.raw.item["battery-equipment"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_universal_equipments_icons_path .. "battery-mk2-equipment.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_universal_equipments_icons_path .. "battery-equipment-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

-- Equipments categories
table.insert(data.raw["battery-equipment"]["battery-equipment"].categories, "universal-equipment")
table.insert(data.raw["battery-equipment"]["battery-mk2-equipment"].categories, "universal-equipment")

-- -- Statistic Modification
-- Energies
data.raw["battery-equipment"]["battery-equipment"].energy_source = {
  type = "electric",
  buffer_capacity = "10MJ",
  input_flow_limit = "0.25MW",
  output_flow_limit = "0.5MW",
  usage_priority = "tertiary",
}
data.raw["battery-equipment"]["battery-mk2-equipment"].energy_source = {
  type = "electric",
  buffer_capacity = "25MJ",
  input_flow_limit = "0.5MW",
  output_flow_limit = "1MW",
  usage_priority = "tertiary",
}

-- Recipe
krastorio.recipes.overrideIngredients("battery-equipment", {
  { "battery", 2 },
  { "iron-plate", 2 },
  { "electronic-circuit", 1 },
})
krastorio.recipes.overrideIngredients("battery-mk2-equipment", {
  { "battery-equipment", 2 },
  { "steel-plate", 2 },
  { "advanced-circuit", 1 },
})

-- subgroup
data.raw.item["battery-equipment"].order = "b1[battery]-b1[battery-equipment]"
data.raw.item["battery-equipment"].subgroup = "equipment"
data.raw.item["battery-mk2-equipment"].order = "b2[battery]-b3[battery-equipment]"
data.raw.item["battery-mk2-equipment"].subgroup = "equipment"

-----------------------------------------------------------------------------------------------------------------
-- -- Discharge defense
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["active-defense-equipment"]["discharge-defense-equipment"].categories, "universal-equipment")
-- Order
data.raw["active-defense-equipment"]["discharge-defense-equipment"].order =
  "f[active-defense-equipment]-a[discharge-defense-equipment]"
data.raw.item["discharge-defense-equipment"].subgroup = "equipment"
data.raw.item["discharge-defense-equipment"].order = "f[active-defense-equipment]-a[discharge-defense-equipment]"
-- Order for remote item
data.raw.capsule["discharge-defense-remote"].subgroup = "equipment"
data.raw.capsule["discharge-defense-remote"].order = "f[active-defense-equipment]-b[discharge-defense-remote]"

-----------------------------------------------------------------------------------------------------------------
-- -- Fusion reactor
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify = {
  ["generator-equipment"] = {
    ["fusion-reactor-equipment"] = { "fusion-reactor-equipment.png", 64, 128, 128, 2 },
  },
}
if data.raw.item["fusion-reactor-equipment"] then
  data.raw.item["fusion-reactor-equipment"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_universal_equipments_icons_path .. "fusion-reactor-equipment.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_universal_equipments_icons_path .. "fusion-reactor-equipment-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

krastorio.icons.setTechnologyIcons("fusion-reactor-equipment", {
  { icon = kr_technologies_icons_path .. "fusion-reactor-equipment.png", icon_size = 256, icon_mipmaps = 4 },
  { icon = kr_technologies_icons_path .. "overlays/equipment-overlay.png", icon_size = 256, icon_mipmaps = 4 },
}, 256, 4)

-- Equipments categories
table.insert(data.raw["generator-equipment"]["fusion-reactor-equipment"].categories, "universal-equipment")

data.raw["generator-equipment"]["fusion-reactor-equipment"].burner = {
  fuel_category = "fusion-fuel",
  effectivity = 2,
  fuel_inventory_size = 1,
  burnt_inventory_size = 1,
}

-- -- Energy generated by equipment:
-- Equipment energy generated is balanced on this formula:
-- power = 50kW * grid_cells_occupied * tier_multiplier * big_version_multiplier
-- (solar panel is useless, and with this formula will be boosted)
data.raw["generator-equipment"]["fusion-reactor-equipment"].power = "3.2MW" -- 50kW * 16 * 4 * 1
data.raw.item["fusion-reactor-equipment"].order = "a2[energy-source]-a5[portable-nuclear-core]"
data.raw.item["fusion-reactor-equipment"].subgroup = "equipment"

-----------------------------------------------------------------------------------------------------------------
-- -- Roboport equipment
-----------------------------------------------------------------------------------------------------------------

data.raw["roboport-equipment"]["personal-roboport-equipment"].robot_limit = 20
data.raw["roboport-equipment"]["personal-roboport-equipment"].construction_radius = 15

-----------------------------------------------------------------------------------------------------------------
-- -- Personal laser
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].categories, "universal-equipment")

data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].energy_source.buffer_capacity = "18MJ"
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].energy_source.input_flow_limit = "2MW"
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].attack_parameters = {
  type = "beam",
  cooldown = 80,
  damage_modifier = 15,
  projectile_center = { 0, 0 },
  range = 30,
  ammo_type = {
    category = "laser",
    energy_consumption = "3MJ",
    action = {
      type = "direct",
      action_delivery = {
        {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
            },
          },
        },
        {
          type = "beam",
          beam = "laser-beam",
          max_length = 35,
          duration = 40,
          source_offset = { 0, -1.31439 },
        },
      },
    },
  },
}

data.raw.item["personal-laser-defense-equipment"].localised_name = {
  "equipment-name.personal-sniper-laser-defense-mk1-equipment",
}
data.raw.item["personal-laser-defense-equipment"].localised_description = {
  "equipment-description.personal-sniper-laser-defense-mk1-equipment",
}
data.raw.item["personal-laser-defense-equipment"].subgroup = "equipment"
data.raw.item["personal-laser-defense-equipment"].order = "d[active-defense]-b1[personal-laser-defense-mk1-equipment]"

data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].localised_name = {
  "equipment-name.personal-sniper-laser-defense-mk1-equipment",
}
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].localised_description = {
  "equipment-description.personal-sniper-laser-defense-mk1-equipment",
}

-----------------------------------------------------------------------------------------------------------------
-- -- Shields
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify = {
  ["energy-shield-equipment"] = {
    ["energy-shield-equipment"] = { "energy-shield-mk1-equipment.png", 64, 64, 64, 1, 4 },
    ["energy-shield-mk2-equipment"] = { "energy-shield-mk2-equipment.png", 64, 64, 64, 2, 4 },
  },
}
-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

-- Equipments categories
table.insert(data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories, "universal-equipment")
table.insert(data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].categories, "universal-equipment")

-- Localized names
data.raw.item["energy-shield-equipment"].localised_name = { "equipment-name.shield-generator-mk1" }
data.raw.item["energy-shield-equipment"].localised_description = { "equipment-description.shield-generator-mk1" }
data.raw["energy-shield-equipment"]["energy-shield-equipment"].localised_name = {
  "equipment-name.shield-generator-mk1",
}
data.raw["energy-shield-equipment"]["energy-shield-equipment"].localised_description = {
  "equipment-description.shield-generator-mk1",
}
data.raw["energy-shield-equipment"]["energy-shield-equipment"].order = "b[shield]-a[energy-shield-equipment-mk1]"
data.raw.item["energy-shield-equipment"].subgroup = "equipment"
data.raw.item["energy-shield-equipment"].order = "b[shield]-a[energy-shield-equipment-mk1]"

data.raw.item["energy-shield-mk2-equipment"].localised_name = { "equipment-name.shield-generator-mk2" }
data.raw.item["energy-shield-mk2-equipment"].localised_description = { "equipment-description.shield-generator-mk2" }
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].localised_name = {
  "equipment-name.shield-generator-mk2",
}
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].localised_description = {
  "equipment-description.shield-generator-mk2",
}
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].order = "b[shield]-b[energy-shield-equipment-mk2]"
data.raw.item["energy-shield-mk2-equipment"].subgroup = "equipment"
data.raw.item["energy-shield-mk2-equipment"].order = "b[shield]-b[energy-shield-equipment-mk2]"

-----------------------------------------------------------------------------------------------------------------
-- -- Solar pannel
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify = {
  ["solar-panel-equipment"] = {
    ["solar-panel-equipment"] = { "solar-panel-equipment.png", 64, 32, 32, 1, 4 },
  },
}

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

-- Equipments categories
table.insert(data.raw["solar-panel-equipment"]["solar-panel-equipment"].categories, "universal-equipment")

data.raw["solar-panel-equipment"]["solar-panel-equipment"].power = "40kW" -- 40kW * 1  * 1 * 1
data.raw.item["solar-panel-equipment"].order = "a[energy-source]-a1[solar-panel]"
data.raw.item["solar-panel-equipment"].subgroup = "equipment"

krastorio.recipes.addIngredient("solar-panel-equipment", { name = "glass", amount = 5 })
krastorio.recipes.removeIngredient("solar-panel", { name = "glass", amount = 5 })

-----------------------------------------------------------------------------------------------------------------
-- -- Belt Immunity
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["belt-immunity-equipment"]["belt-immunity-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- Night visor
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify = {
  ["night-vision-equipment"] = {
    ["night-vision-equipment"] = { "night-vision-equipment.png", 64, 64, 64, 1 },
  },
}

data.raw["night-vision-equipment"]["night-vision-equipment"].color_lookup = {
  { 0.75, "__Krastorio2Assets__/others/nightvision-1.png" },
}

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_character_equipments_icons_path, kr_character_equipments_path)

data.raw["night-vision-equipment"]["night-vision-equipment"].tint = { r = 0.1, g = 0.255, b = 1, a = 0.255 }
data.raw["night-vision-equipment"]["night-vision-equipment"].desaturation_params = {
  smoothstep_min = 0.1,
  smoothstep_max = 0.7,
  minimum = 0.35,
  maximum = 0.9,
}
data.raw["night-vision-equipment"]["night-vision-equipment"].light_params = {
  smoothstep_min = 0.1,
  smoothstep_max = 0.7,
  minimum = 0.35,
  maximum = 0.8,
}
data.raw["night-vision-equipment"]["night-vision-equipment"].darkness_to_turn_on = 0.5
data.raw["night-vision-equipment"]["night-vision-equipment"].shape = {
  width = 1,
  height = 1,
  type = "full",
}

krastorio.recipes.overrideIngredients("night-vision-equipment", {
  { "advanced-circuit", 2 },
  { "iron-plate", 1 },
  { "plastic-bar", 1 },
  { "glass", 1 },
})

data.raw.item["night-vision-equipment"].subgroup = "character-equipment"
data.raw.item["night-vision-equipment"].order = "f[night-vision]-a1[night-vision-equipment]"

-----------------------------------------------------------------------------------------------------------------
-- Exoskeleton equipment
-----------------------------------------------------------------------------------------------------------------

data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].movement_bonus = 0.2
data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].categories = { "armor", "spidertron-only" }

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify = {
  ["movement-bonus-equipment"] = {
    ["exoskeleton-equipment"] = { "exoskeleton-equipment.png", 64, 64, 128, 1 },
  },
}

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_character_equipments_icons_path, kr_character_equipments_path)

data.raw.item["exoskeleton-equipment"].subgroup = "character-equipment"
data.raw.item["exoskeleton-equipment"].order = "e[exoskeleton]-a1[exoskeleton-equipment]"

-----------------------------------------------------------------------------------------------------------------
