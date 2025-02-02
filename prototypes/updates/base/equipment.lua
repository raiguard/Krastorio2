local flib_prototypes = require("__flib__.prototypes")

table.insert(data.raw["active-defense-equipment"]["discharge-defense-equipment"].categories, "universal-equipment")

data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].attack_parameters = {
  type = "beam",
  cooldown = 80,
  damage_modifier = 15,
  projectile_center = { 0, 0 },
  range = 30,
  ammo_category = "laser",
  ammo_type = {
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
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].localised_name =
  { "equipment-name.personal-sniper-laser-defense-mk1-equipment" }
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].localised_description =
  { "equipment-description.personal-sniper-laser-defense-mk1-equipment" }

table.insert(data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].categories, "universal-equipment")
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].energy_source.buffer_capacity = "18MJ"
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].energy_source.input_flow_limit = "2MW"

table.insert(data.raw["battery-equipment"]["battery-equipment"].categories, "universal-equipment")
data.raw["battery-equipment"]["battery-equipment"].energy_source = {
  type = "electric",
  buffer_capacity = "10MJ",
  input_flow_limit = "0.25MW",
  output_flow_limit = "0.5MW",
  usage_priority = "tertiary",
}
data.raw.item["battery-equipment"].pictures = {
  layers = {
    {
      filename = "__Krastorio2Assets__/icons/equipment/battery-mk1-equipment.png",
      size = 64,
      scale = 0.5,
      mipmap_count = 4,
    },
    {
      filename = "__Krastorio2Assets__/icons/equipment/battery-equipment-light.png",
      size = 64,
      scale = 0.5,
      mipmap_count = 4,
      flags = { "light" },
      draw_as_light = true,
    },
  },
}

table.insert(data.raw["battery-equipment"]["battery-mk2-equipment"].categories, "universal-equipment")
data.raw["battery-equipment"]["battery-mk2-equipment"].energy_source = {
  type = "electric",
  buffer_capacity = "25MJ",
  input_flow_limit = "0.5MW",
  output_flow_limit = "1MW",
  usage_priority = "tertiary",
}
data.raw.item["battery-mk2-equipment"].pictures = {
  layers = {
    {
      filename = "__Krastorio2Assets__/icons/equipment/battery-mk2-equipment.png",
      size = 64,
      scale = 0.5,
      mipmap_count = 4,
    },
    {
      filename = "__Krastorio2Assets__/icons/equipment/battery-equipment-light.png",
      size = 64,
      scale = 0.5,
      mipmap_count = 4,
      draw_as_light = true,
      flags = { "light" },
    },
  },
}

table.insert(data.raw["belt-immunity-equipment"]["belt-immunity-equipment"].categories, "universal-equipment")

table.insert(data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories, "universal-equipment")
data.raw["energy-shield-equipment"]["energy-shield-equipment"].localised_name =
  { "equipment-name.shield-generator-mk1" }
data.raw["energy-shield-equipment"]["energy-shield-equipment"].localised_description =
  { "equipment-description.shield-generator-mk1" }

table.insert(data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].categories, "universal-equipment")
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].localised_name =
  { "equipment-name.shield-generator-mk2" }
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].localised_description =
  { "equipment-description.shield-generator-mk2" }

data.raw["generator-equipment"]["fission-reactor-equipment"].burner = {
  type = "burner",
  fuel_categories = { "fusion-fuel" },
  effectivity = 2,
  fuel_inventory_size = 1,
  burnt_inventory_size = 1,
}
table.insert(data.raw["generator-equipment"]["fission-reactor-equipment"].categories, "universal-equipment")
data.raw["generator-equipment"]["fission-reactor-equipment"].power = "3.2MW"

data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].movement_bonus = 0.2
data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].categories = { "armor", "spidertron-only" }

data.raw["night-vision-equipment"]["night-vision-equipment"].color_lookup = {
  { 0.75, "__Krastorio2Assets__/luts/nightvision-equipment.png" },
}
data.raw["night-vision-equipment"]["night-vision-equipment"].darkness_to_turn_on = 0.5
data.raw["night-vision-equipment"]["night-vision-equipment"].shape = {
  width = 1,
  height = 1,
  type = "full",
}

data.raw["roboport-equipment"]["personal-roboport-equipment"].construction_radius = 15
data.raw["roboport-equipment"]["personal-roboport-equipment"].robot_limit = 20

table.insert(data.raw["solar-panel-equipment"]["solar-panel-equipment"].categories, "universal-equipment")
data.raw["solar-panel-equipment"]["solar-panel-equipment"].power = "40kW"

--- @param item_name data.ItemID
--- @param icon data.FileName
--- @param icon_size data.SpriteSizeType
--- @param sprite_size {[1]: data.SpriteSizeType, [2]: data.SpriteSizeType}
--- @param tier integer?
local function update_equipment_graphics(item_name, icon, icon_size, sprite_size, tier)
  local item = flib_prototypes.get("item", item_name)
  if tier then
    item.icon = nil
    item.icon_size = nil
    item.icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/" .. icon .. ".png", icon_size = icon_size },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-" .. tier .. ".png", icon_size = 64 },
    }
  else
    item.icon = "__Krastorio2Assets__/icons/equipment/" .. icon .. ".png"
    item.icon_size = icon_size
  end
  local equipment_id = item.place_as_equipment_result
  if not equipment_id then
    error("Item " .. item_name .. " has no related equipment.")
  end
  local equipment = flib_prototypes.get("equipment", equipment_id)
  equipment.sprite = {
    filename = "__Krastorio2Assets__/equipment/" .. icon .. ".png",
    size = sprite_size,
    scale = 0.5,
    priority = "medium",
  }
end
update_equipment_graphics("battery-equipment", "battery-mk1-equipment", 64, { 64, 128 }, 1)
update_equipment_graphics("battery-mk2-equipment", "battery-mk2-equipment", 64, { 64, 128 }, 2)
update_equipment_graphics("energy-shield-equipment", "energy-shield-mk1-equipment", 64, { 128, 128 }, 1)
update_equipment_graphics("energy-shield-mk2-equipment", "energy-shield-mk2-equipment", 64, { 128, 128 }, 2)
update_equipment_graphics("exoskeleton-equipment", "exoskeleton-equipment", 64, { 128, 256 }, 1)
update_equipment_graphics("fission-reactor-equipment", "fission-reactor-equipment", 64, { 128, 128 }, 2)
update_equipment_graphics("night-vision-equipment", "night-vision-equipment", 64, { 128, 128 }, 1)
update_equipment_graphics("personal-laser-defense-equipment", "personal-laser-defense-mk1-equipment", 64, { 128, 128 }, 1)
update_equipment_graphics("personal-roboport-equipment", "personal-roboport-equipment", 64, { 128, 128 }, 1)
update_equipment_graphics("personal-roboport-mk2-equipment", "personal-roboport-mk2-equipment", 64, { 128, 128 }, 2)
update_equipment_graphics("solar-panel-equipment", "solar-panel-equipment", 64, { 64, 64 }, 1)
