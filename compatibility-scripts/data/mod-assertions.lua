-- -- -- Mod assertions
-- This script will check if is loaded a know mods combination,
-- that make incompatible situation where is not possible load correclty and stop it before loading 

krastorio_assertions =
{
	"incompatible mod combination"
}

-- Can't be used IndustrialRevolution and aai-industry at the same time with Krastorio
if mods["IndustrialRevolution"] and mods["aai-industry"] then
	krastorio.general.printWarningMessage(krastorio_assertions[1], "Industrial Revolution and AAI Industry can't be used at the same time with Krastorio 2!")
end