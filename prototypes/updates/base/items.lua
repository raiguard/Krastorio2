local flib_table = require("__flib__.table")

table.insert(
  flib_table.get_or_insert(data.raw.armor["modular-armor"], "resistances", {}),
  { type = "radioactive", decrease = 2, percent = 15 }
)
table.insert(
  flib_table.get_or_insert(data.raw.armor["power-armor"], "resistances", {}),
  { type = "radioactive", decrease = 3, percent = 30 }
)
table.insert(
  flib_table.get_or_insert(data.raw.armor["power-armor-mk2"], "resistances", {}),
  { type = "radioactive", decrease = 4, percent = 45 }
)

-- TODO: Redo equipment subgrouping

data.raw.capsule["discharge-defense-remote"].order = "f[active-defense-equipment]-b[discharge-defense-remote]"
data.raw.capsule["discharge-defense-remote"].subgroup = "equipment"

data.raw.item["battery-equipment"].order = "b1[battery]-b1[battery-equipment]"
data.raw.item["battery-equipment"].subgroup = "equipment"

data.raw.item["battery-mk2-equipment"].order = "b2[battery]-b3[battery-equipment]"
data.raw.item["battery-mk2-equipment"].subgroup = "equipment"

data.raw.item["discharge-defense-equipment"].order = "f[active-defense-equipment]-a[discharge-defense-equipment]"
data.raw.item["discharge-defense-equipment"].subgroup = "equipment"

data.raw.item["energy-shield-equipment"].subgroup = "equipment"
data.raw.item["energy-shield-equipment"].order = "b[shield]-a[energy-shield-equipment-mk1]"

data.raw.item["energy-shield-mk2-equipment"].subgroup = "equipment"
data.raw.item["energy-shield-mk2-equipment"].order = "b[shield]-b[energy-shield-equipment-mk2]"

data.raw.item["fission-reactor-equipment"].order = "a2[energy-source]-a5[portable-nuclear-core]"
data.raw.item["fission-reactor-equipment"].subgroup = "equipment"
data.raw.item["fission-reactor-equipment"].pictures = {
  layers = {
    {
      size = 64,
      filename = "__Krastorio2Assets__/icons/equipment/fission-reactor-equipment.png",
      scale = 0.25,
      mipmap_count = 4,
    },
    {
      draw_as_light = true,
      flags = { "light" },
      size = 64,
      filename = "__Krastorio2Assets__/icons/equipment/fission-reactor-equipment-light.png",
      scale = 0.25,
      mipmap_count = 4,
    },
  },
}

data.raw.item["exoskeleton-equipment"].subgroup = "character-equipment"
data.raw.item["exoskeleton-equipment"].order = "e[exoskeleton]-a1[exoskeleton-equipment]"

data.raw.item["night-vision-equipment"].subgroup = "character-equipment"
data.raw.item["night-vision-equipment"].order = "f[night-vision]-a1[night-vision-equipment]"

data.raw.item["personal-laser-defense-equipment"].localised_description =
  { "equipment-description.personal-sniper-laser-defense-mk1-equipment" }
data.raw.item["personal-laser-defense-equipment"].localised_name =
  { "equipment-name.personal-sniper-laser-defense-mk1-equipment" }
data.raw.item["personal-laser-defense-equipment"].order = "d[active-defense]-b1[personal-laser-defense-mk1-equipment]"
data.raw.item["personal-laser-defense-equipment"].subgroup = "equipment"

data.raw.item["solar-panel-equipment"].order = "a[energy-source]-a1[solar-panel]"
data.raw.item["solar-panel-equipment"].subgroup = "equipment"
