local hit_effects = require("__base__/prototypes/entity/hit-effects")

data:extend({
  {
    type = "simple-entity-with-owner",
    name = "kr-mineable-wreckage",
    localised_description = { "entity-description.mineable-wreckage" },
    icon = kr_crash_site_icons_path .. "small-ship-wreck.png",
    icon_size = 64,
    icon_mipmaps = 4,
    minable = {
      mining_time = 2,
      results = {
        { type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.70 },
        { type = "item", name = "copper-cable", amount_min = 0, amount_max = 2, probability = 0.40 },
        { type = "item", name = "iron-gear-wheel", amount_min = 0, amount_max = 2, probability = 0.40 },
        { type = "item", name = "electronic-circuit", amount_min = 0, amount_max = 2, probability = 0.20 },
        { type = "item", name = "kr-sentinel", amount_min = 0, amount_max = 2, probability = 0.10 },
      },
      mining_particle = "shell-particle",
    },
    flags = { "placeable-player", "player-creation", "hidden", "not-rotatable" },
    subgroup = "wrecks",
    order = "d[remnants]-d[ship-wreck]-c[small]-a",
    max_health = 200,
    resistances = {
      { type = "fire", percent = 100 },
      { type = "impact", percent = 60 },
      { type = "physical", percent = 50 },
    },
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -1.3, -1.1 }, { 1.3, 1.1 } },
    damaged_trigger_effect = hit_effects.entity(),
    pictures = {
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-a.png",
        width = 65,
        height = 68,
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-b.png",
        width = 109,
        height = 67,
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-c.png",
        width = 63,
        height = 54,
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-d.png",
        width = 82,
        height = 67,
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-e.png",
        width = 78,
        height = 75,
        shift = { 0.3, -0.2 },
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-f.png",
        width = 58,
        height = 35,
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-g.png",
        width = 80,
        height = 72,
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-h.png",
        width = 79,
        height = 54,
      },
      {
        filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-i.png",
        width = 56,
        height = 55,
      },
    },
    render_layer = "object",
  },
})
