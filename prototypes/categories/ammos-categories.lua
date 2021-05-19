-- -- -- New ammos

-- -- Guns
-- Impulse rifle ammo
data.raw["ammo-category"]["impulse-rifle"] = {
  bonus_gui_order = "k",
  type = "ammo-category",
  name = "impulse-rifle",
}

-- Heavy rocket ammo
data.raw["ammo-category"]["heavy-rocket"] = {
  bonus_gui_order = "i",
  type = "ammo-category",
  name = "heavy-rocket",
}

-- -- Turrets and guns
-- Railgun shell turret ammo
data.raw["ammo-category"]["railgun-shell"] = {
  bonus_gui_order = "i",
  type = "ammo-category",
  name = "railgun-shell",
}

-- Missile turret ammo
data.raw["ammo-category"]["missiles-for-turrets"] = {
  bonus_gui_order = "q",
  type = "ammo-category",
  name = "missiles-for-turrets",
}

if krastorio.general.getSafeSettingValue("kr-more-realistic-weapon") then
  -- Pistol ammo
  data.raw["ammo-category"]["pistol-ammo"] = {
    bonus_gui_order = "r",
    type = "ammo-category",
    name = "pistol-ammo",
  }

  -- Rifle and turret ammo
  data.raw["ammo-category"]["rifle-ammo"] = {
    bonus_gui_order = "s",
    type = "ammo-category",
    name = "rifle-ammo",
  }

  -- Rifle and turret ammo
  data.raw["ammo-category"]["anti-material-rifle-ammo"] = {
    bonus_gui_order = "t",
    type = "ammo-category",
    name = "anti-material-rifle-ammo",
  }
end
