-- -- -- Mod assertions
-- This script will check if is loaded a know mods combination,
-- that make incompatible situation where is not possible load correclty and stop it before loading
-- can be suppressed by another mod setting suppress_krastorio_assertions = true
if suppress_krastorio_assertions ~= true then
  -- Can't be used IndustrialRevolution and aai-industry at the same time with Krastorio
  if mods["IndustrialRevolution"] and mods["aai-industry"] then
    error(
      "\n\nINCOMPATIBLE MOD COMBINATION:\nKrastorio 2, Industrial Revolution, and AAI Industry may not be used all at once. This is not a bug, do not report it!\n"
    )
  end

  local any_bob = mods["boblibrary"]

  local any_angel = mods["angelsaddons-cab"]
    or mods["angelsaddons-crawlertrain"]
    or mods["angelsaddons-petrotrain"]
    or mods["angelsaddons-smeltingtrain"]
    or mods["angelsbioprocessing"]
    or mods["angelsindustries"]
    or mods["angelspetrochem"]
    or mods["angelsrefining"]
    or mods["angelssmelting"]

  if any_bob and any_angel then
    error(
      "\n\nINCOMPATIBLE MOD COMBINATION:\nKrastorio 2, Bob's mods, and Angel's mods  may not be used all at once. This is not a bug, do not report it!\n"
    )
  end
end
