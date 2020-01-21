-- -- -- Optional vanilla updates
-- This script update the base game objects with some adjustment

local modifications =
{	
	"train-changes",   		-- Modify trains
	"vehicles-changes",		-- Modify vehicles
	"radar-changes",    	-- Modify vanilla radar
	"fuels-changes"			-- Modify vanilla fuels
}

-- Application of the modifications
for _, modification_name in pairs(modifications) do 
	require("optional/" .. modification_name)
end
