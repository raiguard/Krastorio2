-- -- -- Mandatory vanilla updates
-- This script update the base game objects with some adjustment

-- Modifications must be executed in the priority order
local modifications = {
  -- High priority
  "technologies-changes", -- Modifications to vanilla technologies
  "apply-vanilla-technologies-tag", -- Apply a special tag to all vanilla technologies to recognize them
  -- Low priority
  "entities-changes", -- Entities/prototypes definition modifications
  "equipments-changes", -- Add properties or modify stat of equipments and armors
  "icons-changes", -- Modify aspect of vanilla items (like science pack icons..)
  "improve-inserters", -- Improve inserters, new functions
  "items-changes", -- Modify vanilla items
  "items-sorting", -- Change some items sorting for match new items
  "rebalance-nuclear-power", -- Rebalance nuclear power
  "recipes-changes", -- All modification to vanilla recipes
  "renaming-vanillas", -- Localization changes to vanilla objects
  "resources-changes", -- Resources changes
  "overmodule-fix", -- Multiply smelting recipes stat for fix overmodule bug
  "spawner-changes", -- Modify spawners sprite
  "vanilla-lab-changes", -- Modify stat and accepted science packs of vanilla lab
  "fluids-changes", -- Add some new properties to vanilla fluids
  "next-upgrades", -- Setup entity upgrates
  "roboport-variations", -- Generate roboport variations for roboport states
  "damage-technologies-bonuses", -- Rebalance the damage donus from technologies
  "vanilla-energy-changes", -- Rebalance accumulators ans panels
  "vanilla-robots-changes", -- Rebalance vanilla drones
  "electrify-offshore-pump", -- Add energy source to offshore-pump
  "removing-impossible-achievements", -- Remove impossible vanilla achievements
}

-- Application of the modifications
for _, modification_name in pairs(modifications) do
  require("mandatory/" .. modification_name)
end
