-- -- -- Optional vanilla updates
-- This script update the base game objects with some adjustment

local modifications = {
  "long-hands", -- Long hands, obviously
  "bonus-inventory", -- Bonus inventory space
  "electric-poles-changes", -- Slightly modify electric poles
  "train-changes", -- Modify trains
  "vehicles-changes", -- Modify vehicles
  "radar-changes", -- Modify vanilla radar
  "fuels-changes", -- Modify vanilla fuels
  "vehicles-minable-changes", -- Turn off vehicles minable
  "stack-size-changes", -- Increase stacks size
  "damage-and-ammo", -- Damage and ammo rebalance
  "infinite-technology", -- Remove or keep infinite technologies
  "pipes-and-belts-changes", -- Vanilla pipes and belts modification
  "more-realistic-weapon", -- Add to bullets more realistic range, tragectory, and drop of bullet speed during flight
  "cargo-wagon-bonus", -- Cargo wagon capacity bonus
  "finite-oil", -- Makes oil is finite
  "substation-mk2", -- Adds Substation-mk2
}

-- Application of the modifications
for _, modification_name in pairs(modifications) do
  require("optional/" .. modification_name)
end
