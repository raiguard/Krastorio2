-- -- -- Mod assertions
-- This script will check if is loaded a know mods combination,
-- that make incompatible situation where is not possible load correclty and stop it before loading
-- can be suppressed by another mod setting suppress_krastorio_assertions = true
if suppress_krastorio_assertions ~= true then
  krastorio_assertions = {
    "incompatible mod combination",
  }

  -- -- Assertion in case user add too much tiles mods
  local tile_error = false

  local creep = data.raw.tile["kr-creep"]
  local reinforced_plate_white = data.raw.tile["kr-white-reinforced-plate"]
  local reinforced_plate_black = data.raw.tile["kr-black-reinforced-plate"]

  if not creep or not reinforced_plate_white or not reinforced_plate_black then
    tile_error = true
  end

  if krastorio.general.getSafeSettingValue("kr-kl-stuff") then
    local reinforced_plate_white_l = data.raw.tile["kr-white-reinforced-plate-l"]
    local reinforced_plate_black_l = data.raw.tile["kr-black-reinforced-plate-l"]

    if not reinforced_plate_white_l or not reinforced_plate_black_l then
      tile_error = true
    end
  end

  if tile_error then
    krastorio.general.printWarningMessage(
      krastorio_assertions[1],
      "Warning! Have been installed too much mods that add tiles.\nDue the Factorio engine limitation, Factorio can't load more than 255 different tile types. One or more mods, that add tiles to the game, must be disabled.\n(This is not a bug, it's a fact, don't report this to mod developers)."
    )
  end
end
