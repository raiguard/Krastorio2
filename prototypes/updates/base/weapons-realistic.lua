local data_util = require("data-util")

if not settings.startup["kr-realistic-weapons"].value then
  return
end

data_util.update_ammo_effects(data.raw["technology"]["physical-projectile-damage-1"], {
  { type = "ammo-damage", ammo_category = "bullet", modifier = 0.25 },
  { type = "turret-attack", turret_id = "gun-turret", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["physical-projectile-damage-2"], {
  { type = "ammo-damage", ammo_category = "bullet", modifier = 0.25 },
  { type = "turret-attack", turret_id = "gun-turret", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["physical-projectile-damage-3"], {
  { type = "ammo-damage", ammo_category = "bullet", modifier = 0.25 },
  { type = "turret-attack", turret_id = "gun-turret", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["physical-projectile-damage-4"], {
  { type = "ammo-damage", ammo_category = "bullet", modifier = 0.35 },
  { type = "turret-attack", turret_id = "gun-turret", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["physical-projectile-damage-5"], {
  { type = "ammo-damage", ammo_category = "bullet", modifier = 0.35 },
  { type = "turret-attack", turret_id = "gun-turret", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["physical-projectile-damage-6"], {
  { type = "ammo-damage", ammo_category = "bullet", modifier = 0.35 },
  { type = "turret-attack", turret_id = "gun-turret", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["physical-projectile-damage-7"], {
  { type = "ammo-damage", ammo_category = "bullet", modifier = 0.1 },
  { type = "turret-attack", turret_id = "gun-turret", modifier = 0.1 },
  { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.1 },
  { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.1 },
  { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.1 },
})

------------------------------------------------

-- -- stronger-explosives
data_util.update_ammo_effects(data.raw["technology"]["stronger-explosives-1"], {
  { type = "ammo-damage", ammo_category = "rocket", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "grenade", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "landmine", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["stronger-explosives-2"], {
  { type = "ammo-damage", ammo_category = "rocket", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "grenade", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "landmine", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["stronger-explosives-3"], {
  { type = "ammo-damage", ammo_category = "rocket", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "grenade", modifier = 0.25 },
  { type = "ammo-damage", ammo_category = "landmine", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["stronger-explosives-4"], {
  { type = "ammo-damage", ammo_category = "rocket", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "grenade", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "landmine", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["stronger-explosives-5"], {
  { type = "ammo-damage", ammo_category = "rocket", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "grenade", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "landmine", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["stronger-explosives-6"], {
  { type = "ammo-damage", ammo_category = "rocket", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "grenade", modifier = 0.35 },
  { type = "ammo-damage", ammo_category = "landmine", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["stronger-explosives-7"], {
  { type = "ammo-damage", ammo_category = "rocket", modifier = 0.1 },
  { type = "ammo-damage", ammo_category = "grenade", modifier = 0.1 },
  { type = "ammo-damage", ammo_category = "landmine", modifier = 0.1 },
})

------------------------------------------------

data_util.update_ammo_effects(data.raw["technology"]["refined-flammables-1"], {
  { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.25 },
  { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["refined-flammables-2"], {
  { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.25 },
  { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["refined-flammables-3"], {
  { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.25 },
  { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["refined-flammables-4"], {
  { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.35 },
  { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["refined-flammables-5"], {
  { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.35 },
  { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["refined-flammables-6"], {
  { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.35 },
  { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["refined-flammables-7"], {
  { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.1 },
  { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.1 },
})

------------------------------------------------

data_util.update_ammo_effects(data.raw["technology"]["laser-weapons-damage-1"], {
  { type = "ammo-damage", ammo_category = "laser", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-weapons-damage-2"], {
  { type = "ammo-damage", ammo_category = "laser", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-weapons-damage-3"], {
  { type = "ammo-damage", ammo_category = "laser", modifier = 0.25 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-weapons-damage-4"], {
  { type = "ammo-damage", ammo_category = "laser", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-weapons-damage-5"], {
  { type = "ammo-damage", ammo_category = "laser", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-weapons-damage-6"], {
  { type = "ammo-damage", ammo_category = "laser", modifier = 0.35 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-weapons-damage-7"], {
  { type = "ammo-damage", ammo_category = "laser", modifier = 0.1 },
})

------------------------------------------------

data_util.update_ammo_effects(data.raw["technology"]["weapon-shooting-speed-1"], {
  { type = "gun-speed", ammo_category = "bullet", modifier = 0.2 },
  { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.2 },
  { type = "gun-speed", ammo_category = "cannon-shell", modifier = 0.2 },
  { type = "gun-speed", ammo_category = "rocket", modifier = 0.2 },
})
data_util.update_ammo_effects(data.raw["technology"]["weapon-shooting-speed-2"], {
  { type = "gun-speed", ammo_category = "bullet", modifier = 0.2 },
  { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.2 },
  { type = "gun-speed", ammo_category = "cannon-shell", modifier = 0.2 },
  { type = "gun-speed", ammo_category = "rocket", modifier = 0.2 },
})
data_util.update_ammo_effects(data.raw["technology"]["weapon-shooting-speed-3"], {
  { type = "gun-speed", ammo_category = "bullet", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "cannon-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "rocket", modifier = 0.15 },
})
data_util.update_ammo_effects(data.raw["technology"]["weapon-shooting-speed-4"], {
  { type = "gun-speed", ammo_category = "bullet", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "cannon-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "rocket", modifier = 0.15 },
})
data_util.update_ammo_effects(data.raw["technology"]["weapon-shooting-speed-5"], {
  { type = "gun-speed", ammo_category = "bullet", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "cannon-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "rocket", modifier = 0.15 },
})
data_util.update_ammo_effects(data.raw["technology"]["weapon-shooting-speed-6"], {
  { type = "gun-speed", ammo_category = "bullet", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "shotgun-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "cannon-shell", modifier = 0.15 },
  { type = "gun-speed", ammo_category = "rocket", modifier = 0.15 },
})

------------------------------------------------

data_util.update_ammo_effects(data.raw["technology"]["laser-shooting-speed-1"], {
  { type = "gun-speed", ammo_category = "laser", modifier = 0.2 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-shooting-speed-2"], {
  { type = "gun-speed", ammo_category = "laser", modifier = 0.2 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-shooting-speed-3"], {
  { type = "gun-speed", ammo_category = "laser", modifier = 0.15 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-shooting-speed-4"], {
  { type = "gun-speed", ammo_category = "laser", modifier = 0.15 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-shooting-speed-5"], {
  { type = "gun-speed", ammo_category = "laser", modifier = 0.1 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-shooting-speed-6"], {
  { type = "gun-speed", ammo_category = "laser", modifier = 0.1 },
})
data_util.update_ammo_effects(data.raw["technology"]["laser-shooting-speed-7"], {
  { type = "gun-speed", ammo_category = "laser", modifier = 0.1 },
})

------------------------------------------------

data_util.update_ammo_effects(data.raw["technology"]["artillery-shell-range-1"], {
  { type = "artillery-range", modifier = 0.4 },
})

data_util.update_ammo_effects(data.raw["technology"]["artillery-shell-speed-1"], {
  { type = "gun-speed", ammo_category = "artillery-shell", modifier = 0.25 },
})

-- -- -- Adding new Krastorio ammo damages effects in vanilla technologies

-- Technology for new ammo

data_util.add_effect(
  "physical-projectile-damage-1",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-2",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-3",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-4",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-5",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-6",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-7",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-11",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-16",
  { type = "ammo-damage", ammo_category = "pistol-ammo", modifier = 0.1 }
)

data_util.add_effect(
  "weapon-shooting-speed-1",
  { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-2",
  { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-3",
  { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-4",
  { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-5",
  { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-6",
  { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 }
)

-- --

data_util.add_effect(
  "physical-projectile-damage-1",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-2",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-3",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-4",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-5",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-6",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-7",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-11",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-16",
  { type = "ammo-damage", ammo_category = "rifle-ammo", modifier = 0.1 }
)

data_util.add_effect(
  "weapon-shooting-speed-1",
  { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-2",
  { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-3",
  { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-4",
  { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-5",
  { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-6",
  { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 }
)

-- --

data_util.add_effect(
  "physical-projectile-damage-1",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-2",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-3",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-4",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-5",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-6",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-7",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-11",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-16",
  { type = "ammo-damage", ammo_category = "anti-material-rifle-ammo", modifier = 0.1 }
)

data_util.add_effect(
  "weapon-shooting-speed-1",
  { type = "gun-speed", ammo_category = "anti-material-rifle-ammo", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-2",
  { type = "gun-speed", ammo_category = "anti-material-rifle-ammo", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-3",
  { type = "gun-speed", ammo_category = "anti-material-rifle-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-4",
  { type = "gun-speed", ammo_category = "anti-material-rifle-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-5",
  { type = "gun-speed", ammo_category = "anti-material-rifle-ammo", modifier = 0.15 }
)
data_util.add_effect(
  "weapon-shooting-speed-6",
  { type = "gun-speed", ammo_category = "anti-material-rifle-ammo", modifier = 0.15 }
)

-- Technology for railgun turret

data_util.add_effect(
  "physical-projectile-damage-1",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-2",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-3",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.25 }
)
data_util.add_effect(
  "physical-projectile-damage-4",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-5",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-6",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.35 }
)
data_util.add_effect(
  "physical-projectile-damage-7",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-11",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.1 }
)
data_util.add_effect(
  "physical-projectile-damage-16",
  { type = "ammo-damage", ammo_category = "railgun-shell", modifier = 0.1 }
)

data_util.add_effect(
  "weapon-shooting-speed-2",
  { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-3",
  { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-4",
  { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-5",
  { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-6",
  { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 }
)

-- Technology for rocker turret

data_util.add_effect(
  "stronger-explosives-1",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.25 }
)
data_util.add_effect(
  "stronger-explosives-2",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.25 }
)
data_util.add_effect(
  "stronger-explosives-3",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.25 }
)
data_util.add_effect(
  "stronger-explosives-4",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.35 }
)
data_util.add_effect(
  "stronger-explosives-5",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.35 }
)
data_util.add_effect(
  "stronger-explosives-6",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.35 }
)
data_util.add_effect(
  "stronger-explosives-7",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.1 }
)
data_util.add_effect(
  "stronger-explosives-11",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.1 }
)
data_util.add_effect(
  "stronger-explosives-16",
  { type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.1 }
)

data_util.add_effect(
  "weapon-shooting-speed-2",
  { type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-3",
  { type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-4",
  { type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-5",
  { type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-6",
  { type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2 }
)

-- Technology for heavy rocket launcher

data_util.add_effect(
  "stronger-explosives-1",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25 }
)
data_util.add_effect(
  "stronger-explosives-2",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25 }
)
data_util.add_effect(
  "stronger-explosives-3",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25 }
)
data_util.add_effect(
  "stronger-explosives-4",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35 }
)
data_util.add_effect(
  "stronger-explosives-5",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35 }
)
data_util.add_effect(
  "stronger-explosives-6",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35 }
)
data_util.add_effect(
  "stronger-explosives-7",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.1 }
)
data_util.add_effect(
  "stronger-explosives-11",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.1 }
)
data_util.add_effect(
  "stronger-explosives-16",
  { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.1 }
)

data_util.add_effect(
  "weapon-shooting-speed-2",
  { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-3",
  { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-4",
  { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-5",
  { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 }
)
data_util.add_effect(
  "weapon-shooting-speed-6",
  { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 }
)

-- Technology for impulse rifle

data_util.add_effect(
  "laser-weapons-damage-1",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.25 }
)
data_util.add_effect(
  "laser-weapons-damage-2",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.25 }
)
data_util.add_effect(
  "laser-weapons-damage-3",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.25 }
)
data_util.add_effect(
  "laser-weapons-damage-4",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.35 }
)
data_util.add_effect(
  "laser-weapons-damage-5",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.35 }
)
data_util.add_effect(
  "laser-weapons-damage-6",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.35 }
)
data_util.add_effect(
  "laser-weapons-damage-7",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.1 }
)
data_util.add_effect(
  "laser-weapons-damage-11",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.1 }
)
data_util.add_effect(
  "laser-weapons-damage-16",
  { type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.1 }
)

data_util.add_effect(
  "laser-shooting-speed-1",
  { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2 }
)
data_util.add_effect(
  "laser-shooting-speed-2",
  { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2 }
)
data_util.add_effect(
  "laser-shooting-speed-3",
  { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.15 }
)
data_util.add_effect(
  "laser-shooting-speed-4",
  { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.15 }
)
data_util.add_effect(
  "laser-shooting-speed-5",
  { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.1 }
)
data_util.add_effect(
  "laser-shooting-speed-6",
  { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.1 }
)
data_util.add_effect(
  "laser-shooting-speed-7",
  { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.1 }
)
