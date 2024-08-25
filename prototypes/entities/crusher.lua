local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

data:extend({
  {
    type = "furnace",
    name = "kr-crusher",
    icon_size = 64,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/icons/entities/crusher.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { hardness = 1, mining_time = 1, result = "kr-crusher" },
    max_health = 750,
    corpse = "kr-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 70 },
      { type = "impact", percent = 70 },
    },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    fast_replaceable_group = "kr-crusher",
    scale_entity_info_icon = kr_icons_size,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/crusher/crusher.png",
          priority = "high",
          width = 512,
          height = 512,
          frame_count = 30,
          line_length = 6,
          animation_speed = 0.75,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/entities/crusher/crusher-shadow.png",
          priority = "high",
          width = 512,
          height = 512,
          frame_count = 30,
          line_length = 6,
          draw_as_shadow = true,
          scale = 0.5,
        },
      },
    },
    crafting_categories = { "crushing", "void-crushing" },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/crusher.ogg",
        volume = 1.25,
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
      apparent_volume = 1.5,
    },
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 3,
    return_ingredients_on_change = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 20 },
    },

    water_reflection = {
      pictures = {
        filename = "__Krastorio2Assets__/entities/crusher/crusher-reflection.png",
        priority = "extra-high",
        width = 80,
        height = 60,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    energy_usage = "225kW",
    module_specification = { module_slots = 4, module_info_icon_shift = { 0, 1.7 }, module_info_icon_scale = 1 },
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    --open_sound = sounds.machine_open,
    --close_sound = sounds.machine_close
  },
})
