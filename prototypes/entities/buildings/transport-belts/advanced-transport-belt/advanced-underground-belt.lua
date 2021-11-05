data:extend({
  {
    type = "underground-belt",
    name = "kr-advanced-underground-belt",
    icon = kr_entities_icons_path .. "transport-belts/advanced-transport-belt/advanced-underground-belt.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.2, result = "kr-advanced-underground-belt" },
    max_health = 200,
    corpse = "kr-advanced-underground-belt-remnant",
    max_distance = 30,
    underground_sprite = {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5,
    },
    underground_remove_belts_sprite = {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5,
    },
    resistances = {
      {
        type = "fire",
        percent = 50,
      },
      {
        type = "impact",
        percent = 30,
      },
    },
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    belt_animation_set = kr_advanced_transport_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "kr-superior-underground-belt",
    speed = 0.125,
    animation_speed_coefficient = 28,
    structure = {
      direction_in = {
        sheet = {
          filename = kr_entities_path
            .. "transport-belts/advanced-transport-belt/underground-belt/advanced-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96,
          hr_version = {
            filename = kr_entities_path
              .. "transport-belts/advanced-transport-belt/underground-belt/hr-advanced-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5,
          },
        },
      },
      direction_out = {
        sheet = {
          filename = kr_entities_path
            .. "transport-belts/advanced-transport-belt/underground-belt/advanced-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version = {
            filename = kr_entities_path
              .. "transport-belts/advanced-transport-belt/underground-belt/hr-advanced-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5,
          },
        },
      },
      direction_in_side_loading = {
        sheet = {
          filename = kr_entities_path
            .. "transport-belts/advanced-transport-belt/underground-belt/advanced-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96 * 3,
          hr_version = {
            filename = kr_entities_path
              .. "transport-belts/advanced-transport-belt/underground-belt/hr-advanced-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192 * 3,
            scale = 0.5,
          },
        },
      },
      direction_out_side_loading = {
        sheet = {
          filename = kr_entities_path
            .. "transport-belts/advanced-transport-belt/underground-belt/advanced-underground-belt-structure.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          y = 96 * 2,
          hr_version = {
            filename = kr_entities_path
              .. "transport-belts/advanced-transport-belt/underground-belt/hr-advanced-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192 * 2,
            scale = 0.5,
          },
        },
      },
      back_patch = {
        sheet = {
          filename = kr_entities_path
            .. "transport-belts/advanced-transport-belt/underground-belt/advanced-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version = {
            filename = kr_entities_path
              .. "transport-belts/advanced-transport-belt/underground-belt/hr-advanced-underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5,
          },
        },
      },
      front_patch = {
        sheet = {
          filename = kr_entities_path
            .. "transport-belts/advanced-transport-belt/underground-belt/advanced-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 96,
          height = 96,
          hr_version = {
            filename = kr_entities_path
              .. "transport-belts/advanced-transport-belt/underground-belt/hr-advanced-underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5,
          },
        },
      },
    },
  },
})
