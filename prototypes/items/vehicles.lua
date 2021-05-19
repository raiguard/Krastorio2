data:extend({
  {
    type = "item-with-entity-data",
    name = "kr-nuclear-locomotive",
    icon = kr_vehicles_icons_path .. "nuclear-locomotive.png",
    icon_size = 64,
    subgroup = "transport",
    order = "a[train-system]-f[nuclear-locomotive.png]",
    place_result = "kr-nuclear-locomotive",
    stack_size = 5,
  },
  {
    type = "item-with-entity-data",
    name = "kr-advanced-tank",
    icon = kr_vehicles_icons_path .. "advanced-tank.png",
    icon_size = 64,
    subgroup = "transport",
    order = "b[personal-transport]-b[z-advanced-tank]",
    place_result = "kr-advanced-tank",
    stack_size = 1,
  },
})
