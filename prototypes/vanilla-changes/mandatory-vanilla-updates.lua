-- High priority
require("mandatory.technologies-changes") -- Modifications to vanilla technologies
require("mandatory.apply-vanilla-technologies-tag") -- Apply a special tag to all vanilla technologies to recognize them
-- Low priority
require("mandatory.entities-changes") -- Entities/prototypes definition modifications
require("mandatory.equipments-changes") -- Add properties or modify stat of equipments and armors
require("mandatory.icons-changes") -- Modify aspect of vanilla items (like science pack icons..)
require("mandatory.improve-inserters") -- Improve inserters, new functions
require("mandatory.items-changes") -- Modify vanilla items
require("mandatory.items-sorting") -- Change some items sorting for match new items
require("mandatory.rebalance-nuclear-power") -- Rebalance nuclear power
require("mandatory.recipes-changes") -- All modification to vanilla recipes
require("mandatory.renaming-vanillas") -- Localization changes to vanilla objects
require("mandatory.resources-changes") -- Resources changes
require("mandatory.overmodule-fix") -- Multiply smelting recipes stat for fix overmodule bug
require("mandatory.spawner-changes") -- Modify spawners sprite
require("mandatory.vanilla-lab-changes") -- Modify stat and accepted science packs of vanilla lab
require("mandatory.fluids-changes") -- Add some new properties to vanilla fluids
require("mandatory.next-upgrades") -- Setup entity upgrates
require("mandatory.damage-technologies-bonuses") -- Rebalance the damage donus from technologies
require("mandatory.vanilla-energy-changes") -- Rebalance accumulators ans panels
require("mandatory.vanilla-robots-changes") -- Rebalance vanilla drones
require("mandatory.electrify-offshore-pump") -- Add energy source to offshore-pump
require("mandatory.removing-impossible-achievements") -- Remove impossible vanilla achievements
require("mandatory.roboport-variations") -- Generate roboport variations for roboport states

-- TODO: Reorganize these
--- @type data.MinableProperties
local minable = {
  mining_time = 2,
  results = {
    { type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.70 },
    { type = "item", name = "copper-cable", amount_min = 0, amount_max = 2, probability = 0.40 },
    { type = "item", name = "iron-gear-wheel", amount_min = 0, amount_max = 2, probability = 0.40 },
    { type = "item", name = "electronic-circuit", amount_min = 0, amount_max = 2, probability = 0.20 },
    { type = "item", name = "kr-sentinel", amount_min = 0, amount_max = 2, probability = 0.10 },
  },
  mining = "shell-particle",
}
data.raw.container["crash-site-chest-1"].minable = minable
data.raw.container["crash-site-chest-2"].minable = minable
