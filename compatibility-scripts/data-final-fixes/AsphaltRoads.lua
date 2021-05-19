if mods["AsphaltRoads"] then
  local tile_filters = data.raw["selection-tool"]["kr-jackhammer"].tile_filters
  local alt_tile_filters = data.raw["selection-tool"]["kr-jackhammer"].alt_tile_filters

  -- Asphalt roads tiles divided in list for the option that enabled them
  local asphalt_roads_tiles_per_options = {
    ["AR-enable-basic-marking-tiles"] = {
      "Arci-asphalt",
      "Arci-asphalt-zebra-crossing-horizontal",
      "Arci-asphalt-zebra-crossing-vertical",
      "Arci-asphalt-triangle-white-up",
      "Arci-asphalt-triangle-white-left",
      "Arci-asphalt-triangle-white-down",
      "Arci-asphalt-triangle-white-right",
      "Arci-asphalt-hazard-white-left",
      "Arci-asphalt-hazard-white-right",
    },
    ["AR-enable-colored-hazard-marking"] = {
      "Arci-asphalt-hazard-yellow-left",
      "Arci-asphalt-hazard-yellow-right",
      "Arci-asphalt-hazard-red-left",
      "Arci-asphalt-hazard-red-right",
      "Arci-asphalt-hazard-blue-left",
      "Arci-asphalt-hazard-blue-right",
      "Arci-asphalt-hazard-green-left",
      "Arci-asphalt-hazard-green-right",
    },
    ["AR-enable-white-single-lines"] = {
      "Arci-marking-white-straight-vertical",
      "Arci-marking-white-diagonal-right",
      "Arci-marking-white-straight-horizontal",
      "Arci-marking-white-diagonal-left",
      "Arci-marking-white-right-turn-left",
      "Arci-marking-white-left-turn-left",
      "Arci-marking-white-right-turn-down",
      "Arci-marking-white-left-turn-down",
      "Arci-marking-white-right-turn-up",
      "Arci-marking-white-left-turn-up",
      "Arci-marking-white-left-turn-right",
      "Arci-marking-white-right-turn-right",
    },
    ["AR-enable-yellow-single-lines"] = {
      "Arci-marking-yellow-straight-vertical",
      "Arci-marking-yellow-diagonal-right",
      "Arci-marking-yellow-straight-horizontal",
      "Arci-marking-yellow-diagonal-left",
      "Arci-marking-yellow-right-turn-left",
      "Arci-marking-yellow-left-turn-left",
      "Arci-marking-yellow-right-turn-down",
      "Arci-marking-yellow-left-turn-down",
      "Arci-marking-yellow-right-turn-up",
      "Arci-marking-yellow-left-turn-up",
      "Arci-marking-yellow-left-turn-right",
      "Arci-marking-yellow-right-turn-right",
    },
    ["AR-enable-white-double-lines"] = {
      "Arci-marking-white-dl-straight-vertical",
      "Arci-marking-white-dl-diagonal-right",
      "Arci-marking-white-dl-straight-horizontal",
      "Arci-marking-white-dl-diagonal-left",
      "Arci-marking-white-dl-right-turn-left",
      "Arci-marking-white-dl-left-turn-left",
      "Arci-marking-white-dl-right-turn-down",
      "Arci-marking-white-dl-left-turn-down",
      "Arci-marking-white-dl-right-turn-up",
      "Arci-marking-white-dl-left-turn-up",
      "Arci-marking-white-dl-left-turn-right",
      "Arci-marking-white-dl-right-turn-right",
    },
    ["AR-enable-yellow-double-lines"] = {
      "Arci-marking-yellow-dl-straight-vertical",
      "Arci-marking-yellow-dl-diagonal-right",
      "Arci-marking-yellow-dl-straight-horizontal",
      "Arci-marking-yellow-dl-diagonal-left",
      "Arci-marking-yellow-dl-right-turn-left",
      "Arci-marking-yellow-dl-left-turn-left",
      "Arci-marking-yellow-dl-right-turn-down",
      "Arci-marking-yellow-dl-left-turn-down",
      "Arci-marking-yellow-dl-right-turn-up",
      "Arci-marking-yellow-dl-left-turn-up",
      "Arci-marking-yellow-dl-left-turn-right",
      "Arci-marking-yellow-dl-right-turn-right",
    },
  }

  -- Iterate each list
  for option_name, tiles in pairs(asphalt_roads_tiles_per_options) do
    if krastorio.general.getSafeSettingValue(option_name) then -- if the option is "true"
      for _, tile in pairs(tiles) do -- add each tiles
        table.insert(tile_filters, tile)
        table.insert(alt_tile_filters, tile)
      end
    end
  end
end
