-- -- -- Mandatory vanilla updates
-- This script update the base game objects with some adjustment

local modifications =
{	
	"improve-inserters", -- Improve inserters, new functions	
	"rebalance-nuclear-power", -- Rebalance nuclear power	
	"rebalance-power-poles-range", -- Rebalance power poles range	
	"recipes-changes", -- All modification to vanilla recipes	
	"science-pack-icons", -- Modify aspect of vanilla science pack icons
	"vanilla-lab-changes" -- Modify stat and accepted science packs of vanilla lab
}

for _, modification_name in pairs(modifications) do 
	require("mandatory/" .. modification_name)
end
