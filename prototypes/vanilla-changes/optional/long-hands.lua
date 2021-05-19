-- -- -- Long hands
local distant_reach_multiplier = krastorio.general.getSafeSettingValue("kr-long-hands")

if distant_reach_multiplier and distant_reach_multiplier > 1 then
  data.raw["character"]["character"].build_distance = data.raw["character"]["character"].build_distance
    * distant_reach_multiplier
  data.raw["character"]["character"].reach_distance = data.raw["character"]["character"].reach_distance
    * distant_reach_multiplier
  data.raw["character"]["character"].reach_resource_distance = data.raw["character"]["character"].reach_resource_distance
    + math.min(4, distant_reach_multiplier)
end
