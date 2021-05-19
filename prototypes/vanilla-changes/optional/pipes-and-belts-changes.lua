-- -- -- Vanilla pipes and belts modification

if krastorio.general.getSafeSettingValue("kr-pipes-and-belts-changes") then
  -- -- Pipes
  data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box = {
    base_area = 1,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {
      { position = { 0, -1 } },
      {
        position = { 0, 1 },
        max_underground_distance = 20,
      },
    },
  }

  -- -- Belts
  data.raw["underground-belt"]["fast-underground-belt"].max_distance = 10
  data.raw["underground-belt"]["express-underground-belt"].max_distance = 20
end
