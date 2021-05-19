-- -- -- Mod assertions
-- This script will check if is loaded a know mods combination,
-- that make incompatible situation where is not possible load correclty and stop it before loading
-- can be suppressed by another mod setting suppress_krastorio_assertions = true
if suppress_krastorio_assertions ~= true then
  krastorio_assertions = {
    "incompatible mod combination",
  }

  -- Can't be used IndustrialRevolution and aai-industry at the same time with Krastorio
  if mods["IndustrialRevolution"] and mods["aai-industry"] then
    krastorio.general.printWarningMessage(
      krastorio_assertions[1],
      "Industrial Revolution and AAI Industry can't be used at the same time with Krastorio 2!\n(This is not a bug, it's a fact, don't report this to mod developers)."
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
    krastorio.general.printWarningMessage(
      krastorio_assertions[1],
      "Any Bob's mod with any Angel's mod can't be used with Krastorio 2!\n(This is not a bug, it's a fact, don't report this to mod developers)."
    )
  end
end
