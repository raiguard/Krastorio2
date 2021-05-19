krastorio_utils.recipes_backup = {
  accumulator = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "iron-plate",
        2,
      },
      {
        "battery",
        5,
      },
    },
    name = "accumulator",
    result = "accumulator",
    type = "recipe",
  },
  ["advanced-circuit"] = {
    expensive = {
      enabled = false,
      energy_required = 6,
      ingredients = {
        {
          "electronic-circuit",
          2,
        },
        {
          "plastic-bar",
          4,
        },
        {
          "copper-cable",
          8,
        },
      },
      result = "advanced-circuit",
    },
    name = "advanced-circuit",
    normal = {
      enabled = false,
      energy_required = 6,
      ingredients = {
        {
          "electronic-circuit",
          2,
        },
        {
          "plastic-bar",
          2,
        },
        {
          "copper-cable",
          4,
        },
      },
      result = "advanced-circuit",
    },
    type = "recipe",
  },
  ["advanced-oil-processing"] = {
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 50,
        name = "water",
        type = "fluid",
      },
      {
        amount = 100,
        name = "crude-oil",
        type = "fluid",
      },
    },
    name = "advanced-oil-processing",
    order = "a[oil-processing]-b[advanced-oil-processing]",
    results = {
      {
        amount = 10,
        name = "heavy-oil",
        type = "fluid",
      },
      {
        amount = 45,
        name = "light-oil",
        type = "fluid",
      },
      {
        amount = 55,
        name = "petroleum-gas",
        type = "fluid",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  ["arithmetic-combinator"] = {
    enabled = false,
    ingredients = {
      {
        "copper-cable",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "arithmetic-combinator",
    result = "arithmetic-combinator",
    type = "recipe",
  },
  ["artillery-shell"] = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "explosive-cannon-shell",
        4,
      },
      {
        "radar",
        1,
      },
      {
        "explosives",
        8,
      },
    },
    name = "artillery-shell",
    result = "artillery-shell",
    type = "recipe",
  },
  ["artillery-targeting-remote"] = {
    enabled = false,
    ingredients = {
      {
        "processing-unit",
        1,
      },
      {
        "radar",
        1,
      },
    },
    name = "artillery-targeting-remote",
    result = "artillery-targeting-remote",
    type = "recipe",
  },
  ["artillery-turret"] = {
    enabled = false,
    energy_required = 40,
    ingredients = {
      {
        "steel-plate",
        60,
      },
      {
        "concrete",
        60,
      },
      {
        "iron-gear-wheel",
        40,
      },
      {
        "advanced-circuit",
        20,
      },
    },
    name = "artillery-turret",
    result = "artillery-turret",
    type = "recipe",
  },
  ["artillery-wagon"] = {
    enabled = false,
    energy_required = 4,
    ingredients = {
      {
        "engine-unit",
        64,
      },
      {
        "iron-gear-wheel",
        10,
      },
      {
        "steel-plate",
        40,
      },
      {
        "pipe",
        16,
      },
      {
        "advanced-circuit",
        20,
      },
    },
    name = "artillery-wagon",
    result = "artillery-wagon",
    type = "recipe",
  },
  ["assembling-machine-1"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        3,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "iron-plate",
        9,
      },
    },
    name = "assembling-machine-1",
    result = "assembling-machine-1",
    type = "recipe",
  },
  ["assembling-machine-2"] = {
    expensive = {
      enabled = false,
      ingredients = {
        {
          "steel-plate",
          5,
        },
        {
          "electronic-circuit",
          5,
        },
        {
          "iron-gear-wheel",
          10,
        },
        {
          "assembling-machine-1",
          1,
        },
      },
      result = "assembling-machine-2",
    },
    name = "assembling-machine-2",
    normal = {
      enabled = false,
      ingredients = {
        {
          "steel-plate",
          2,
        },
        {
          "electronic-circuit",
          3,
        },
        {
          "iron-gear-wheel",
          5,
        },
        {
          "assembling-machine-1",
          1,
        },
      },
      result = "assembling-machine-2",
    },
    type = "recipe",
  },
  ["assembling-machine-3"] = {
    enabled = false,
    ingredients = {
      {
        "speed-module",
        4,
      },
      {
        "assembling-machine-2",
        2,
      },
    },
    name = "assembling-machine-3",
    result = "assembling-machine-3",
    type = "recipe",
  },
  ["atomic-bomb"] = {
    enabled = false,
    energy_required = 50,
    ingredients = {
      {
        "rocket-control-unit",
        10,
      },
      {
        "explosives",
        10,
      },
      {
        "uranium-235",
        30,
      },
    },
    name = "atomic-bomb",
    result = "atomic-bomb",
    type = "recipe",
  },
  ["automation-science-pack"] = {
    energy_required = 5,
    ingredients = {
      {
        "copper-plate",
        1,
      },
      {
        "iron-gear-wheel",
        1,
      },
    },
    name = "automation-science-pack",
    result = "automation-science-pack",
    type = "recipe",
  },
  ["basic-oil-processing"] = {
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 100,
        name = "crude-oil",
        type = "fluid",
      },
    },
    name = "basic-oil-processing",
    order = "a[oil-processing]-a[basic-oil-processing]",
    results = {
      {
        amount = 30,
        name = "heavy-oil",
        type = "fluid",
      },
      {
        amount = 30,
        name = "light-oil",
        type = "fluid",
      },
      {
        amount = 40,
        name = "petroleum-gas",
        type = "fluid",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  battery = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.61099999999999994,
        r = 0.96999999999999993,
      },
      secondary = {
        a = 0.35699999999999998,
        b = 0.89399999999999995,
        g = 0.68000000000000007,
        r = 0,
      },
      tertiary = {
        a = 0,
        b = 0.72599999999999998,
        g = 0.80500000000000007,
        r = 0.42999999999999998,
      },
    },
    expensive = {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {
          amount = 40,
          name = "sulfuric-acid",
          type = "fluid",
        },
        {
          "iron-plate",
          1,
        },
        {
          "copper-plate",
          1,
        },
      },
      result = "battery",
    },
    name = "battery",
    normal = {
      enabled = false,
      energy_required = 4,
      ingredients = {
        {
          amount = 20,
          name = "sulfuric-acid",
          type = "fluid",
        },
        {
          "iron-plate",
          1,
        },
        {
          "copper-plate",
          1,
        },
      },
      result = "battery",
    },
    type = "recipe",
  },
  ["battery-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "battery",
        5,
      },
      {
        "steel-plate",
        10,
      },
    },
    name = "battery-equipment",
    result = "battery-equipment",
    type = "recipe",
  },
  ["battery-mk2-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "battery-equipment",
        10,
      },
      {
        "processing-unit",
        15,
      },
      {
        "low-density-structure",
        5,
      },
    },
    name = "battery-mk2-equipment",
    result = "battery-mk2-equipment",
    type = "recipe",
  },
  beacon = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "electronic-circuit",
        20,
      },
      {
        "advanced-circuit",
        20,
      },
      {
        "steel-plate",
        10,
      },
      {
        "copper-cable",
        10,
      },
    },
    name = "beacon",
    result = "beacon",
    type = "recipe",
  },
  ["belt-immunity-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "advanced-circuit",
        5,
      },
      {
        "steel-plate",
        10,
      },
    },
    name = "belt-immunity-equipment",
    result = "belt-immunity-equipment",
    type = "recipe",
  },
  ["big-electric-pole"] = {
    enabled = false,
    ingredients = {
      {
        "iron-stick",
        8,
      },
      {
        "steel-plate",
        5,
      },
      {
        "copper-plate",
        5,
      },
    },
    name = "big-electric-pole",
    result = "big-electric-pole",
    type = "recipe",
  },
  boiler = {
    ingredients = {
      {
        "stone-furnace",
        1,
      },
      {
        "pipe",
        4,
      },
    },
    name = "boiler",
    result = "boiler",
    type = "recipe",
  },
  ["burner-inserter"] = {
    ingredients = {
      {
        "iron-plate",
        1,
      },
      {
        "iron-gear-wheel",
        1,
      },
    },
    name = "burner-inserter",
    result = "burner-inserter",
    type = "recipe",
  },
  ["burner-mining-drill"] = {
    expensive = {
      energy_required = 4,
      ingredients = {
        {
          "iron-gear-wheel",
          6,
        },
        {
          "stone-furnace",
          2,
        },
        {
          "iron-plate",
          6,
        },
      },
      result = "burner-mining-drill",
    },
    name = "burner-mining-drill",
    normal = {
      energy_required = 2,
      ingredients = {
        {
          "iron-gear-wheel",
          3,
        },
        {
          "stone-furnace",
          1,
        },
        {
          "iron-plate",
          3,
        },
      },
      result = "burner-mining-drill",
    },
    type = "recipe",
  },
  ["cannon-shell"] = {
    expensive = {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {
          "steel-plate",
          4,
        },
        {
          "plastic-bar",
          4,
        },
        {
          "explosives",
          1,
        },
      },
      result = "cannon-shell",
    },
    name = "cannon-shell",
    normal = {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {
          "steel-plate",
          2,
        },
        {
          "plastic-bar",
          2,
        },
        {
          "explosives",
          1,
        },
      },
      result = "cannon-shell",
    },
    type = "recipe",
  },
  car = {
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "engine-unit",
        8,
      },
      {
        "iron-plate",
        20,
      },
      {
        "steel-plate",
        5,
      },
    },
    name = "car",
    result = "car",
    type = "recipe",
  },
  ["cargo-wagon"] = {
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        "iron-gear-wheel",
        10,
      },
      {
        "iron-plate",
        20,
      },
      {
        "steel-plate",
        20,
      },
    },
    name = "cargo-wagon",
    result = "cargo-wagon",
    type = "recipe",
  },
  centrifuge = {
    enabled = false,
    energy_required = 4,
    ingredients = {
      {
        "concrete",
        100,
      },
      {
        "steel-plate",
        50,
      },
      {
        "advanced-circuit",
        100,
      },
      {
        "iron-gear-wheel",
        100,
      },
    },
    name = "centrifuge",
    requester_paste_multiplier = 10,
    result = "centrifuge",
    type = "recipe",
  },
  ["chemical-plant"] = {
    enabled = false,
    energy_required = 5,
    ingredients = {
      {
        "steel-plate",
        5,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
      {
        "pipe",
        5,
      },
    },
    name = "chemical-plant",
    result = "chemical-plant",
    type = "recipe",
  },
  ["chemical-science-pack"] = {
    enabled = false,
    energy_required = 24,
    ingredients = {
      {
        "engine-unit",
        2,
      },
      {
        "advanced-circuit",
        3,
      },
      {
        "solid-fuel",
        1,
      },
    },
    name = "chemical-science-pack",
    result = "chemical-science-pack",
    result_count = 2,
    type = "recipe",
  },
  ["cliff-explosives"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "explosives",
        10,
      },
      {
        "grenade",
        1,
      },
      {
        "empty-barrel",
        1,
      },
    },
    name = "cliff-explosives",
    result = "cliff-explosives",
    type = "recipe",
  },
  ["cluster-grenade"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "grenade",
        7,
      },
      {
        "explosives",
        5,
      },
      {
        "steel-plate",
        5,
      },
    },
    name = "cluster-grenade",
    result = "cluster-grenade",
    type = "recipe",
  },
  ["coal-liquefaction"] = {
    allow_decomposition = false,
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    icon = "__base__/graphics/icons/fluid/coal-liquefaction.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 10,
        name = "coal",
        type = "item",
      },
      {
        amount = 25,
        name = "heavy-oil",
        type = "fluid",
      },
      {
        amount = 50,
        name = "steam",
        type = "fluid",
      },
    },
    name = "coal-liquefaction",
    order = "a[oil-processing]-c[coal-liquefaction]",
    results = {
      {
        amount = 90,
        name = "heavy-oil",
        type = "fluid",
      },
      {
        amount = 20,
        name = "light-oil",
        type = "fluid",
      },
      {
        amount = 10,
        name = "petroleum-gas",
        type = "fluid",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  ["combat-shotgun"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "steel-plate",
        15,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "copper-plate",
        10,
      },
      {
        "wood",
        10,
      },
    },
    name = "combat-shotgun",
    result = "combat-shotgun",
    type = "recipe",
  },
  concrete = {
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "stone-brick",
        5,
      },
      {
        "iron-ore",
        1,
      },
      {
        amount = 100,
        name = "water",
        type = "fluid",
      },
    },
    name = "concrete",
    result = "concrete",
    result_count = 10,
    type = "recipe",
  },
  ["constant-combinator"] = {
    enabled = false,
    ingredients = {
      {
        "copper-cable",
        5,
      },
      {
        "electronic-circuit",
        2,
      },
    },
    name = "constant-combinator",
    result = "constant-combinator",
    type = "recipe",
  },
  ["construction-robot"] = {
    enabled = false,
    ingredients = {
      {
        "flying-robot-frame",
        1,
      },
      {
        "electronic-circuit",
        2,
      },
    },
    name = "construction-robot",
    result = "construction-robot",
    type = "recipe",
  },
  ["copper-cable"] = {
    ingredients = {
      {
        "copper-plate",
        1,
      },
    },
    name = "copper-cable",
    result = "copper-cable",
    result_count = 2,
    type = "recipe",
  },
  ["copper-plate"] = {
    category = "smelting",
    energy_required = 3.2000000000000002,
    ingredients = {
      {
        "copper-ore",
        1,
      },
    },
    name = "copper-plate",
    result = "copper-plate",
    type = "recipe",
  },
  ["decider-combinator"] = {
    enabled = false,
    ingredients = {
      {
        "copper-cable",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "decider-combinator",
    result = "decider-combinator",
    type = "recipe",
  },
  ["defender-capsule"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "piercing-rounds-magazine",
        1,
      },
      {
        "flying-robot-frame",
        1,
      },
      {
        "iron-gear-wheel",
        3,
      },
    },
    name = "defender-capsule",
    result = "defender-capsule",
    type = "recipe",
  },
  ["destroyer-capsule"] = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "distractor-capsule",
        4,
      },
      {
        "speed-module",
        1,
      },
    },
    name = "destroyer-capsule",
    result = "destroyer-capsule",
    type = "recipe",
  },
  ["discharge-defense-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "processing-unit",
        5,
      },
      {
        "steel-plate",
        20,
      },
      {
        "laser-turret",
        10,
      },
    },
    name = "discharge-defense-equipment",
    result = "discharge-defense-equipment",
    type = "recipe",
  },
  ["discharge-defense-remote"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
    },
    name = "discharge-defense-remote",
    result = "discharge-defense-remote",
    type = "recipe",
  },
  ["distractor-capsule"] = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "defender-capsule",
        4,
      },
      {
        "advanced-circuit",
        3,
      },
    },
    name = "distractor-capsule",
    result = "distractor-capsule",
    type = "recipe",
  },
  ["effectivity-module"] = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "advanced-circuit",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "effectivity-module",
    result = "effectivity-module",
    type = "recipe",
  },
  ["effectivity-module-2"] = {
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        "effectivity-module",
        4,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "processing-unit",
        5,
      },
    },
    name = "effectivity-module-2",
    result = "effectivity-module-2",
    type = "recipe",
  },
  ["effectivity-module-3"] = {
    enabled = false,
    energy_required = 60,
    ingredients = {
      {
        "effectivity-module-2",
        5,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "processing-unit",
        5,
      },
    },
    name = "effectivity-module-3",
    result = "effectivity-module-3",
    type = "recipe",
  },
  ["electric-energy-interface"] = {
    enabled = false,
    energy_required = 0.5,
    ingredients = {
      {
        "iron-plate",
        2,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "electric-energy-interface",
    result = "electric-energy-interface",
    type = "recipe",
  },
  ["electric-engine-unit"] = {
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "engine-unit",
        1,
      },
      {
        amount = 15,
        name = "lubricant",
        type = "fluid",
      },
      {
        "electronic-circuit",
        2,
      },
    },
    name = "electric-engine-unit",
    result = "electric-engine-unit",
    type = "recipe",
  },
  ["electric-furnace"] = {
    enabled = false,
    energy_required = 5,
    ingredients = {
      {
        "steel-plate",
        10,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "stone-brick",
        10,
      },
    },
    name = "electric-furnace",
    result = "electric-furnace",
    type = "recipe",
  },
  ["electric-mining-drill"] = {
    expensive = {
      energy_required = 2,
      ingredients = {
        {
          "electronic-circuit",
          5,
        },
        {
          "iron-gear-wheel",
          10,
        },
        {
          "iron-plate",
          20,
        },
      },
      result = "electric-mining-drill",
    },
    name = "electric-mining-drill",
    normal = {
      energy_required = 2,
      ingredients = {
        {
          "electronic-circuit",
          3,
        },
        {
          "iron-gear-wheel",
          5,
        },
        {
          "iron-plate",
          10,
        },
      },
      result = "electric-mining-drill",
    },
    type = "recipe",
  },
  ["electronic-circuit"] = {
    expensive = {
      ingredients = {
        {
          "iron-plate",
          2,
        },
        {
          "copper-cable",
          10,
        },
      },
      result = "electronic-circuit",
    },
    name = "electronic-circuit",
    normal = {
      ingredients = {
        {
          "iron-plate",
          1,
        },
        {
          "copper-cable",
          3,
        },
      },
      result = "electronic-circuit",
    },
    type = "recipe",
  },
  ["empty-barrel"] = {
    category = "crafting",
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        amount = 1,
        name = "steel-plate",
        type = "item",
      },
    },
    name = "empty-barrel",
    results = {
      {
        amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "intermediate-product",
    type = "recipe",
  },
  ["empty-crude-oil-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        tint = {
          a = 0.75,
          b = 0,
          g = 0,
          r = 0,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.5,
          g = 0.5,
          r = 0.5,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/crude-oil.png",
        scale = 0.5,
        shift = {
          7,
          8,
        },
      },
    },
    ingredients = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "crude-oil-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.empty-filled-barrel",
      {
        "fluid-name.crude-oil",
      },
    },
    name = "empty-crude-oil-barrel",
    order = "c[empty-crude-oil-barrel]",
    results = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "crude-oil",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "empty-barrel",
    type = "recipe",
  },
  ["empty-heavy-oil-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        tint = {
          a = 0.75,
          b = 0,
          g = 0.04,
          r = 0.5,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.3,
          g = 0.6,
          r = 0.85,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/heavy-oil.png",
        scale = 0.5,
        shift = {
          7,
          8,
        },
      },
    },
    ingredients = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "heavy-oil-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.empty-filled-barrel",
      {
        "fluid-name.heavy-oil",
      },
    },
    name = "empty-heavy-oil-barrel",
    order = "c[empty-heavy-oil-barrel]",
    results = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "heavy-oil",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "empty-barrel",
    type = "recipe",
  },
  ["empty-light-oil-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        tint = {
          a = 0.75,
          b = 0,
          g = 0.33000000000000003,
          r = 0.56999999999999993,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.070000000000000009,
          g = 0.72999999999999998,
          r = 1,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/light-oil.png",
        scale = 0.5,
        shift = {
          7,
          8,
        },
      },
    },
    ingredients = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "light-oil-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.empty-filled-barrel",
      {
        "fluid-name.light-oil",
      },
    },
    name = "empty-light-oil-barrel",
    order = "c[empty-light-oil-barrel]",
    results = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "light-oil",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "empty-barrel",
    type = "recipe",
  },
  ["empty-lubricant-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.03,
          g = 0.32000000000000002,
          r = 0.15,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.31000000000000001,
          g = 0.75,
          r = 0.42999999999999998,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/lubricant.png",
        scale = 0.5,
        shift = {
          7,
          8,
        },
      },
    },
    ingredients = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "lubricant-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.empty-filled-barrel",
      {
        "fluid-name.lubricant",
      },
    },
    name = "empty-lubricant-barrel",
    order = "c[empty-lubricant-barrel]",
    results = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "lubricant",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "empty-barrel",
    type = "recipe",
  },
  ["empty-petroleum-gas-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.3,
          g = 0.1,
          r = 0.3,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.8,
          g = 0.8,
          r = 0.8,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
        scale = 0.5,
        shift = {
          7,
          8,
        },
      },
    },
    ingredients = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "petroleum-gas-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.empty-filled-barrel",
      {
        "fluid-name.petroleum-gas",
      },
    },
    name = "empty-petroleum-gas-barrel",
    order = "c[empty-petroleum-gas-barrel]",
    results = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "petroleum-gas",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "empty-barrel",
    type = "recipe",
  },
  ["empty-sulfuric-acid-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.1,
          g = 0.65,
          r = 0.75,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.1,
          g = 1,
          r = 0.7,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
        scale = 0.5,
        shift = {
          7,
          8,
        },
      },
    },
    ingredients = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "sulfuric-acid-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.empty-filled-barrel",
      {
        "fluid-name.sulfuric-acid",
      },
    },
    name = "empty-sulfuric-acid-barrel",
    order = "c[empty-sulfuric-acid-barrel]",
    results = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "sulfuric-acid",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "empty-barrel",
    type = "recipe",
  },
  ["empty-water-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.6,
          g = 0.34000000000000004,
          r = 0,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.7,
          g = 0.7,
          r = 0.7,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.5,
        shift = {
          7,
          8,
        },
      },
    },
    ingredients = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "water-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.empty-filled-barrel",
      {
        "fluid-name.water",
      },
    },
    name = "empty-water-barrel",
    order = "c[empty-water-barrel]",
    results = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "water",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    subgroup = "empty-barrel",
    type = "recipe",
  },
  ["energy-shield-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "advanced-circuit",
        5,
      },
      {
        "steel-plate",
        10,
      },
    },
    name = "energy-shield-equipment",
    result = "energy-shield-equipment",
    type = "recipe",
  },
  ["energy-shield-mk2-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "energy-shield-equipment",
        10,
      },
      {
        "processing-unit",
        5,
      },
      {
        "low-density-structure",
        5,
      },
    },
    name = "energy-shield-mk2-equipment",
    result = "energy-shield-mk2-equipment",
    type = "recipe",
  },
  ["engine-unit"] = {
    category = "advanced-crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "steel-plate",
        1,
      },
      {
        "iron-gear-wheel",
        1,
      },
      {
        "pipe",
        2,
      },
    },
    name = "engine-unit",
    result = "engine-unit",
    type = "recipe",
  },
  ["exoskeleton-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "processing-unit",
        10,
      },
      {
        "electric-engine-unit",
        30,
      },
      {
        "steel-plate",
        20,
      },
    },
    name = "exoskeleton-equipment",
    result = "exoskeleton-equipment",
    type = "recipe",
  },
  ["explosive-cannon-shell"] = {
    expensive = {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {
          "steel-plate",
          4,
        },
        {
          "plastic-bar",
          4,
        },
        {
          "explosives",
          2,
        },
      },
      result = "explosive-cannon-shell",
    },
    name = "explosive-cannon-shell",
    normal = {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {
          "steel-plate",
          2,
        },
        {
          "plastic-bar",
          2,
        },
        {
          "explosives",
          2,
        },
      },
      result = "explosive-cannon-shell",
    },
    type = "recipe",
  },
  ["explosive-rocket"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "rocket",
        1,
      },
      {
        "explosives",
        2,
      },
    },
    name = "explosive-rocket",
    result = "explosive-rocket",
    type = "recipe",
  },
  ["explosive-uranium-cannon-shell"] = {
    enabled = false,
    energy_required = 12,
    ingredients = {
      {
        "explosive-cannon-shell",
        1,
      },
      {
        "uranium-238",
        1,
      },
    },
    name = "explosive-uranium-cannon-shell",
    result = "explosive-uranium-cannon-shell",
    type = "recipe",
  },
  explosives = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.94499999999999993,
        r = 0.95499999999999989,
      },
      secondary = {
        a = 0.89800000000000004,
        b = 0.65899999999999999,
        g = 0.44100000000000001,
        r = 0,
      },
      tertiary = {
        a = 0,
        b = 0.36499999999999999,
        g = 0.28799999999999999,
        r = 0,
      },
    },
    expensive = {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {
          amount = 2,
          name = "sulfur",
          type = "item",
        },
        {
          amount = 2,
          name = "coal",
          type = "item",
        },
        {
          amount = 10,
          name = "water",
          type = "fluid",
        },
      },
      result = "explosives",
      result_count = 2,
    },
    name = "explosives",
    normal = {
      enabled = false,
      energy_required = 4,
      ingredients = {
        {
          amount = 1,
          name = "sulfur",
          type = "item",
        },
        {
          amount = 1,
          name = "coal",
          type = "item",
        },
        {
          amount = 10,
          name = "water",
          type = "fluid",
        },
      },
      result = "explosives",
      result_count = 2,
    },
    type = "recipe",
  },
  ["express-loader"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "express-transport-belt",
        5,
      },
      {
        "fast-loader",
        1,
      },
    },
    name = "express-loader",
    result = "express-loader",
    type = "recipe",
  },
  ["express-splitter"] = {
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "fast-splitter",
        1,
      },
      {
        "iron-gear-wheel",
        10,
      },
      {
        "advanced-circuit",
        10,
      },
      {
        amount = 80,
        name = "lubricant",
        type = "fluid",
      },
    },
    name = "express-splitter",
    result = "express-splitter",
    type = "recipe",
  },
  ["express-transport-belt"] = {
    category = "crafting-with-fluid",
    expensive = {
      enabled = false,
      ingredients = {
        {
          "iron-gear-wheel",
          20,
        },
        {
          "fast-transport-belt",
          1,
        },
        {
          amount = 20,
          name = "lubricant",
          type = "fluid",
        },
      },
      result = "express-transport-belt",
    },
    name = "express-transport-belt",
    normal = {
      enabled = false,
      ingredients = {
        {
          "iron-gear-wheel",
          10,
        },
        {
          "fast-transport-belt",
          1,
        },
        {
          amount = 20,
          name = "lubricant",
          type = "fluid",
        },
      },
      result = "express-transport-belt",
    },
    type = "recipe",
  },
  ["express-underground-belt"] = {
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "iron-gear-wheel",
        80,
      },
      {
        "fast-underground-belt",
        2,
      },
      {
        amount = 40,
        name = "lubricant",
        type = "fluid",
      },
    },
    name = "express-underground-belt",
    result = "express-underground-belt",
    result_count = 2,
    type = "recipe",
  },
  ["fast-inserter"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        2,
      },
      {
        "iron-plate",
        2,
      },
      {
        "inserter",
        1,
      },
    },
    name = "fast-inserter",
    result = "fast-inserter",
    type = "recipe",
  },
  ["fast-loader"] = {
    enabled = false,
    energy_required = 3,
    ingredients = {
      {
        "fast-transport-belt",
        5,
      },
      {
        "loader",
        1,
      },
    },
    name = "fast-loader",
    result = "fast-loader",
    type = "recipe",
  },
  ["fast-splitter"] = {
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "splitter",
        1,
      },
      {
        "iron-gear-wheel",
        10,
      },
      {
        "electronic-circuit",
        10,
      },
    },
    name = "fast-splitter",
    result = "fast-splitter",
    type = "recipe",
  },
  ["fast-transport-belt"] = {
    enabled = false,
    ingredients = {
      {
        "iron-gear-wheel",
        5,
      },
      {
        "transport-belt",
        1,
      },
    },
    name = "fast-transport-belt",
    result = "fast-transport-belt",
    type = "recipe",
  },
  ["fast-underground-belt"] = {
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "iron-gear-wheel",
        40,
      },
      {
        "underground-belt",
        2,
      },
    },
    name = "fast-underground-belt",
    result = "fast-underground-belt",
    result_count = 2,
    type = "recipe",
  },
  ["fill-crude-oil-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        tint = {
          a = 0.75,
          b = 0,
          g = 0,
          r = 0,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.5,
          g = 0.5,
          r = 0.5,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/crude-oil.png",
        scale = 0.5,
        shift = {
          4,
          -8,
        },
      },
    },
    ingredients = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "crude-oil",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.fill-barrel",
      {
        "fluid-name.crude-oil",
      },
    },
    name = "fill-crude-oil-barrel",
    order = "b[fill-crude-oil-barrel]",
    results = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "crude-oil-barrel",
        type = "item",
      },
    },
    subgroup = "fill-barrel",
    type = "recipe",
  },
  ["fill-heavy-oil-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        tint = {
          a = 0.75,
          b = 0,
          g = 0.04,
          r = 0.5,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.3,
          g = 0.6,
          r = 0.85,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/heavy-oil.png",
        scale = 0.5,
        shift = {
          4,
          -8,
        },
      },
    },
    ingredients = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "heavy-oil",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.fill-barrel",
      {
        "fluid-name.heavy-oil",
      },
    },
    name = "fill-heavy-oil-barrel",
    order = "b[fill-heavy-oil-barrel]",
    results = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "heavy-oil-barrel",
        type = "item",
      },
    },
    subgroup = "fill-barrel",
    type = "recipe",
  },
  ["fill-light-oil-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        tint = {
          a = 0.75,
          b = 0,
          g = 0.33000000000000003,
          r = 0.56999999999999993,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.070000000000000009,
          g = 0.72999999999999998,
          r = 1,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/light-oil.png",
        scale = 0.5,
        shift = {
          4,
          -8,
        },
      },
    },
    ingredients = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "light-oil",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.fill-barrel",
      {
        "fluid-name.light-oil",
      },
    },
    name = "fill-light-oil-barrel",
    order = "b[fill-light-oil-barrel]",
    results = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "light-oil-barrel",
        type = "item",
      },
    },
    subgroup = "fill-barrel",
    type = "recipe",
  },
  ["fill-lubricant-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.03,
          g = 0.32000000000000002,
          r = 0.15,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.31000000000000001,
          g = 0.75,
          r = 0.42999999999999998,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/lubricant.png",
        scale = 0.5,
        shift = {
          4,
          -8,
        },
      },
    },
    ingredients = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "lubricant",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.fill-barrel",
      {
        "fluid-name.lubricant",
      },
    },
    name = "fill-lubricant-barrel",
    order = "b[fill-lubricant-barrel]",
    results = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "lubricant-barrel",
        type = "item",
      },
    },
    subgroup = "fill-barrel",
    type = "recipe",
  },
  ["fill-petroleum-gas-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.3,
          g = 0.1,
          r = 0.3,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.8,
          g = 0.8,
          r = 0.8,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
        scale = 0.5,
        shift = {
          4,
          -8,
        },
      },
    },
    ingredients = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "petroleum-gas",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.fill-barrel",
      {
        "fluid-name.petroleum-gas",
      },
    },
    name = "fill-petroleum-gas-barrel",
    order = "b[fill-petroleum-gas-barrel]",
    results = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "petroleum-gas-barrel",
        type = "item",
      },
    },
    subgroup = "fill-barrel",
    type = "recipe",
  },
  ["fill-sulfuric-acid-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.1,
          g = 0.65,
          r = 0.75,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.1,
          g = 1,
          r = 0.7,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
        scale = 0.5,
        shift = {
          4,
          -8,
        },
      },
    },
    ingredients = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "sulfuric-acid",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.fill-barrel",
      {
        "fluid-name.sulfuric-acid",
      },
    },
    name = "fill-sulfuric-acid-barrel",
    order = "b[fill-sulfuric-acid-barrel]",
    results = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "sulfuric-acid-barrel",
        type = "item",
      },
    },
    subgroup = "fill-barrel",
    type = "recipe",
  },
  ["fill-water-barrel"] = {
    allow_decomposition = false,
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    icon_size = 32,
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png",
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png",
        tint = {
          a = 0.75,
          b = 0.6,
          g = 0.34000000000000004,
          r = 0,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png",
        tint = {
          a = 0.75,
          b = 0.7,
          g = 0.7,
          r = 0.7,
        },
      },
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        scale = 0.5,
        shift = {
          4,
          -8,
        },
      },
    },
    ingredients = {
      {
        amount = 50,
        catalyst_amount = 50,
        name = "water",
        type = "fluid",
      },
      {
        amount = 1,
        catalyst_amount = 1,
        name = "empty-barrel",
        type = "item",
      },
    },
    localised_name = {
      "recipe-name.fill-barrel",
      {
        "fluid-name.water",
      },
    },
    name = "fill-water-barrel",
    order = "b[fill-water-barrel]",
    results = {
      {
        amount = 1,
        catalyst_amount = 1,
        name = "water-barrel",
        type = "item",
      },
    },
    subgroup = "fill-barrel",
    type = "recipe",
  },
  ["filter-inserter"] = {
    enabled = false,
    ingredients = {
      {
        "fast-inserter",
        1,
      },
      {
        "electronic-circuit",
        4,
      },
    },
    name = "filter-inserter",
    result = "filter-inserter",
    type = "recipe",
  },
  ["firearm-magazine"] = {
    energy_required = 1,
    ingredients = {
      {
        "iron-plate",
        4,
      },
    },
    name = "firearm-magazine",
    result = "firearm-magazine",
    result_count = 1,
    type = "recipe",
  },
  flamethrower = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "steel-plate",
        5,
      },
      {
        "iron-gear-wheel",
        10,
      },
    },
    name = "flamethrower",
    result = "flamethrower",
    type = "recipe",
  },
  ["flamethrower-ammo"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.53300000000000001,
        r = 0.84499999999999993,
      },
      secondary = {
        a = 0,
        b = 0,
        g = 0,
        r = 0.65500000000000007,
      },
      tertiary = {
        a = 0,
        b = 0,
        g = 0.329,
        r = 0.68500000000000005,
      },
    },
    enabled = false,
    energy_required = 6,
    ingredients = {
      {
        amount = 5,
        name = "steel-plate",
        type = "item",
      },
      {
        amount = 50,
        name = "light-oil",
        type = "fluid",
      },
      {
        amount = 50,
        name = "heavy-oil",
        type = "fluid",
      },
    },
    name = "flamethrower-ammo",
    result = "flamethrower-ammo",
    type = "recipe",
  },
  ["flamethrower-turret"] = {
    enabled = false,
    energy_required = 20,
    ingredients = {
      {
        "steel-plate",
        30,
      },
      {
        "iron-gear-wheel",
        15,
      },
      {
        "pipe",
        10,
      },
      {
        "engine-unit",
        5,
      },
    },
    name = "flamethrower-turret",
    result = "flamethrower-turret",
    type = "recipe",
  },
  ["fluid-wagon"] = {
    enabled = false,
    energy_required = 1.5,
    ingredients = {
      {
        "iron-gear-wheel",
        10,
      },
      {
        "steel-plate",
        16,
      },
      {
        "pipe",
        8,
      },
      {
        "storage-tank",
        1,
      },
    },
    name = "fluid-wagon",
    result = "fluid-wagon",
    type = "recipe",
  },
  ["flying-robot-frame"] = {
    enabled = false,
    energy_required = 20,
    ingredients = {
      {
        "electric-engine-unit",
        1,
      },
      {
        "battery",
        2,
      },
      {
        "steel-plate",
        1,
      },
      {
        "electronic-circuit",
        3,
      },
    },
    name = "flying-robot-frame",
    result = "flying-robot-frame",
    type = "recipe",
  },
  ["fusion-reactor-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "processing-unit",
        200,
      },
      {
        "low-density-structure",
        50,
      },
    },
    name = "fusion-reactor-equipment",
    result = "fusion-reactor-equipment",
    type = "recipe",
  },
  gate = {
    enabled = false,
    ingredients = {
      {
        "stone-wall",
        1,
      },
      {
        "steel-plate",
        2,
      },
      {
        "electronic-circuit",
        2,
      },
    },
    name = "gate",
    result = "gate",
    type = "recipe",
  },
  ["green-wire"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
      {
        "copper-cable",
        1,
      },
    },
    name = "green-wire",
    result = "green-wire",
    type = "recipe",
  },
  grenade = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "iron-plate",
        5,
      },
      {
        "coal",
        10,
      },
    },
    name = "grenade",
    result = "grenade",
    type = "recipe",
  },
  ["gun-turret"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "iron-gear-wheel",
        10,
      },
      {
        "copper-plate",
        10,
      },
      {
        "iron-plate",
        20,
      },
    },
    name = "gun-turret",
    result = "gun-turret",
    type = "recipe",
  },
  ["hazard-concrete"] = {
    category = "crafting",
    enabled = false,
    energy_required = 0.25,
    ingredients = {
      {
        "concrete",
        10,
      },
    },
    name = "hazard-concrete",
    result = "hazard-concrete",
    result_count = 10,
    type = "recipe",
  },
  ["heat-exchanger"] = {
    enabled = false,
    energy_required = 3,
    ingredients = {
      {
        "steel-plate",
        10,
      },
      {
        "copper-plate",
        100,
      },
      {
        "pipe",
        10,
      },
    },
    name = "heat-exchanger",
    result = "heat-exchanger",
    type = "recipe",
  },
  ["heat-pipe"] = {
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        "steel-plate",
        10,
      },
      {
        "copper-plate",
        20,
      },
    },
    name = "heat-pipe",
    result = "heat-pipe",
    type = "recipe",
  },
  ["heavy-armor"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "copper-plate",
        100,
      },
      {
        "steel-plate",
        50,
      },
    },
    name = "heavy-armor",
    result = "heavy-armor",
    type = "recipe",
  },
  ["heavy-oil-cracking"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.027000000000000002,
        r = 0.29,
      },
      secondary = {
        a = 0,
        b = 0.19,
        g = 0.46500000000000004,
        r = 0.72199999999999998,
      },
      tertiary = {
        a = 0,
        b = 0,
        g = 0.36499999999999999,
        r = 0.86999999999999993,
      },
    },
    enabled = false,
    energy_required = 2,
    icon = "__base__/graphics/icons/fluid/heavy-oil-cracking.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 30,
        name = "water",
        type = "fluid",
      },
      {
        amount = 40,
        name = "heavy-oil",
        type = "fluid",
      },
    },
    main_product = "",
    name = "heavy-oil-cracking",
    order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
    results = {
      {
        amount = 30,
        name = "light-oil",
        type = "fluid",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  inserter = {
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
      {
        "iron-gear-wheel",
        1,
      },
      {
        "iron-plate",
        1,
      },
    },
    name = "inserter",
    result = "inserter",
    type = "recipe",
  },
  ["iron-chest"] = {
    enabled = true,
    ingredients = {
      {
        "iron-plate",
        8,
      },
    },
    name = "iron-chest",
    result = "iron-chest",
    type = "recipe",
  },
  ["iron-gear-wheel"] = {
    expensive = {
      ingredients = {
        {
          "iron-plate",
          4,
        },
      },
      result = "iron-gear-wheel",
    },
    name = "iron-gear-wheel",
    normal = {
      ingredients = {
        {
          "iron-plate",
          2,
        },
      },
      result = "iron-gear-wheel",
    },
    type = "recipe",
  },
  ["iron-plate"] = {
    category = "smelting",
    energy_required = 3.2000000000000002,
    ingredients = {
      {
        "iron-ore",
        1,
      },
    },
    name = "iron-plate",
    result = "iron-plate",
    type = "recipe",
  },
  ["iron-stick"] = {
    ingredients = {
      {
        "iron-plate",
        1,
      },
    },
    name = "iron-stick",
    result = "iron-stick",
    result_count = 2,
    type = "recipe",
  },
  ["kovarex-enrichment-process"] = {
    allow_decomposition = false,
    category = "centrifuging",
    enabled = false,
    energy_required = 60,
    icon = "__base__/graphics/icons/kovarex-enrichment-process.png",
    icon_size = 32,
    ingredients = {
      {
        "uranium-235",
        40,
      },
      {
        "uranium-238",
        5,
      },
    },
    main_product = "",
    name = "kovarex-enrichment-process",
    order = "r[uranium-processing]-c[kovarex-enrichment-process]",
    results = {
      {
        "uranium-235",
        41,
      },
      {
        "uranium-238",
        2,
      },
    },
    subgroup = "intermediate-product",
    type = "recipe",
  },
  lab = {
    energy_required = 2,
    ingredients = {
      {
        "electronic-circuit",
        10,
      },
      {
        "iron-gear-wheel",
        10,
      },
      {
        "transport-belt",
        4,
      },
    },
    name = "lab",
    result = "lab",
    type = "recipe",
  },
  ["land-mine"] = {
    enabled = false,
    energy_required = 5,
    ingredients = {
      {
        "steel-plate",
        1,
      },
      {
        "explosives",
        2,
      },
    },
    name = "land-mine",
    result = "land-mine",
    result_count = 4,
    type = "recipe",
  },
  landfill = {
    category = "crafting",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
      {
        "stone",
        20,
      },
    },
    name = "landfill",
    result = "landfill",
    result_count = 1,
    type = "recipe",
  },
  ["laser-turret"] = {
    enabled = false,
    energy_required = 20,
    ingredients = {
      {
        "steel-plate",
        20,
      },
      {
        "electronic-circuit",
        20,
      },
      {
        "battery",
        12,
      },
    },
    name = "laser-turret",
    result = "laser-turret",
    type = "recipe",
  },
  ["light-armor"] = {
    enabled = true,
    energy_required = 3,
    ingredients = {
      {
        "iron-plate",
        40,
      },
    },
    name = "light-armor",
    result = "light-armor",
    type = "recipe",
  },
  ["light-oil-cracking"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.40600000000000005,
        r = 0.78500000000000005,
      },
      secondary = {
        a = 0,
        b = 0.60499999999999998,
        g = 0.80500000000000007,
        r = 0.79500000000000002,
      },
      tertiary = {
        a = 0,
        b = 0,
        g = 0.55100000000000007,
        r = 0.83499999999999996,
      },
    },
    enabled = false,
    energy_required = 2,
    icon = "__base__/graphics/icons/fluid/light-oil-cracking.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 30,
        name = "water",
        type = "fluid",
      },
      {
        amount = 30,
        name = "light-oil",
        type = "fluid",
      },
    },
    main_product = "",
    name = "light-oil-cracking",
    order = "b[fluid-chemistry]-b[light-oil-cracking]",
    results = {
      {
        amount = 20,
        name = "petroleum-gas",
        type = "fluid",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  loader = {
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        "inserter",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "iron-plate",
        5,
      },
      {
        "transport-belt",
        5,
      },
    },
    name = "loader",
    result = "loader",
    type = "recipe",
  },
  locomotive = {
    enabled = false,
    energy_required = 4,
    ingredients = {
      {
        "engine-unit",
        20,
      },
      {
        "electronic-circuit",
        10,
      },
      {
        "steel-plate",
        30,
      },
    },
    name = "locomotive",
    result = "locomotive",
    type = "recipe",
  },
  ["logistic-chest-active-provider"] = {
    enabled = false,
    ingredients = {
      {
        "steel-chest",
        1,
      },
      {
        "electronic-circuit",
        3,
      },
      {
        "advanced-circuit",
        1,
      },
    },
    name = "logistic-chest-active-provider",
    result = "logistic-chest-active-provider",
    type = "recipe",
  },
  ["logistic-chest-buffer"] = {
    enabled = false,
    ingredients = {
      {
        "steel-chest",
        1,
      },
      {
        "electronic-circuit",
        3,
      },
      {
        "advanced-circuit",
        1,
      },
    },
    name = "logistic-chest-buffer",
    result = "logistic-chest-buffer",
    type = "recipe",
  },
  ["logistic-chest-passive-provider"] = {
    enabled = false,
    ingredients = {
      {
        "steel-chest",
        1,
      },
      {
        "electronic-circuit",
        3,
      },
      {
        "advanced-circuit",
        1,
      },
    },
    name = "logistic-chest-passive-provider",
    result = "logistic-chest-passive-provider",
    type = "recipe",
  },
  ["logistic-chest-requester"] = {
    enabled = false,
    ingredients = {
      {
        "steel-chest",
        1,
      },
      {
        "electronic-circuit",
        3,
      },
      {
        "advanced-circuit",
        1,
      },
    },
    name = "logistic-chest-requester",
    result = "logistic-chest-requester",
    type = "recipe",
  },
  ["logistic-chest-storage"] = {
    enabled = false,
    ingredients = {
      {
        "steel-chest",
        1,
      },
      {
        "electronic-circuit",
        3,
      },
      {
        "advanced-circuit",
        1,
      },
    },
    name = "logistic-chest-storage",
    result = "logistic-chest-storage",
    type = "recipe",
  },
  ["logistic-robot"] = {
    enabled = false,
    ingredients = {
      {
        "flying-robot-frame",
        1,
      },
      {
        "advanced-circuit",
        2,
      },
    },
    name = "logistic-robot",
    result = "logistic-robot",
    type = "recipe",
  },
  ["logistic-science-pack"] = {
    enabled = false,
    energy_required = 6,
    ingredients = {
      {
        "inserter",
        1,
      },
      {
        "transport-belt",
        1,
      },
    },
    name = "logistic-science-pack",
    result = "logistic-science-pack",
    type = "recipe",
  },
  ["long-handed-inserter"] = {
    enabled = false,
    ingredients = {
      {
        "iron-gear-wheel",
        1,
      },
      {
        "iron-plate",
        1,
      },
      {
        "inserter",
        1,
      },
    },
    name = "long-handed-inserter",
    result = "long-handed-inserter",
    type = "recipe",
  },
  ["low-density-structure"] = {
    category = "crafting",
    expensive = {
      enabled = false,
      energy_required = 20,
      ingredients = {
        {
          "steel-plate",
          2,
        },
        {
          "copper-plate",
          20,
        },
        {
          "plastic-bar",
          30,
        },
      },
      result = "low-density-structure",
    },
    name = "low-density-structure",
    normal = {
      enabled = false,
      energy_required = 20,
      ingredients = {
        {
          "steel-plate",
          2,
        },
        {
          "copper-plate",
          20,
        },
        {
          "plastic-bar",
          5,
        },
      },
      result = "low-density-structure",
    },
    type = "recipe",
  },
  lubricant = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0.01,
        g = 0.26000000000000001,
        r = 0,
      },
      secondary = {
        a = 0,
        b = 0,
        g = 0.64000000000000004,
        r = 0.070999999999999996,
      },
      tertiary = {
        a = 0,
        b = 0,
        g = 0.52000000000000002,
        r = 0.026000000000000001,
      },
    },
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        amount = 10,
        name = "heavy-oil",
        type = "fluid",
      },
    },
    name = "lubricant",
    results = {
      {
        amount = 10,
        name = "lubricant",
        type = "fluid",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  ["medium-electric-pole"] = {
    enabled = false,
    ingredients = {
      {
        "iron-stick",
        4,
      },
      {
        "steel-plate",
        2,
      },
      {
        "copper-plate",
        2,
      },
    },
    name = "medium-electric-pole",
    result = "medium-electric-pole",
    type = "recipe",
  },
  ["military-science-pack"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "piercing-rounds-magazine",
        1,
      },
      {
        "grenade",
        1,
      },
      {
        "stone-wall",
        2,
      },
    },
    name = "military-science-pack",
    result = "military-science-pack",
    result_count = 2,
    type = "recipe",
  },
  ["modular-armor"] = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "advanced-circuit",
        30,
      },
      {
        "steel-plate",
        50,
      },
    },
    name = "modular-armor",
    result = "modular-armor",
    type = "recipe",
  },
  ["night-vision-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "advanced-circuit",
        5,
      },
      {
        "steel-plate",
        10,
      },
    },
    name = "night-vision-equipment",
    result = "night-vision-equipment",
    type = "recipe",
  },
  ["nuclear-fuel"] = {
    category = "centrifuging",
    enabled = false,
    energy_required = 90,
    icon = "__base__/graphics/icons/nuclear-fuel.png",
    icon_size = 32,
    ingredients = {
      {
        "uranium-235",
        1,
      },
      {
        "rocket-fuel",
        1,
      },
    },
    name = "nuclear-fuel",
    result = "nuclear-fuel",
    type = "recipe",
  },
  ["nuclear-fuel-reprocessing"] = {
    allow_decomposition = false,
    category = "centrifuging",
    enabled = false,
    energy_required = 60,
    icon = "__base__/graphics/icons/nuclear-fuel-reprocessing.png",
    icon_size = 32,
    ingredients = {
      {
        "used-up-uranium-fuel-cell",
        5,
      },
    },
    main_product = "",
    name = "nuclear-fuel-reprocessing",
    order = "r[uranium-processing]-b[nuclear-fuel-reprocessing]",
    results = {
      {
        "uranium-238",
        3,
      },
    },
    subgroup = "intermediate-product",
    type = "recipe",
  },
  ["nuclear-reactor"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "concrete",
        500,
      },
      {
        "steel-plate",
        500,
      },
      {
        "advanced-circuit",
        500,
      },
      {
        "copper-plate",
        500,
      },
    },
    name = "nuclear-reactor",
    requester_paste_multiplier = 1,
    result = "nuclear-reactor",
    type = "recipe",
  },
  ["offshore-pump"] = {
    ingredients = {
      {
        "electronic-circuit",
        2,
      },
      {
        "pipe",
        1,
      },
      {
        "iron-gear-wheel",
        1,
      },
    },
    name = "offshore-pump",
    result = "offshore-pump",
    type = "recipe",
  },
  ["oil-refinery"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "steel-plate",
        15,
      },
      {
        "iron-gear-wheel",
        10,
      },
      {
        "stone-brick",
        10,
      },
      {
        "electronic-circuit",
        10,
      },
      {
        "pipe",
        10,
      },
    },
    name = "oil-refinery",
    result = "oil-refinery",
    type = "recipe",
  },
  ["personal-laser-defense-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "processing-unit",
        20,
      },
      {
        "low-density-structure",
        5,
      },
      {
        "laser-turret",
        5,
      },
    },
    name = "personal-laser-defense-equipment",
    result = "personal-laser-defense-equipment",
    type = "recipe",
  },
  ["personal-roboport-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "advanced-circuit",
        10,
      },
      {
        "iron-gear-wheel",
        40,
      },
      {
        "steel-plate",
        20,
      },
      {
        "battery",
        45,
      },
    },
    name = "personal-roboport-equipment",
    result = "personal-roboport-equipment",
    type = "recipe",
  },
  ["personal-roboport-mk2-equipment"] = {
    enabled = false,
    energy_required = 20,
    ingredients = {
      {
        "personal-roboport-equipment",
        5,
      },
      {
        "processing-unit",
        100,
      },
      {
        "low-density-structure",
        20,
      },
    },
    name = "personal-roboport-mk2-equipment",
    result = "personal-roboport-mk2-equipment",
    type = "recipe",
  },
  ["piercing-rounds-magazine"] = {
    enabled = false,
    energy_required = 3,
    ingredients = {
      {
        "firearm-magazine",
        1,
      },
      {
        "steel-plate",
        1,
      },
      {
        "copper-plate",
        5,
      },
    },
    name = "piercing-rounds-magazine",
    result = "piercing-rounds-magazine",
    type = "recipe",
  },
  ["piercing-shotgun-shell"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "shotgun-shell",
        2,
      },
      {
        "copper-plate",
        5,
      },
      {
        "steel-plate",
        2,
      },
    },
    name = "piercing-shotgun-shell",
    result = "piercing-shotgun-shell",
    type = "recipe",
  },
  pipe = {
    expensive = {
      ingredients = {
        {
          "iron-plate",
          2,
        },
      },
      result = "pipe",
    },
    name = "pipe",
    normal = {
      ingredients = {
        {
          "iron-plate",
          1,
        },
      },
      result = "pipe",
    },
    type = "recipe",
  },
  ["pipe-to-ground"] = {
    ingredients = {
      {
        "pipe",
        10,
      },
      {
        "iron-plate",
        5,
      },
    },
    name = "pipe-to-ground",
    result = "pipe-to-ground",
    result_count = 2,
    type = "recipe",
  },
  pistol = {
    energy_required = 5,
    ingredients = {
      {
        "copper-plate",
        5,
      },
      {
        "iron-plate",
        5,
      },
    },
    name = "pistol",
    result = "pistol",
    type = "recipe",
  },
  ["plastic-bar"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0.49800000000000004,
        g = 0.49800000000000004,
        r = 0.49800000000000004,
      },
      secondary = {
        a = 0,
        b = 0.4,
        g = 0.4,
        r = 0.4,
      },
      tertiary = {
        a = 0,
        b = 0.30499999999999998,
        g = 0.30499999999999998,
        r = 0.30499999999999998,
      },
    },
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        amount = 20,
        name = "petroleum-gas",
        type = "fluid",
      },
      {
        amount = 1,
        name = "coal",
        type = "item",
      },
    },
    name = "plastic-bar",
    results = {
      {
        amount = 2,
        name = "plastic-bar",
        type = "item",
      },
    },
    type = "recipe",
  },
  ["player-port"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        10,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "iron-plate",
        1,
      },
    },
    name = "player-port",
    result = "player-port",
    type = "recipe",
  },
  ["poison-capsule"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "steel-plate",
        3,
      },
      {
        "electronic-circuit",
        3,
      },
      {
        "coal",
        10,
      },
    },
    name = "poison-capsule",
    result = "poison-capsule",
    type = "recipe",
  },
  ["power-armor"] = {
    enabled = false,
    energy_required = 20,
    ingredients = {
      {
        "processing-unit",
        40,
      },
      {
        "electric-engine-unit",
        20,
      },
      {
        "steel-plate",
        40,
      },
    },
    name = "power-armor",
    requester_paste_multiplier = 1,
    result = "power-armor",
    type = "recipe",
  },
  ["power-armor-mk2"] = {
    enabled = false,
    energy_required = 25,
    ingredients = {
      {
        "effectivity-module-2",
        25,
      },
      {
        "speed-module-2",
        25,
      },
      {
        "processing-unit",
        60,
      },
      {
        "electric-engine-unit",
        40,
      },
      {
        "low-density-structure",
        30,
      },
    },
    name = "power-armor-mk2",
    requester_paste_multiplier = 1,
    result = "power-armor-mk2",
    type = "recipe",
  },
  ["power-switch"] = {
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "iron-plate",
        5,
      },
      {
        "copper-cable",
        5,
      },
      {
        "electronic-circuit",
        2,
      },
    },
    name = "power-switch",
    result = "power-switch",
    type = "recipe",
  },
  ["processing-unit"] = {
    category = "crafting-with-fluid",
    expensive = {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {
          "electronic-circuit",
          20,
        },
        {
          "advanced-circuit",
          2,
        },
        {
          amount = 10,
          name = "sulfuric-acid",
          type = "fluid",
        },
      },
      result = "processing-unit",
    },
    name = "processing-unit",
    normal = {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {
          "electronic-circuit",
          20,
        },
        {
          "advanced-circuit",
          2,
        },
        {
          amount = 5,
          name = "sulfuric-acid",
          type = "fluid",
        },
      },
      result = "processing-unit",
    },
    type = "recipe",
  },
  ["production-science-pack"] = {
    enabled = false,
    energy_required = 21,
    ingredients = {
      {
        "electric-furnace",
        1,
      },
      {
        "productivity-module",
        1,
      },
      {
        "rail",
        30,
      },
    },
    name = "production-science-pack",
    result = "production-science-pack",
    result_count = 3,
    type = "recipe",
  },
  ["productivity-module"] = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "advanced-circuit",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "productivity-module",
    result = "productivity-module",
    type = "recipe",
  },
  ["productivity-module-2"] = {
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        "productivity-module",
        4,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "processing-unit",
        5,
      },
    },
    name = "productivity-module-2",
    result = "productivity-module-2",
    type = "recipe",
  },
  ["productivity-module-3"] = {
    enabled = false,
    energy_required = 60,
    ingredients = {
      {
        "productivity-module-2",
        5,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "processing-unit",
        5,
      },
    },
    name = "productivity-module-3",
    result = "productivity-module-3",
    type = "recipe",
  },
  ["programmable-speaker"] = {
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "iron-plate",
        3,
      },
      {
        "iron-stick",
        4,
      },
      {
        "copper-cable",
        5,
      },
      {
        "electronic-circuit",
        4,
      },
    },
    name = "programmable-speaker",
    result = "programmable-speaker",
    type = "recipe",
  },
  pump = {
    enabled = false,
    energy_required = 2,
    ingredients = {
      {
        "engine-unit",
        1,
      },
      {
        "steel-plate",
        1,
      },
      {
        "pipe",
        1,
      },
    },
    name = "pump",
    result = "pump",
    type = "recipe",
  },
  pumpjack = {
    enabled = false,
    energy_required = 5,
    ingredients = {
      {
        "steel-plate",
        5,
      },
      {
        "iron-gear-wheel",
        10,
      },
      {
        "electronic-circuit",
        5,
      },
      {
        "pipe",
        10,
      },
    },
    name = "pumpjack",
    result = "pumpjack",
    type = "recipe",
  },
  radar = {
    ingredients = {
      {
        "electronic-circuit",
        5,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "iron-plate",
        10,
      },
    },
    name = "radar",
    result = "radar",
    type = "recipe",
  },
  rail = {
    enabled = false,
    ingredients = {
      {
        "stone",
        1,
      },
      {
        "iron-stick",
        1,
      },
      {
        "steel-plate",
        1,
      },
    },
    name = "rail",
    result = "rail",
    result_count = 2,
    type = "recipe",
  },
  ["rail-chain-signal"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
      {
        "iron-plate",
        5,
      },
    },
    name = "rail-chain-signal",
    result = "rail-chain-signal",
    type = "recipe",
  },
  ["rail-signal"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
      {
        "iron-plate",
        5,
      },
    },
    name = "rail-signal",
    result = "rail-signal",
    type = "recipe",
  },
  railgun = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "steel-plate",
        15,
      },
      {
        "copper-plate",
        15,
      },
      {
        "electronic-circuit",
        10,
      },
      {
        "advanced-circuit",
        5,
      },
    },
    name = "railgun",
    result = "railgun",
    type = "recipe",
  },
  ["railgun-dart"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "steel-plate",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "railgun-dart",
    result = "railgun-dart",
    type = "recipe",
  },
  ["red-wire"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
      {
        "copper-cable",
        1,
      },
    },
    name = "red-wire",
    result = "red-wire",
    type = "recipe",
  },
  ["refined-concrete"] = {
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "concrete",
        20,
      },
      {
        "iron-stick",
        8,
      },
      {
        "steel-plate",
        1,
      },
      {
        amount = 100,
        name = "water",
        type = "fluid",
      },
    },
    name = "refined-concrete",
    result = "refined-concrete",
    result_count = 10,
    type = "recipe",
  },
  ["refined-hazard-concrete"] = {
    category = "crafting",
    enabled = false,
    energy_required = 0.25,
    ingredients = {
      {
        "refined-concrete",
        10,
      },
    },
    name = "refined-hazard-concrete",
    result = "refined-hazard-concrete",
    result_count = 10,
    type = "recipe",
  },
  ["repair-pack"] = {
    ingredients = {
      {
        "electronic-circuit",
        2,
      },
      {
        "iron-gear-wheel",
        2,
      },
    },
    name = "repair-pack",
    result = "repair-pack",
    type = "recipe",
  },
  roboport = {
    enabled = false,
    energy_required = 5,
    ingredients = {
      {
        "steel-plate",
        45,
      },
      {
        "iron-gear-wheel",
        45,
      },
      {
        "advanced-circuit",
        45,
      },
    },
    name = "roboport",
    result = "roboport",
    type = "recipe",
  },
  rocket = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
      {
        "explosives",
        1,
      },
      {
        "iron-plate",
        2,
      },
    },
    name = "rocket",
    result = "rocket",
    type = "recipe",
  },
  ["rocket-control-unit"] = {
    category = "crafting",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        "processing-unit",
        1,
      },
      {
        "speed-module",
        1,
      },
    },
    name = "rocket-control-unit",
    result = "rocket-control-unit",
    type = "recipe",
  },
  ["rocket-fuel"] = {
    category = "crafting",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        "solid-fuel",
        10,
      },
    },
    name = "rocket-fuel",
    result = "rocket-fuel",
    type = "recipe",
  },
  ["rocket-launcher"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "iron-plate",
        5,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "rocket-launcher",
    result = "rocket-launcher",
    type = "recipe",
  },
  ["rocket-part"] = {
    category = "rocket-building",
    enabled = false,
    energy_required = 3,
    hidden = true,
    ingredients = {
      {
        "rocket-control-unit",
        10,
      },
      {
        "low-density-structure",
        10,
      },
      {
        "rocket-fuel",
        10,
      },
    },
    name = "rocket-part",
    result = "rocket-part",
    type = "recipe",
  },
  ["rocket-silo"] = {
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        "steel-plate",
        1000,
      },
      {
        "concrete",
        1000,
      },
      {
        "pipe",
        100,
      },
      {
        "processing-unit",
        200,
      },
      {
        "electric-engine-unit",
        200,
      },
    },
    name = "rocket-silo",
    requester_paste_multiplier = 1,
    result = "rocket-silo",
    type = "recipe",
  },
  satellite = {
    category = "crafting",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {
        "low-density-structure",
        100,
      },
      {
        "solar-panel",
        100,
      },
      {
        "accumulator",
        100,
      },
      {
        "radar",
        5,
      },
      {
        "processing-unit",
        100,
      },
      {
        "rocket-fuel",
        50,
      },
    },
    name = "satellite",
    requester_paste_multiplier = 1,
    result = "satellite",
    type = "recipe",
  },
  shotgun = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "iron-plate",
        15,
      },
      {
        "iron-gear-wheel",
        5,
      },
      {
        "copper-plate",
        10,
      },
      {
        "wood",
        5,
      },
    },
    name = "shotgun",
    result = "shotgun",
    type = "recipe",
  },
  ["shotgun-shell"] = {
    enabled = false,
    energy_required = 3,
    ingredients = {
      {
        "copper-plate",
        2,
      },
      {
        "iron-plate",
        2,
      },
    },
    name = "shotgun-shell",
    result = "shotgun-shell",
    type = "recipe",
  },
  ["slowdown-capsule"] = {
    enabled = false,
    energy_required = 8,
    ingredients = {
      {
        "steel-plate",
        2,
      },
      {
        "electronic-circuit",
        2,
      },
      {
        "coal",
        5,
      },
    },
    name = "slowdown-capsule",
    result = "slowdown-capsule",
    type = "recipe",
  },
  ["small-electric-pole"] = {
    ingredients = {
      {
        "wood",
        1,
      },
      {
        "copper-cable",
        2,
      },
    },
    name = "small-electric-pole",
    result = "small-electric-pole",
    result_count = 2,
    type = "recipe",
  },
  ["small-lamp"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        1,
      },
      {
        "copper-cable",
        3,
      },
      {
        "iron-plate",
        1,
      },
    },
    name = "small-lamp",
    result = "small-lamp",
    type = "recipe",
  },
  ["small-plane"] = {
    category = "crafting",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        "plastic-bar",
        100,
      },
      {
        "advanced-circuit",
        200,
      },
      {
        "electric-engine-unit",
        20,
      },
      {
        "battery",
        100,
      },
    },
    name = "small-plane",
    result = "small-plane",
    type = "recipe",
  },
  ["solar-panel"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "steel-plate",
        5,
      },
      {
        "electronic-circuit",
        15,
      },
      {
        "copper-plate",
        5,
      },
    },
    name = "solar-panel",
    result = "solar-panel",
    type = "recipe",
  },
  ["solar-panel-equipment"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "solar-panel",
        1,
      },
      {
        "advanced-circuit",
        2,
      },
      {
        "steel-plate",
        5,
      },
    },
    name = "solar-panel-equipment",
    result = "solar-panel-equipment",
    type = "recipe",
  },
  ["solid-fuel-from-heavy-oil"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0.095,
        g = 0.095,
        r = 0.16000000000000001,
      },
      secondary = {
        a = 0,
        b = 0.19,
        g = 0.21499999999999999,
        r = 0.46999999999999993,
      },
      tertiary = {
        a = 0,
        b = 0.13500000000000001,
        g = 0.14399999999999999,
        r = 0.43499999999999996,
      },
    },
    enabled = false,
    energy_required = 2,
    icon = "__base__/graphics/icons/solid-fuel-from-heavy-oil.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 20,
        name = "heavy-oil",
        type = "fluid",
      },
    },
    name = "solid-fuel-from-heavy-oil",
    order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]",
    results = {
      {
        amount = 1,
        name = "solid-fuel",
        type = "item",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  ["solid-fuel-from-light-oil"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.122,
        r = 0.27000000000000002,
      },
      secondary = {
        a = 0,
        b = 0.325,
        g = 0.54600000000000009,
        r = 0.73499999999999996,
      },
      tertiary = {
        a = 0,
        b = 0,
        g = 0.34799999999999995,
        r = 0.60999999999999996,
      },
    },
    enabled = false,
    energy_required = 2,
    icon = "__base__/graphics/icons/solid-fuel-from-light-oil.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 10,
        name = "light-oil",
        type = "fluid",
      },
    },
    name = "solid-fuel-from-light-oil",
    order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]",
    results = {
      {
        amount = 1,
        name = "solid-fuel",
        type = "item",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  ["solid-fuel-from-petroleum-gas"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0.50999999999999996,
        g = 0.075,
        r = 0.33100000000000001,
      },
      secondary = {
        a = 0.36099999999999999,
        b = 0.61500000000000004,
        g = 0.54000000000000004,
        r = 0.58899999999999997,
      },
      tertiary = {
        a = 0,
        b = 0.69499999999999993,
        g = 0.145,
        r = 0.46899999999999995,
      },
    },
    enabled = false,
    energy_required = 2,
    icon = "__base__/graphics/icons/solid-fuel-from-petroleum-gas.png",
    icon_size = 32,
    ingredients = {
      {
        amount = 20,
        name = "petroleum-gas",
        type = "fluid",
      },
    },
    name = "solid-fuel-from-petroleum-gas",
    order = "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]",
    results = {
      {
        amount = 1,
        name = "solid-fuel",
        type = "item",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  ["speed-module"] = {
    enabled = false,
    energy_required = 15,
    ingredients = {
      {
        "advanced-circuit",
        5,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "speed-module",
    result = "speed-module",
    type = "recipe",
  },
  ["speed-module-2"] = {
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        "speed-module",
        4,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "processing-unit",
        5,
      },
    },
    name = "speed-module-2",
    result = "speed-module-2",
    type = "recipe",
  },
  ["speed-module-3"] = {
    enabled = false,
    energy_required = 60,
    ingredients = {
      {
        "speed-module-2",
        5,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "processing-unit",
        5,
      },
    },
    name = "speed-module-3",
    result = "speed-module-3",
    type = "recipe",
  },
  splitter = {
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        "electronic-circuit",
        5,
      },
      {
        "iron-plate",
        5,
      },
      {
        "transport-belt",
        4,
      },
    },
    name = "splitter",
    result = "splitter",
    type = "recipe",
  },
  ["stack-filter-inserter"] = {
    enabled = false,
    ingredients = {
      {
        "stack-inserter",
        1,
      },
      {
        "electronic-circuit",
        5,
      },
    },
    name = "stack-filter-inserter",
    result = "stack-filter-inserter",
    type = "recipe",
  },
  ["stack-inserter"] = {
    enabled = false,
    ingredients = {
      {
        "iron-gear-wheel",
        15,
      },
      {
        "electronic-circuit",
        15,
      },
      {
        "advanced-circuit",
        1,
      },
      {
        "fast-inserter",
        1,
      },
    },
    name = "stack-inserter",
    result = "stack-inserter",
    type = "recipe",
  },
  ["steam-engine"] = {
    expensive = {
      ingredients = {
        {
          "iron-gear-wheel",
          10,
        },
        {
          "pipe",
          5,
        },
        {
          "iron-plate",
          50,
        },
      },
      result = "steam-engine",
    },
    name = "steam-engine",
    normal = {
      ingredients = {
        {
          "iron-gear-wheel",
          8,
        },
        {
          "pipe",
          5,
        },
        {
          "iron-plate",
          10,
        },
      },
      result = "steam-engine",
    },
    type = "recipe",
  },
  ["steam-turbine"] = {
    enabled = false,
    energy_required = 3,
    ingredients = {
      {
        "iron-gear-wheel",
        50,
      },
      {
        "copper-plate",
        50,
      },
      {
        "pipe",
        20,
      },
    },
    name = "steam-turbine",
    result = "steam-turbine",
    type = "recipe",
  },
  ["steel-chest"] = {
    enabled = false,
    ingredients = {
      {
        "steel-plate",
        8,
      },
    },
    name = "steel-chest",
    result = "steel-chest",
    type = "recipe",
  },
  ["steel-furnace"] = {
    enabled = false,
    energy_required = 3,
    ingredients = {
      {
        "steel-plate",
        6,
      },
      {
        "stone-brick",
        10,
      },
    },
    name = "steel-furnace",
    result = "steel-furnace",
    type = "recipe",
  },
  ["steel-plate"] = {
    category = "smelting",
    expensive = {
      enabled = false,
      energy_required = 32,
      ingredients = {
        {
          "iron-plate",
          10,
        },
      },
      result = "steel-plate",
    },
    name = "steel-plate",
    normal = {
      enabled = false,
      energy_required = 16,
      ingredients = {
        {
          "iron-plate",
          5,
        },
      },
      result = "steel-plate",
    },
    type = "recipe",
  },
  ["stone-brick"] = {
    category = "smelting",
    enabled = true,
    energy_required = 3.2000000000000002,
    ingredients = {
      {
        "stone",
        2,
      },
    },
    name = "stone-brick",
    result = "stone-brick",
    type = "recipe",
  },
  ["stone-furnace"] = {
    ingredients = {
      {
        "stone",
        5,
      },
    },
    name = "stone-furnace",
    result = "stone-furnace",
    type = "recipe",
  },
  ["stone-wall"] = {
    enabled = false,
    ingredients = {
      {
        "stone-brick",
        5,
      },
    },
    name = "stone-wall",
    result = "stone-wall",
    type = "recipe",
  },
  ["storage-tank"] = {
    enabled = false,
    energy_required = 3,
    ingredients = {
      {
        "iron-plate",
        20,
      },
      {
        "steel-plate",
        5,
      },
    },
    name = "storage-tank",
    result = "storage-tank",
    type = "recipe",
  },
  ["submachine-gun"] = {
    expensive = {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {
          "iron-gear-wheel",
          15,
        },
        {
          "copper-plate",
          20,
        },
        {
          "iron-plate",
          30,
        },
      },
      result = "submachine-gun",
    },
    name = "submachine-gun",
    normal = {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {
          "iron-gear-wheel",
          10,
        },
        {
          "copper-plate",
          5,
        },
        {
          "iron-plate",
          10,
        },
      },
      result = "submachine-gun",
    },
    type = "recipe",
  },
  substation = {
    enabled = false,
    ingredients = {
      {
        "steel-plate",
        10,
      },
      {
        "advanced-circuit",
        5,
      },
      {
        "copper-plate",
        5,
      },
    },
    name = "substation",
    result = "substation",
    type = "recipe",
  },
  sulfur = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.65899999999999999,
        r = 1,
      },
      secondary = {
        a = 0,
        b = 0,
        g = 1,
        r = 0.8120000000000001,
      },
      tertiary = {
        a = 0,
        b = 0,
        g = 0.80600000000000005,
        r = 0.95999999999999996,
      },
    },
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        amount = 30,
        name = "water",
        type = "fluid",
      },
      {
        amount = 30,
        name = "petroleum-gas",
        type = "fluid",
      },
    },
    name = "sulfur",
    results = {
      {
        amount = 2,
        name = "sulfur",
        type = "item",
      },
    },
    type = "recipe",
  },
  ["sulfuric-acid"] = {
    category = "chemistry",
    crafting_machine_tint = {
      primary = {
        a = 0,
        b = 0,
        g = 0.73499999999999996,
        r = 0.875,
      },
      secondary = {
        a = 0,
        b = 0,
        g = 0.93999999999999986,
        r = 0.103,
      },
      tertiary = {
        a = 0,
        b = 0,
        g = 0.79500000000000002,
        r = 0.56399999999999997,
      },
    },
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        amount = 5,
        name = "sulfur",
        type = "item",
      },
      {
        amount = 1,
        name = "iron-plate",
        type = "item",
      },
      {
        amount = 100,
        name = "water",
        type = "fluid",
      },
    },
    name = "sulfuric-acid",
    results = {
      {
        amount = 50,
        name = "sulfuric-acid",
        type = "fluid",
      },
    },
    subgroup = "fluid-recipes",
    type = "recipe",
  },
  tank = {
    expensive = {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {
          "engine-unit",
          64,
        },
        {
          "steel-plate",
          100,
        },
        {
          "iron-gear-wheel",
          30,
        },
        {
          "advanced-circuit",
          20,
        },
      },
      result = "tank",
    },
    name = "tank",
    normal = {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {
          "engine-unit",
          32,
        },
        {
          "steel-plate",
          50,
        },
        {
          "iron-gear-wheel",
          15,
        },
        {
          "advanced-circuit",
          10,
        },
      },
      result = "tank",
    },
    type = "recipe",
  },
  ["train-stop"] = {
    enabled = false,
    ingredients = {
      {
        "electronic-circuit",
        5,
      },
      {
        "iron-plate",
        6,
      },
      {
        "iron-stick",
        6,
      },
      {
        "steel-plate",
        3,
      },
    },
    name = "train-stop",
    result = "train-stop",
    type = "recipe",
  },
  ["transport-belt"] = {
    ingredients = {
      {
        "iron-plate",
        1,
      },
      {
        "iron-gear-wheel",
        1,
      },
    },
    name = "transport-belt",
    result = "transport-belt",
    result_count = 2,
    type = "recipe",
  },
  ["underground-belt"] = {
    enabled = false,
    energy_required = 1,
    ingredients = {
      {
        "iron-plate",
        10,
      },
      {
        "transport-belt",
        5,
      },
    },
    name = "underground-belt",
    result = "underground-belt",
    result_count = 2,
    type = "recipe",
  },
  ["uranium-cannon-shell"] = {
    enabled = false,
    energy_required = 12,
    ingredients = {
      {
        "cannon-shell",
        1,
      },
      {
        "uranium-238",
        1,
      },
    },
    name = "uranium-cannon-shell",
    result = "uranium-cannon-shell",
    type = "recipe",
  },
  ["uranium-fuel-cell"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "iron-plate",
        10,
      },
      {
        "uranium-235",
        1,
      },
      {
        "uranium-238",
        19,
      },
    },
    name = "uranium-fuel-cell",
    result = "uranium-fuel-cell",
    result_count = 10,
    type = "recipe",
  },
  ["uranium-processing"] = {
    category = "centrifuging",
    enabled = false,
    energy_required = 12,
    icon = "__base__/graphics/icons/uranium-processing.png",
    icon_size = 32,
    ingredients = {
      {
        "uranium-ore",
        10,
      },
    },
    name = "uranium-processing",
    order = "k[uranium-processing]",
    results = {
      {
        amount = 1,
        name = "uranium-235",
        probability = 0.0070000000000000009,
      },
      {
        amount = 1,
        name = "uranium-238",
        probability = 0.99299999999999997,
      },
    },
    subgroup = "raw-material",
    type = "recipe",
  },
  ["uranium-rounds-magazine"] = {
    enabled = false,
    energy_required = 10,
    ingredients = {
      {
        "piercing-rounds-magazine",
        1,
      },
      {
        "uranium-238",
        1,
      },
    },
    name = "uranium-rounds-magazine",
    result = "uranium-rounds-magazine",
    type = "recipe",
  },
  ["utility-science-pack"] = {
    enabled = false,
    energy_required = 21,
    ingredients = {
      {
        "low-density-structure",
        3,
      },
      {
        "processing-unit",
        2,
      },
      {
        "flying-robot-frame",
        1,
      },
    },
    name = "utility-science-pack",
    result = "utility-science-pack",
    result_count = 3,
    type = "recipe",
  },
  ["wooden-chest"] = {
    ingredients = {
      {
        "wood",
        2,
      },
    },
    name = "wooden-chest",
    result = "wooden-chest",
    type = "recipe",
  },
}
