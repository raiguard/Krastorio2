if mods["LightedPolesPlus"] and krastorio.general.getSafeSettingValue("kr-electric-poles-changes") then
  data.raw["electric-pole"]["lighted-small-electric-pole"].maximum_wire_distance = 7.75

  data.raw["electric-pole"]["lighted-medium-electric-pole"].maximum_wire_distance = 9.75
  data.raw["electric-pole"]["lighted-medium-electric-pole"].supply_area_distance = 4.5

  data.raw["electric-pole"]["lighted-substation"].maximum_wire_distance = 20.25
  data.raw["electric-pole"]["lighted-substation"].supply_area_distance = 10

  data.raw["electric-pole"]["lighted-big-electric-pole"].maximum_wire_distance = 32.25

  if krastorio.general.getSafeSettingValue("kr-substation-mk2") then
    -- Unhide lighted mk2
    data.raw.item["lighted-kr-substation-mk2"].flags = nil
    -- Fix fast_replaceable_group
    data.raw["electric-pole"]["lighted-substation"].fast_replaceable_group = "substation"
    -- Remove specific upgrade path
    data.raw["electric-pole"]["substation"].next_upgrade = nil
    data.raw["electric-pole"]["lighted-substation"].next_upgrade = nil
  else
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies("lighted-kr-substation-mk2")
  end
end
