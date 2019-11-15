-- -- -- Mandatory vanilla updates
-- This script update the base game objects with some adjustment

local modifications =
{	
	"improve-inserters",           -- Improve inserters, new functions	
	"rebalance-nuclear-power",     -- Rebalance nuclear power	
	"rebalance-power-poles-range", -- Rebalance power poles range	
	"recipes-changes",             -- All modification to vanilla recipes	
	"icons-changes",               -- Modify aspect of vanilla items (like science pack icons..)
	"vanilla-lab-changes",         -- Modify stat and accepted science packs of vanilla lab
	"renaming-vanillas"            -- Localization changes to vanilla objects
}

-- Application of the modifications
for _, modification_name in pairs(modifications) do 
	require("mandatory/" .. modification_name)
end
