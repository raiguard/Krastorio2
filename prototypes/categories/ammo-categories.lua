data:extend({
  {
    type = "ammo-category",
    name = "impulse-rifle",
    bonus_gui_order = "k",
    subgroup = "ammo-category",
  },
  {
    type = "ammo-category",
    name = "heavy-rocket",
    bonus_gui_order = "i",
    subgroup = "ammo-category",
  },
  {
    type = "ammo-category",
    name = "railgun-shell",
    bonus_gui_order = "i",
    subgroup = "ammo-category",
  },
  {
    type = "ammo-category",
    name = "missiles-for-turrets",
    bonus_gui_order = "q",
    subgroup = "ammo-category",
  },
})

if not settings.startup["kr-realistic-weapons"].value then
  return
end

data:extend({
  {
    type = "ammo-category",
    name = "pistol-ammo",
    bonus_gui_order = "r",
    subgroup = "ammo-category",
  },
  {
    type = "ammo-category",
    name = "rifle-ammo",
    bonus_gui_order = "s",
    subgroup = "ammo-category",
  },
  {
    type = "ammo-category",
    name = "anti-material-rifle-ammo",
    bonus_gui_order = "t",
    subgroup = "ammo-category",
  },
})
