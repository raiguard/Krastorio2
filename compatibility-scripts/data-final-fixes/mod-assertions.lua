-- -- -- Mod assertions
-- This script will check if is loaded a know mods combination,
-- that make incompatible situation where is not possible load correclty and stop it before loading 

krastorio_assertions =
{
	"incompatible mod combination"
}

-- Assertion in case user add too much tiles mods
local creep                  = data.raw.tile["kr-creep"]
local reinforced_plate_white = data.raw.tile["kr-white-reinforced-plate"]
local reinforced_plate_black = data.raw.tile["kr-black-reinforced-plate"]

if not creep or not reinforced_plate_white or not reinforced_plate_black then
	krastorio.general.printWarningMessage(krastorio_assertions[1], "Warning! Have been installed too much mods that add tiles.\nDue the Factorio engine limitation, Factorio can't load more than 255 different tile types. One or more mod, that add tiles to the game, must be disabled.")
end