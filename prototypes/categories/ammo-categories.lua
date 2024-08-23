data:extend({
  {
    type = "ammo-category",
    name = "impulse-rifle",
    bonus_gui_order = "k",
  },
  {
    type = "ammo-category",
    name = "heavy-rocket",
    bonus_gui_order = "i",
  },
  {
    type = "ammo-category",
    name = "railgun-shell",
    bonus_gui_order = "i",
  },
  {
    type = "ammo-category",
    name = "missiles-for-turrets",
    bonus_gui_order = "q",
  },
})

if not settings.startup["kr-more-realistic-weapon"].value then
  return
end

data:extend({
  {
    type = "ammo-category",
    name = "pistol-ammo",
    bonus_gui_order = "r",
  },
  {
    type = "ammo-category",
    name = "rifle-ammo",
    bonus_gui_order = "s",
  },
  {
    type = "ammo-category",
    name = "anti-material-rifle-ammo",
    bonus_gui_order = "t",
  },
})
