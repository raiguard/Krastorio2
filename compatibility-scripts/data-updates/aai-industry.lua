if mods["aai-industry"] and krastorio.general.getSafeSettingValue("aai-wide-drill") then
  -- Based on what Space Exploration does with the AAI Industry
  -- and Krastorio mining drills, but without the SE items:
  krastorio.technologies.addPrerequisite("area-mining-drill", "kr-electric-mining-drill-mk2")
  krastorio.recipes.convertIngredient("area-mining-drill", "electric-mining-drill", "kr-electric-mining-drill-mk2")
  data.raw.recipe["area-mining-drill"].order = "a[items]-c[electric-mining-drill-mk2]-b"
  data.raw.item["area-mining-drill"].order = "a[items]-c[electric-mining-drill-mk2]-b"

  krastorio.technologies.convertPrerequisite("kr-electric-mining-drill-mk3", "kr-electric-mining-drill-mk2", "area-mining-drill")
  krastorio.recipes.convertIngredient("kr-electric-mining-drill-mk3", "area-mining-drill", "kr-electric-mining-drill-mk2")

  local kr_mining_drill_mk3 = data.raw["mining-drill"]["kr-electric-mining-drill-mk3"]
  kr_mining_drill_mk3.module_specification.module_slots = 5
  kr_mining_drill_mk3.energy_usage = "500kW"
  kr_mining_drill_mk3.mining_speed = 1.2
end
