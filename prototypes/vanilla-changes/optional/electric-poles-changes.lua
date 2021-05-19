-- Rebalancing of radar
if krastorio.general.getSafeSettingValue("kr-electric-poles-changes") then
  data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = 7.75

  data.raw["electric-pole"]["medium-electric-pole"].maximum_wire_distance = 9.75
  data.raw["electric-pole"]["medium-electric-pole"].supply_area_distance = 4.5

  data.raw["electric-pole"]["substation"].maximum_wire_distance = 20.25
  data.raw["electric-pole"]["substation"].supply_area_distance = 10

  data.raw["electric-pole"]["big-electric-pole"].maximum_wire_distance = 32.25
end
