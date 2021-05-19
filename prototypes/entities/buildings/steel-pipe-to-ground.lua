data:extend({
  {
    type = "pipe-to-ground",
    name = "kr-steel-pipe-to-ground",
    icon = kr_entities_icons_path .. "steel-pipe-to-ground.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-steel-pipe-to-ground" },
    max_health = 150,
    corpse = "pipe-remnants",
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
      {
        type = "impact",
        percent = 60,
      },
    },
    fast_replaceable_group = "pipe",
    collision_box = { { -0.29, -0.29 }, { 0.29, 0.2 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    fluid_box = {
      base_area = 1,
      height = 1.25,
      pipe_covers = steel_pipecoverspictures,
      pipe_connections = {
        { position = { 0, -1 } },
        {
          position = { 0, 1 },
          max_underground_distance = 30,
        },
      },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures = {
      up = {
        filename = kr_entities_path .. "steel-pipe-to-ground/steel-pipe-to-ground-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version = {
          filename = kr_entities_path .. "steel-pipe-to-ground/hr-steel-pipe-to-ground-up.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      down = {
        filename = kr_entities_path .. "steel-pipe-to-ground/steel-pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version = {
          filename = kr_entities_path .. "steel-pipe-to-ground/hr-steel-pipe-to-ground-down.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      left = {
        filename = kr_entities_path .. "steel-pipe-to-ground/steel-pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version = {
          filename = kr_entities_path .. "steel-pipe-to-ground/hr-steel-pipe-to-ground-left.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
      right = {
        filename = kr_entities_path .. "steel-pipe-to-ground/steel-pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version = {
          filename = kr_entities_path .. "steel-pipe-to-ground/hr-steel-pipe-to-ground-right.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5,
        },
      },
    },
  },
})
