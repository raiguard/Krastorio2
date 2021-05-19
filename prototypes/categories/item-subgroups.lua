data:extend({

  -- Radars and rocket
  {
    type = "item-subgroup",
    name = "vanilla-turrets",
    group = "combat",
    order = "g1",
  },
  {
    type = "item-subgroup",
    name = "railgun-turret",
    group = "combat",
    order = "g2",
  },
  {
    type = "item-subgroup",
    name = "rocket-turret",
    group = "combat",
    order = "g3",
  },
  {
    type = "item-subgroup",
    name = "radars-and-rockets",
    group = "combat",
    order = "g4",
  },

  -- Containers and logistics containers
  {
    type = "item-subgroup",
    name = "kr-logistics-1",
    group = "logistics",
    order = "a1",
  },
  {
    type = "item-subgroup",
    name = "kr-logistics-2",
    group = "logistics",
    order = "a2",
  },
  {
    type = "item-subgroup",
    name = "kr-logistics-3",
    group = "logistics",
    order = "a3",
  },
  {
    type = "item-subgroup",
    name = "kr-logistics-4", -- for compatibility
    group = "logistics",
    order = "a4",
  },

  -- Decorations

  {
    type = "item-subgroup",
    name = "kr-decorations-1",
    group = "intermediate-products",
    order = "zzd1",
  },
  {
    type = "item-subgroup",
    name = "kr-decorations-2",
    group = "intermediate-products",
    order = "zzd2",
  },

  -- Crash site

  {
    type = "item-subgroup",
    name = "crash-site",
    group = "other",
    order = "zz",
  },

  -- Nothing
  {
    type = "item-subgroup",
    name = "kr-void",
    group = "other",
    order = "zzz",
  },

  -- Matter

  {
    type = "item-subgroup",
    name = "matter-conversion",
    group = "intermediate-products",
    order = "m1",
  },
  -- From matter to items
  {
    type = "item-subgroup",
    name = "matter-deconversion",
    group = "intermediate-products",
    order = "m2",
  },
  -- Items that in parts use matter
  {
    type = "item-subgroup",
    name = "matter-items",
    group = "intermediate-products",
    order = "m3",
  },

  --
  {
    type = "item-group",
    name = "smelting-crafting",
    order = "m4",
    icon = kr_others_path .. "smelting-crafting.png",
    icon_size = 64,
  },
  {
    type = "item-subgroup",
    name = "smelting-crafting",
    group = "smelting-crafting",
    order = "m4",
  },
})
