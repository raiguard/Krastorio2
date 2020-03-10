if not mods["space-exploration"] then return end

local data_util = require("__space-exploration__/data_util")

data:extend({
  -- alphabetical
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-1",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-1", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/adaptive-armour-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "modular-armor",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-2",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-2", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/adaptive-armour-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "military-science-pack",
      data_util.mod_prefix .. "adaptive-armour-1",
    },
    unit = {
     count = 200,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-3",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-3", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/adaptive-armour-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "space-science-pack",
      data_util.mod_prefix .. "adaptive-armour-2",
    },
    unit = {
     count = 300,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-4",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-4", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/adaptive-armour-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
        data_util.mod_prefix .. "material-science-pack",
      data_util.mod_prefix .. "adaptive-armour-3",
    },
    unit = {
     count = 400,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
       { "space-science-pack", 1 },
       {  data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-5",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-5", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/adaptive-armour-5.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-material-4",
      data_util.mod_prefix .. "adaptive-armour-4",
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
       {  data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "astronomic-science-pack",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "astronomic-science-pack",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/beaker/blue.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-astronomic-1"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "biological-science-pack",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "biological-science-pack",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/beaker/green.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-biological-1"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
     name = data_util.mod_prefix .. "meteor-point-defence",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-point-defence" },
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-point-defence-ammo" }
     },
     icon = "__space-exploration-graphics__/graphics/technology/meteor-point-defence.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "steel-processing",
       "concrete",
       "electronics",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
       },
       time = 10
     }
  },
  {
     name = data_util.mod_prefix .. "meteor-defence",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-defence" },
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-defence-ammo" }
     },
     icon = "__space-exploration-graphics__/graphics/technology/meteor-defence.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "laser",
       "advanced-electronics-2",
       "battery",
       data_util.mod_prefix .. "meteor-point-defence",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
       },
       time = 10
     }
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-space-science-pack",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "deep-space-science-pack",
      }
    },
    icon = "__space-exploration-graphics__/graphics/technology/beaker/space.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-astronomic-4",
      data_util.mod_prefix .. "space-catalogue-energy-4",
      data_util.mod_prefix .. "space-catalogue-biological-4",
      data_util.mod_prefix .. "space-catalogue-material-4",
    },
    unit = {
     count = 2000,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "energy-science-pack",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "energy-science-pack",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/beaker/magenta.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-energy-1"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "fluid-burner-generator",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "fluid-burner-generator", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/fluid-burner-generator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "energy-science-pack"
    },
    unit = {
     count = 50,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       {  data_util.mod_prefix .. "energy-science-pack", 1 },
     }
    },
  },
  
  {
    type = "technology",
    name = data_util.mod_prefix .. "heat-shielding",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "heat-shielding",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/heat-shielding.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "chemical-science-pack",
      "sulfur-processing"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "material-science-pack",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "material-science-pack",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/beaker/orange.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-material-1"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-1.png",
    icon_size = 128,
    order = "a-a-a",
    prerequisites = {
      "automation-2"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack-2",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-plastic", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-2", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-2.png",
    icon_size = 128,
    order = "a-a-b",
    prerequisites = {
      data_util.mod_prefix .. "space-lifesupport-facility",
      data_util.mod_prefix .. "medpack"
    },
    unit = {
     count = 200,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack-3",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-3", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-3.png",
    icon_size = 128,
    order = "a-b",
    prerequisites = {
      data_util.mod_prefix .. "biological-science-pack",
      data_util.mod_prefix .. "medpack-2"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack-4",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-4", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-4.png",
    icon_size = 128,
    order = "a-c",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-biological-4",
      data_util.mod_prefix .. "medpack-3"
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack", 1 },
     }
    },
  },

  {
     name = data_util.mod_prefix .. "plague",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "plague-bomb" },
     },
     icon = "__space-exploration-graphics__/graphics/technology/plague.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "military-3",
       "rocketry",
       data_util.mod_prefix .. "deep-space-science-pack",
     },
     type = "technology",
     unit = {
       count = 1000,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack", 1 },
         { data_util.mod_prefix .. "deep-space-science-pack", 1 },
       },
       time = 30
     }
  },

  {
     name = data_util.mod_prefix .. "railgun",
     effects = {
       { type = "unlock-recipe", recipe = "railgun" },
       { type = "unlock-recipe", recipe = "railgun-dart" }
     },
     icon = "__space-exploration-graphics__/graphics/technology/railgun.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "military-3",
       data_util.mod_prefix .. "space-electromagnetics-laboratory",
       data_util.mod_prefix .. "energy-science-pack",
       data_util.mod_prefix .. "material-science-pack",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "material-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 }
       },
       time = 30
     }
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-fuel-from-water",
    effects = {
     { type = "unlock-recipe",  recipe = data_util.mod_prefix .. "rocket-fuel-from-water-copper", }
    },
    icon = "__base__/graphics/technology/rocket-fuel.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     "rocket-fuel"
    },
    unit = {
     count = 500,
     time = 15,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-landing-pad",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "rocket-landing-pad", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-section-pack", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-section-unpack", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-landing-pad.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "rocket-launch-pad"
    },
    unit = {
     count = 500,
     time = 15,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-launch-pad",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-capsule", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-section", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-cargo-pod", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-fuel-tank", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "rocket-launch-pad", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-launch-pad.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "thruster-suit",
     "electric-engine",
     "battery",
    },
    unit = {
     count = 500,
     time = 15,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-cargo-safety-1",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-cargo-safety.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = { data_util.mod_prefix .. "rocket-launch-pad" },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-cargo-safety-2",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-cargo-safety.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-cargo-safety-1",
      "space-science-pack"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-cargo-safety-3",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-cargo-safety.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-cargo-safety-2",
      data_util.mod_prefix .. "astronomic-science-pack"
    },
    max_level = "infinite",
    unit = {
     count_formula = "2^L",
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
    upgrade = true
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-reusability-1",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-reusability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-landing-pad"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-reusability-2",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-reusability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-reusability-1",
      "space-science-pack"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-reusability-3",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-reusability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-reusability-2",
      data_util.mod_prefix .. "astronomic-science-pack"
    },
    max_level = "20",
    unit = {
     count_formula = "2^L",
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
    upgrade = true
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-survivability-1",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-survivability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-landing-pad"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-survivability-2",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-survivability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-survivability-1",
      "space-science-pack"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-survivability-3",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-survivability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-survivability-2",
      data_util.mod_prefix .. "astronomic-science-pack"
     },
    max_level = "infinite",
    unit = {
     count_formula = "2^L",
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
    upgrade = true
  },

  {
     name = data_util.mod_prefix .. "rtg-equipment",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."rtg-equipment" },
     },
     icon = "__space-exploration-graphics__/graphics/technology/rtg-equipment.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "advanced-electronics-2",
       "low-density-structure",
       "solar-panel-equipment",
       "uranium-processing",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
       },
       time = 30
     }
  },
  {
     name = data_util.mod_prefix .. "rtg-equipment-2",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."rtg-equipment-2" },
     },
     icon = "__space-exploration-graphics__/graphics/technology/rtg-equipment-2.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       data_util.mod_prefix .. "rtg-equipment",
       data_util.mod_prefix .. "space-catalogue-energy-2",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 }
       },
       time = 30
     }
  },


  {
     name = data_util.mod_prefix .. "space-accumulator",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-accumulator" },
     },
     icon = "__space-exploration-graphics__/graphics/technology/accumulator.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "electric-energy-accumulators",
       data_util.mod_prefix .. "superconductive-cable",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "material-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 }
       },
       time = 30
     }
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-astrometrics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-astrometrics-laboratory"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/astrometrics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-assembling",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-assembling-machine" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-assembling.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "space-science-pack",
      "automation-2"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "condenser-turbine",
    effects = {
     { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "condenser-turbine" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/condenser-turbine.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-assembling",
      "nuclear-power"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-biochemical-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-biochemical-laboratory" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-from-wood" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-from-fish" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-crude-oil" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nutrient-gel" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nutrient-gel-methane" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nutrient-vat" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "melting-water-ice" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "melting-methane-ice" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/biochemical-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-decontamination-facility"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-a" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astrometric-analysis-multispectral-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "visible-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "uv-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "infrared-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gravimetric-observation-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-supercomputer-1",
      data_util.mod_prefix .. "space-gravimetrics-laboratory",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astrometric-analysis-multispectral-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "microwave-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "xray-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gravity-wave-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gravimetric-test-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "astronomic-science-pack",
      data_util.mod_prefix .. "space-telescope-xray",
      data_util.mod_prefix .. "space-telescope-microwave",
      data_util.mod_prefix .. "space-laser-laboratory",
    },
    unit = {
     count = 10,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astrometric-analysis-multispectral-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radio-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gammaray-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "negative-pressure-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "darkmatter-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-astronomic-2",
      data_util.mod_prefix .. "space-supercomputer-2",
      data_util.mod_prefix .. "space-telescope-gammaray",
      data_util.mod_prefix .. "space-telescope-radio",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "dark-energy-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "micro-black-hole-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "timespace-anomaly-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "exotic-singularity-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "zero-point-energy-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-astronomic-3",
      data_util.mod_prefix .. "space-supercomputer-3",
      data_util.mod_prefix .. "space-particle-collider",
      data_util.mod_prefix .. "space-electromagnetics-laboratory",
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-b" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-combustion-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-spectral-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biomechanical-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biochemical-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-supercomputer-1",
      data_util.mod_prefix .. "space-growth-facility",
      data_util.mod_prefix .. "space-spectrometry-facility",
      data_util.mod_prefix .. "space-thermodynamics-laboratory",
      data_util.mod_prefix .. "space-mechanical-laboratory",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-genetic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-biochemical-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biomechanical-resistance-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-combustion-resistance-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-specimen" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "biological-science-pack",
    },
    unit = {
     count = 10,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bioelectrics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "decompression-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryogenics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-exposure-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "neural-gel-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "significant-specimen" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-biological-2",
      data_util.mod_prefix .. "space-supercomputer-2",
      data_util.mod_prefix .. "space-radiation-laboratory",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "comparative-genetic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "decompression-resistance-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "neural-anomaly-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-exposure-resistance-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-biological-3",
      data_util.mod_prefix .. "space-supercomputer-3",
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-m" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cold-thermodynamics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "hot-thermodynamics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "tensile-strength-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "compressive-strength-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "plasma-thermodynamics-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-supercomputer-1",
      data_util.mod_prefix .. "space-thermodynamics-laboratory",
      data_util.mod_prefix .. "space-mechanical-laboratory",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-decay-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-spectral-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "conductivity-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "pressure-containment-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "material-science-pack",
      data_util.mod_prefix .. "space-radiation-laboratory",
      data_util.mod_prefix .. "space-spectrometry-facility",
      data_util.mod_prefix .. "space-electromagnetics-laboratory",
    },
    unit = {
     count = 10,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-superconductor" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-material-decay-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-material-spectral-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-shielding-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "superconductivity-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-material-2",
      data_util.mod_prefix .. "space-supercomputer-2",
      data_util.mod_prefix .. "space-material-fabricator",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "plasma-electrodynamics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "fusion-test-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nano-material" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nano-cold-thermodynamics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nano-hot-thermodynamics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nano-compressive-strength-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nano-tensile-strength-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-material-3",
      data_util.mod_prefix .. "space-supercomputer-3",
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-s" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "ion-spectrometry-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "polarisation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "quantum-phenomenon-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "plasma-electrodynamics-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-supercomputer-1",
      data_util.mod_prefix .. "space-laser-laboratory",
      data_util.mod_prefix .. "space-radiation-laboratory",
      data_util.mod_prefix .. "space-spectrometry-facility",
      data_util.mod_prefix .. "space-electromagnetics-laboratory",
      data_util.mod_prefix .. "space-particle-accelerator",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "atomic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "subatomic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "quark-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "fusion-test-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "energy-science-pack",
      data_util.mod_prefix .. "space-particle-collider",
    },
    unit = {
     count = 10,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gammaray-detector" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "entanglement-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "forcefield-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gammaray-test-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lepton-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-energy-2",
      data_util.mod_prefix .. "space-supercomputer-2",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "boson-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "exotic-fission-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "exotic-singularity-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "magnetic-monopole-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-energy-3",
      data_util.mod_prefix .. "space-supercomputer-3",
      data_util.mod_prefix .. "space-material-fabricator",
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-data-card",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "data-storage-substrate" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "data-storage-substrate-cleaned" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "empty-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/data-card.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-decontamination-facility",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-decontamination-facility",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-decontamination-facility" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-water" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "chemical-gel" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-decontamination" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-water-decontamination" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "scrap-decontamination" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "used-lifesupport-canister-cleaning" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/decontamination-facility.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-manufactory"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-electromagnetics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-electromagnetics-laboratory", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "electromagnetic-field-data", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/electromagnetics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-manufactory"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-genetics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-genetics-laboratory" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-bioculture" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bioculture" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "genetic-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/genetics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-biochemical-laboratory"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-gravimetrics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-gravimetrics-laboratory" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/gravimetrics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-astrometrics-laboratory"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-growth-facility",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-growth-facility" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "neural-gel" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "specimen" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "specimen-fish" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "specimen-wood" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lifesupport-canister-specimen" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-methane-to-crude-oil" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/growth-facility.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-genetics-laboratory"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },



  {
    type = "technology",
    name = data_util.mod_prefix .. "space-hypercooling-1",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-hypercooler",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-coolant-cold",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/hypercooler.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-radiator-1"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-hypercooling-2",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-coolant-supercooled",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/hypercooler.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-hypercooling-1"
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-laser-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-laser-laboratory" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/laser-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "laser",
      data_util.mod_prefix .. "space-manufactory"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-lifesupport-facility",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-lifesupport-facility" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "canister" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "empty-lifesupport-canister" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lifesupport-canister-fish" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lifesupport-canister-coal" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/lifesupport-facility.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "heat-shielding",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-manufactory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-manufactory" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-mirror" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-testing-pack" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-manufactory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-assembling"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-material-fabricator",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-material-fabricator" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-material" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/material-fabricator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-particle-collider",
      data_util.mod_prefix .. "material-science-pack"
    },
    unit = {
     count = 250,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-matter-fusion",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-dirty" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-iron" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-copper" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-stone" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-uranium" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/material-fabricator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-material-fabricator",
      data_util.mod_prefix .. "space-catalogue-energy-2"
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-mechanical-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-mechanical-laboratory" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/mechanical-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-manufactory"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-rail",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-rail" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-rail.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "energy-science-pack"
    },
    unit = {
     count = 50,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-blank" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-visible" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-uv" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-infrared" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-hypercooling-1"
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-xray",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-xray" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-xray" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-xray.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope",
      data_util.mod_prefix .. "astronomic-science-pack",
    },
    unit = {
     count = 20,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-microwave",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-microwave" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-microwave" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-microwave.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope",
      data_util.mod_prefix .. "astronomic-science-pack",
    },
    unit = {
     count = 20,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-gammaray",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-gammaray" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gammaray-detector" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-gammaray" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-gammaray.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope-xray"
    },
    unit = {
     count = 50,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-radio",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-radio" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-radio" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-radio.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope-microwave"
    },
    unit = {
     count = 50,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-particle-accelerator",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-particle-accelerator" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "ion-stream" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/particle-accelerator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-plasma-generator",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-particle-collider",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-particle-collider" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "proton-stream" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "particle-stream" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/particle-collider.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-particle-accelerator",
      data_util.mod_prefix .."energy-science-pack",
    },
    unit = {
     count = 10,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .."energy-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "antimatter-production",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "antimatter-stream" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "antimatter-canister" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "empty-antimatter-canister" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/particle-collider.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-space-science-pack",
    },
    unit = {
     count = 1000,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .."astronomic-science-pack", 1 },
       { data_util.mod_prefix .."energy-science-pack", 1 },
       { data_util.mod_prefix .."material-science-pack", 1 },
       { data_util.mod_prefix .."deep-space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "antimatter-engine",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "spaceship-antimatter-engine" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "spaceship-antimatter-booster-tank" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/antimatter-engine.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "spaceship",
      data_util.mod_prefix .. "antimatter-production",
    },
    unit = {
     count = 2000,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .."astronomic-science-pack", 1 },
       { data_util.mod_prefix .."energy-science-pack", 1 },
       { data_util.mod_prefix .."material-science-pack", 1 },
       { data_util.mod_prefix .."deep-space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "teleportation",
    effects = {
    },
    icon = "__space-exploration-graphics__/graphics/technology/teleportation.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-space-science-pack",
    },
    unit = {
     count = 10000,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { "production-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .."astronomic-science-pack", 1 },
       { data_util.mod_prefix .."energy-science-pack", 1 },
       { data_util.mod_prefix .."material-science-pack", 1 },
       { data_util.mod_prefix .."deep-space-science-pack", 1 },
     }
    },
    enabled = false -- if a mod adds teleportation, enable this tech, add it as a prerequiste, and add "se-deep-space-science-pack" as an ingredient
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-plasma-generator",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-plasma-generator" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "plasma-stream" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/plasma-generator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-decontamination-facility",
    },
    unit = {
     count = 100,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-platform-plating",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "space-platform-plating",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-platform-plating.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "material-science-pack"
    },
    unit = {
     count = 50,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-platform-scaffold",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-platform-scaffold",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-pipe",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-pipe-to-ground",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-transport-belt",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-underground-belt",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-splitter",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-platform-scaffold.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-launch-pad"
    },
    unit = {
     count = 500,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },



    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiation-laboratory",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-radiation-laboratory" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiation-laboratory.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-manufactory",
        "uranium-processing",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },



    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiator-1",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "space-coolant",
        },
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "space-radiator",
        },
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "radiating-space-coolant-normal",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiator-1.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-decontamination-facility"
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiator-2",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "radiating-space-coolant-slow",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiator-2.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-radiator-1"
      },
      unit = {
       count = 500,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiator-3",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "radiating-space-coolant-veryslow",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiator-3.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-radiator-2",
        data_util.mod_prefix .. "energy-science-pack"
      },
      unit = {
       count = 1000,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-recycling-facility",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-recycling-facility" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "scrap-recycling" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "broken-data-scrapping" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "empty-barrel-scrapping" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "empty-barrel-reprocessing" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-capsule-scrapping" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "cargo-pod-scrapping" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/recycling-facility.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "advanced-material-processing-2",
        "space-science-pack",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    -- Space Science
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-science-lab",
      effects = {
       {
         type = "unlock-recipe",
         recipe = data_util.mod_prefix .. "space-science-lab",
       },
      },
      icon = "__space-exploration-graphics__/graphics/technology/space-science-lab.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-platform-scaffold",
      },
      unit = {
       count = 500,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
       }
      },
    },


    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-ab",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-ab" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-ab.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "astronomic-science-pack",
        data_util.mod_prefix .. "biological-science-pack",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-as",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-as" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-as.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "astronomic-science-pack",
        data_util.mod_prefix .. "energy-science-pack",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-am",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-am" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-am.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "astronomic-science-pack",
        data_util.mod_prefix .. "material-science-pack",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack", 1 },
         { data_util.mod_prefix .."material-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-bm",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-bm" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-bm.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "biological-science-pack",
        data_util.mod_prefix .. "material-science-pack",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack", 1 },
         { data_util.mod_prefix .."material-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-sb",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-sb" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-sb.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "biological-science-pack",
        data_util.mod_prefix .. "energy-science-pack",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-sm",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-sm" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-sm.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "energy-science-pack",
        data_util.mod_prefix .. "material-science-pack",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack", 1 },
         { data_util.mod_prefix .."material-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-abm",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-abm" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-abm.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-ab",
        data_util.mod_prefix .. "space-simulation-am",
        data_util.mod_prefix .. "space-simulation-bm",
      },
      unit = {
       count = 50,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack", 1 },
         { data_util.mod_prefix .."material-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-asb",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-asb" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-asb.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-ab",
        data_util.mod_prefix .. "space-simulation-as",
        data_util.mod_prefix .. "space-simulation-sb",
      },
      unit = {
       count = 50,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-asm",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-asm" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-asm.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-am",
        data_util.mod_prefix .. "space-simulation-as",
        data_util.mod_prefix .. "space-simulation-sm",
      },
      unit = {
       count = 50,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack", 1 },
         { data_util.mod_prefix .."material-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-sbm",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-sbm" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-sbm.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-bm",
        data_util.mod_prefix .. "space-simulation-sb",
        data_util.mod_prefix .. "space-simulation-sm",
      },
      unit = {
       count = 50,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack", 1 },
         { data_util.mod_prefix .."material-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-asbm",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-asbm" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/catalogue/simulation-asbm.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-abm",
        data_util.mod_prefix .. "space-simulation-asb",
        data_util.mod_prefix .. "space-simulation-asm",
        data_util.mod_prefix .. "space-simulation-sbm",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack", 1 },
         { data_util.mod_prefix .."material-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-solar-panel",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-solar-panel" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/solar-panel.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "solar-energy",
        data_util.mod_prefix .. "energy-science-pack",
      },
      unit = {
       count = 10,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-solar-panel-adv",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-solar-panel-2" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/solar-panel-2.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-solar-panel",
        data_util.mod_prefix .. "deep-space-science-pack",
      },
      unit = {
       count = 500,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 },
         { data_util.mod_prefix .. "material-science-pack", 1 },
         { data_util.mod_prefix .. "deep-space-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-spectrometry-facility",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-spectrometry-facility" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/spectrometry-facility.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-manufactory",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },


    {
      type = "technology",
      name = data_util.mod_prefix .. "space-supercomputer-1",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-supercomputer-1" },
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "formatting-1" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-1.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-data-card",
        data_util.mod_prefix .. "space-hypercooling-1",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-supercomputer-2",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-supercomputer-2" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "formatting-2" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-2.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-supercomputer-1",
        data_util.mod_prefix .. "energy-science-pack",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-supercomputer-3",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-supercomputer-3" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "formatting-3" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-3.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-supercomputer-2",
        data_util.mod_prefix .. "superconductive-cable",
        data_util.mod_prefix .. "space-catalogue-biological-3",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack", 1 },
       }
      },
    },


    {
      type = "technology",
      name = data_util.mod_prefix .. "space-thermodynamics-laboratory",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-thermodynamics-laboratory" },
        --{ type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-coolant" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "thermodynamics-coal" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/thermodynamics-laboratory.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-plasma-generator",
      },
      unit = {
       count = 100,
       time = 10,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    {
       name = data_util.mod_prefix .. "spaceship",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-console" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-floor" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-wall" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-gate" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-rocket-engine" },
         --{ type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-rocket-engine-burn" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-rocket-booster-tank" },
         { type = "nothing", effect_description={"spaceship-integrity300"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-astronomic-3",
         data_util.mod_prefix .. "space-platform-plating",
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 }
         },
         time = 30
       }
    },

    {
       name = data_util.mod_prefix .. "spaceship-integrity-1",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-material-1",
         data_util.mod_prefix .. "spaceship",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-2",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-material-2",
         data_util.mod_prefix .. "spaceship-integrity-1",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-3",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-material-3",
         data_util.mod_prefix .. "spaceship-integrity-2",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-4",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-energy-1",
         data_util.mod_prefix .. "spaceship-integrity-3",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-5",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-energy-2",
         data_util.mod_prefix .. "spaceship-integrity-4",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 },
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-6",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-energy-3",
         data_util.mod_prefix .. "spaceship-integrity-5",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 },
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-7",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-astronomic-4",
         data_util.mod_prefix .. "spaceship-integrity-6",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 },
         },
         time = 30
       }
    },
    --[[{
       name = data_util.mod_prefix .. "spaceship-integrity-8",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity100"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-material-4",
         data_util.mod_prefix .. "space-catalogue-energy-4",
         data_util.mod_prefix .. "spaceship-integrity-7",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 }
         },
         time = 30
       }
    },]]--
    {
       name = data_util.mod_prefix .. "factory-spaceship-1",
       effects = {
         { type = "nothing", effect_description={"spaceship-integrity500"} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "deep-space-science-pack",
         data_util.mod_prefix .. "spaceship-integrity-7",
       },
       max_level = "infinite",
       type = "technology",
       unit = {
         count_formula = "2^L*1000",
         time = 60,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack", 1 }
         },
       },
       upgrade = false
    },

    {
       name = data_util.mod_prefix .. "superconductive-cable",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "superconductive-cable" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "magnetic-canister", },
         { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "plasma-canister" },
         { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "plasma-canister-empty" },
       },
       icon = "__space-exploration-graphics__/graphics/technology/superconductive-cable.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "space-catalogue-energy-3",
         data_util.mod_prefix .. "space-catalogue-material-3",
         data_util.mod_prefix .. "energy-science-pack",
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "tesla-gun",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "tesla-gun" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "tesla-ammo" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/tesla-gun.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         "military-3",
         data_util.mod_prefix .. "superconductive-cable",
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-orange.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         "glass-processing",
         "modular-armor",
         "rocket-silo",
         data_util.mod_prefix .. "space-lifesupport-facility",
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit-2",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit-2" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-red.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "thruster-suit",
         data_util.mod_prefix .. "material-science-pack",
       },
       type = "technology",
       unit = {
         count = 50,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit-3",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit-3" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-blue.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "astronomic-science-pack",
         data_util.mod_prefix .. "biological-science-pack",
         data_util.mod_prefix .. "superconductive-cable",
         data_util.mod_prefix .. "thruster-suit-2",
       },
       type = "technology",
       unit = {
         count = 300,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "biological-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 },
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit-4",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit-4" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-black.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "antimatter-production",
         data_util.mod_prefix .. "thruster-suit-3",
       },
       type = "technology",
       unit = {
         count = 500,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "space-science-pack", 1 },
           { data_util.mod_prefix .. "biological-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack", 1 },
           { data_util.mod_prefix .. "energy-science-pack", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack", 1 }
         },
         time = 30
       }
    },
})

data_util.tech_add_prerequisites("energy-shield-mk5-equipment", { data_util.mod_prefix .. "space-catalogue-energy-4"})
data_util.tech_add_prerequisites("energy-shield-mk5-equipment", { data_util.mod_prefix .. "space-catalogue-material-4"})
data_util.tech_add_prerequisites("energy-shield-mk6-equipment", { data_util.mod_prefix .. "antimatter-production"})
