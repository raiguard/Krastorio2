-- -- -- CHARACTER EQUIPMENTS

-- -- NEW ARMORS GRID

data:extend({
  -- Used in MK3 armor
  {
    type = "equipment-grid",
    name = "mk3-armor-grid",
    width = 10,
    height = 10,
    equipment_categories = { "armor", "universal-equipment", "robot-interaction-equipment" },
  },
  {
    type = "equipment-grid",
    name = "mk4-armor-grid",
    width = 12,
    height = 12,
    equipment_categories = { "armor", "universal-equipment", "robot-interaction-equipment" },
  },
})

-- -- NEW POWER ARMORS (Tier MK3 and MK4)

-- copying the animations of power armor mk2 to the higher tiers
for _, animation in ipairs(data.raw["character"]["character"]["animations"]) do
  if animation.armors then
    for _, armor in ipairs(animation.armors) do
      if armor == "power-armor-mk2" then
        animation.armors[#animation.armors + 1] = "power-armor-mk3"
        animation.armors[#animation.armors + 1] = "power-armor-mk4"
        break
      end
    end
  end
end

data:extend({
  -----------------------------------------------------------------------------------------------------------------
  -------------------------------------------------------ARMORS----------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -- -- Armors
  -- MK3 (item/equipment)
  {
    type = "armor",
    name = "power-armor-mk3",
    icon = kr_character_equipments_icons_path .. "power-armor-mk3.png",
    icon_size = 64,
    resistances = {
      {
        type = "physical",
        decrease = 20,
        percent = 50,
      },
      {
        type = "acid",
        decrease = 30,
        percent = 70,
      },
      {
        type = "explosion",
        decrease = 40,
        percent = 70,
      },
      {
        type = "fire",
        decrease = 20,
        percent = 80,
      },
      {
        type = "radioactive",
        decrease = 5,
        percent = 60,
      },
    },
    subgroup = "armor",
    order = "f[power-armor-mk3]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "mk3-armor-grid",
    inventory_size_bonus = 40,
  },
  -----------------------------------------------------------------------------------------------------------------
  -- MK4 (item/equipment)
  {
    type = "armor",
    name = "power-armor-mk4",
    icon = kr_character_equipments_icons_path .. "power-armor-mk4.png",
    icon_size = 64,
    resistances = {
      {
        type = "physical",
        decrease = 30,
        percent = 60,
      },
      {
        type = "acid",
        decrease = 30,
        percent = 80,
      },
      {
        type = "explosion",
        decrease = 50,
        percent = 80,
      },
      {
        type = "fire",
        decrease = 30,
        percent = 90,
      },
      {
        type = "radioactive",
        decrease = 6,
        percent = 80,
      },
    },
    subgroup = "armor",
    order = "g[power-armor-mk4]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "mk4-armor-grid",
    inventory_size_bonus = 50,
  },
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -- -- Exoskeletons
  {
    type = "movement-bonus-equipment",
    name = "advanced-exoskeleton-equipment",
    categories = { "armor", "spidertron-only" },
    energy_consumption = "300kW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    movement_bonus = 0.4,
    shape = {
      width = 2,
      height = 4,
      type = "full",
    },
    sprite = {
      filename = kr_character_equipments_path .. "advanced-exoskeleton-equipment.png",
      width = 64,
      height = 128,
      priority = "medium",
      hr_version = {
        filename = kr_character_equipments_path .. "hr-advanced-exoskeleton-equipment.png",
        width = 128,
        height = 256,
        priority = "medium",
        scale = 0.5,
      },
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "movement-bonus-equipment",
    name = "superior-exoskeleton-equipment",
    categories = { "armor", "spidertron-only" },
    energy_consumption = "400kW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    movement_bonus = 0.6,
    shape = {
      width = 2,
      height = 4,
      type = "full",
    },
    sprite = {
      filename = kr_character_equipments_path .. "superior-exoskeleton-equipment.png",
      width = 64,
      height = 128,
      priority = "medium",
      hr_version = {
        filename = kr_character_equipments_path .. "hr-superior-exoskeleton-equipment.png",
        width = 128,
        height = 256,
        priority = "medium",
        scale = 0.5,
      },
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -- -- Night visor
  {
    type = "night-vision-equipment",
    name = "imersite-night-vision-equipment",
    sprite = {
      filename = kr_character_equipments_path .. "imersite-night-vision-equipment.png",
      width = 64,
      height = 64,
      priority = "medium",
      hr_version = {
        filename = kr_character_equipments_path .. "hr-imersite-night-vision-equipment.png",
        width = 128,
        height = 128,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 1,
      height = 1,
      type = "full",
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "180kJ",
      input_flow_limit = "360kW",
      usage_priority = "primary-input",
    },
    energy_input = "15kW",
    tint = { r = 0.2, g = 0, b = 0.1, a = 0 },
    desaturation_params = {
      smoothstep_min = 0.1,
      smoothstep_max = 0.8,
      minimum = 0.7,
      maximum = 1,
    },
    light_params = {
      smoothstep_min = 0.1,
      smoothstep_max = 0.8,
      minimum = 0.7,
      maximum = 1,
    },
    categories = { "armor" },
    darkness_to_turn_on = 0.45,
    color_lookup = { { 0.75, "__Krastorio2Assets__/others/nightvision-2.png" } },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
