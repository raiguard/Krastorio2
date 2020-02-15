-- -- -- Long hands
if krastorio.general.getSafeSettingValue("kr-long-hands") then

   data.raw["character"]["character"].build_distance          = 60
   data.raw["character"]["character"].reach_distance          = 60
   data.raw["character"]["character"].reach_resource_distance = 3
   
end
