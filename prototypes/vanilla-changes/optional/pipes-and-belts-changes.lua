-- -- -- Vanilla pipes and belts modification

if krastorio.general.getSafeSettingValue("kr-pipes-and-belts-changes") then
  -- -- Pipes
  -- TODO: Only override max_underground_distance
  data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box = {
    volume = 100,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {
      { direction = defines.direction.north, position = { 0, 0 } },
      {
        direction = defines.direction.south,
        position = { 0, 0 },
        connection_type = "underground",
        max_underground_distance = 20,
      },
    },
  }

  -- -- Belts
  data.raw["underground-belt"]["fast-underground-belt"].max_distance = 10
  data.raw["underground-belt"]["express-underground-belt"].max_distance = 20
end
