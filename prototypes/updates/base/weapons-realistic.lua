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

data_util.add_effect("weapon-shooting-speed-1", { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-2", { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-3", { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 })
data_util.add_effect("weapon-shooting-speed-4", { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 })
data_util.add_effect("weapon-shooting-speed-5", { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 })
data_util.add_effect("weapon-shooting-speed-6", { type = "gun-speed", ammo_category = "pistol-ammo", modifier = 0.15 })

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

data_util.add_effect("weapon-shooting-speed-1", { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-2", { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-3", { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 })
data_util.add_effect("weapon-shooting-speed-4", { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 })
data_util.add_effect("weapon-shooting-speed-5", { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 })
data_util.add_effect("weapon-shooting-speed-6", { type = "gun-speed", ammo_category = "rifle-ammo", modifier = 0.15 })

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

data_util.add_effect("weapon-shooting-speed-2", { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-3", { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-4", { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-5", { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-6", { type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2 })

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

data_util.add_effect("stronger-explosives-1", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25 })
data_util.add_effect("stronger-explosives-2", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25 })
data_util.add_effect("stronger-explosives-3", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25 })
data_util.add_effect("stronger-explosives-4", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35 })
data_util.add_effect("stronger-explosives-5", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35 })
data_util.add_effect("stronger-explosives-6", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35 })
data_util.add_effect("stronger-explosives-7", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.1 })
data_util.add_effect("stronger-explosives-11", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.1 })
data_util.add_effect("stronger-explosives-16", { type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.1 })

data_util.add_effect("weapon-shooting-speed-2", { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-3", { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-4", { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-5", { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 })
data_util.add_effect("weapon-shooting-speed-6", { type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2 })

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

data_util.add_effect("laser-shooting-speed-1", { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2 })
data_util.add_effect("laser-shooting-speed-2", { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2 })
data_util.add_effect("laser-shooting-speed-3", { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.15 })
data_util.add_effect("laser-shooting-speed-4", { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.15 })
data_util.add_effect("laser-shooting-speed-5", { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.1 })
data_util.add_effect("laser-shooting-speed-6", { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.1 })
data_util.add_effect("laser-shooting-speed-7", { type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.1 })

-- ------------------------------------------------------------------------------------------------------
-- Everything below this point has been moved verbatim, I really don't feel like going through any of it.

-- -- --

local pistol_range = 22
local rifle_range = 30
local sniper_range = 70

-- -- --

local bullets_collision_box = { { -0.5, -1 }, { 0.5, 1 } }
local k_target_type = "direction" -- "entity", "position" or "direction"
local k_d_radius = 0.5
local k_pistol_min_range = 0.5
local k_rifle_min_range = 0.5
local k_s_rifle_min_range = 1
local turret_range = 0

if settings.startup["kr-realistic-weapons-auto-aim"].value then
  pistol_range = 20
  rifle_range = 25
  sniper_range = 50
  bullets_collision_box = { { -0.1, -0.5 }, { 0.1, 0.5 } }
  k_target_type = "entity" -- "entity", "position" or "direction"
  k_d_radius = 0.25
  k_pistol_min_range = 0.25
  k_rifle_min_range = 0.25
  k_s_rifle_min_range = 0.5
  turret_range = 0
end

-- -- --

----------------------------------------------------------------------------------------------------------------------
---------------------------------------------- -- NEW EXPLOSION -- ---------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

data:extend({
  {
    type = "explosion",
    name = "explosion-hit-p",
    flags = { "not-on-map" },
    subgroup = "explosions",
    animations = {
      {
        filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = { 0, -0.3125 },
      },
    },
    light = { intensity = 1, size = 9, color = { r = 1.0, g = 0.8, b = 0.5 } },
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
  },
  {
    type = "explosion",
    name = "explosion-hit-u",
    flags = { "not-on-map" },
    subgroup = "explosions",
    animations = {
      {
        filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = { 0, -0.3125 },
      },
    },
    light = { intensity = 1, size = 9, color = { r = 0.5, g = 1, b = 0.5 } },
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 0.75,
  },
  {
    type = "explosion",
    name = "explosion-hit-i",
    flags = { "not-on-map" },
    subgroup = "explosions",
    animations = {
      {
        filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 1.5,
        shift = { 0, -0.3125 },
      },
    },
    light = { intensity = 1.5, size = 10, color = { r = 1, g = 0.45, b = 0.8 } },
    smoke = "smoke-fast",
    smoke_count = 3,
    smoke_slow_down_factor = 0.5,
  },
})

data.raw.gun["submachine-gun"].attack_parameters.range = 50
data.raw.gun["submachine-gun"].attack_parameters.movement_slow_down_factor = 0.25

----------------------------------------------------------------------------------------------------------------------
---------------------------------------------- -- PISTOL STUFF -- ----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

data.raw.gun["pistol"].attack_parameters.ammo_category = "pistol-ammo"
data.raw.gun["pistol"].attack_parameters.range = pistol_range - 2
data.raw.gun["pistol"].attack_parameters.min_range = k_pistol_min_range
data.raw.gun["pistol"].attack_parameters.cooldown = 20
data.raw.gun["pistol"].attack_parameters.movement_slow_down_factor = 0.15

data.raw.gun["kr-accelerator"].attack_parameters.ammo_category = "pistol-ammo"
data.raw.gun["kr-accelerator"].attack_parameters.range = pistol_range
data.raw.gun["kr-accelerator"].min_range = k_pistol_min_range

data:extend({
  {
    type = "ammo",
    name = "firearm-magazine",
    icon = "__Krastorio2Assets__/icons/items/pistol-ammo-1.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/pistol-ammo-1.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "pistol-ammo",
    ammo_type = {
      cooldown_modifier = 0.8,
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "pistol-ammo-1",
              starting_speed = 1,
              direction_deviation = 0.15,
              range_deviation = 0.15,
              max_range = pistol_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
        },
      },
    },
    magazine_size = 12,
    subgroup = "ammo",
    order = "a[basic-clips]-a01[pistol-magazine]",
    stack_size = 200,
  },
  {
    type = "projectile",
    name = "pistol-ammo-1",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.015,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          },
          {
            type = "damage",
            damage = { amount = 8, type = "physical" },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/pistol-bullet-1.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/pistol-bullet-1.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
      draw_as_shadow = true,
    },
    force_condition = "not-same",
    light = { intensity = 0.45, size = 5, color = { r = 1.0, g = 1.0, b = 0.5 } },
  },
  {
    type = "recipe",
    name = "firearm-magazine",
    energy_required = 0.5,
    enabled = true,
    ingredients = {
      { type = "item", name = "coal", amount = 1 },
      { type = "item", name = "iron-plate", amount = 1 },
    },
    results = { { type = "item", name = "firearm-magazine", amount = 1 } },
  },
  {
    type = "ammo",
    name = "piercing-rounds-magazine",
    icon = "__Krastorio2Assets__/icons/items/pistol-ammo-2.png",
    icon_size = 64,
    pictures = {
      {
        filename = "__Krastorio2Assets__/icons/items/pistol-ammo-2.png",
        size = 64,
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "pistol-ammo",
    ammo_type = {
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "pistol-ammo-2",
              starting_speed = 1.1,
              direction_deviation = 0.15,
              range_deviation = 0.15,
              max_range = pistol_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
        },
      },
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a02[pistol-magazine]",
    stack_size = 200,
  },
  {
    type = "projectile",
    name = "pistol-ammo-2",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.015,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit-p",
          },
          {
            type = "damage",
            damage = { amount = 12, type = "physical" },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/pistol-bullet-2.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/pistol-bullet-2.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.35, size = 7, color = { r = 1.0, g = 0.8, b = 0.5 } },
  },

  {
    type = "recipe",
    name = "piercing-rounds-magazine",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "firearm-magazine", amount = 1 },
      { type = "item", name = "steel-plate", amount = 1 },
    },
    results = { { type = "item", name = "piercing-rounds-magazine", amount = 1 } },
  },
})

data.raw.ammo["firearm-magazine"].localised_name = { "item-name.pistol-magazine" }
data.raw.ammo["piercing-rounds-magazine"].localised_name = { "item-name.armor-piercing-pistol-magazine" }

----------------------------------------------------------------------------------------------------------------------
---------------------------------------------- -- RIFLE STUFF -- -----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

data.raw.gun["submachine-gun"].attack_parameters.ammo_category = "bullet"
data.raw.gun["submachine-gun"].attack_parameters.range = rifle_range
data.raw.gun["submachine-gun"].attack_parameters.min_range = k_rifle_min_range
data.raw.gun["submachine-gun"].attack_parameters.cooldown = 8
data.raw.gun["submachine-gun"].attack_parameters.movement_slow_down_factor = 0.15

data:extend({
  {
    type = "ammo",
    name = "rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/rifle-ammo-1.png",
    icon_size = 64,
    pictures = {
      {
        filename = "__Krastorio2Assets__/icons/items/rifle-ammo-1.png",
        size = 64,
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "bullet",
    ammo_type = {
      cooldown_modifier = 0.8,
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "rifle-ammo-1",
              starting_speed = 1.5,
              direction_deviation = 0.15,
              range_deviation = 0.15,
              max_range = rifle_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
        },
      },
    },
    magazine_size = 30,
    subgroup = "ammo",
    order = "a[basic-clips]-a03[rifle-magazine]",
    stack_size = 200,
  },
  {
    type = "projectile",
    name = "rifle-ammo-1",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.018,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          },
          {
            type = "damage",
            damage = { amount = 10, type = "physical" },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-1.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-1.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.45, size = 5, color = { r = 1.0, g = 1.0, b = 0.5 } },
  },
  {
    type = "recipe",
    name = "rifle-magazine",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "coal", amount = 2 },
      { type = "item", name = "iron-plate", amount = 1 },
      { type = "item", name = "copper-plate", amount = 1 },
    },
    results = { { type = "item", name = "rifle-magazine", amount = 1 } },
  },

  -- ---------------------------------------------------------------------------------------------------------------- --

  {
    type = "ammo",
    name = "armor-piercing-rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/rifle-ammo-2.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/rifle-ammo-2.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "bullet",
    ammo_type = {
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "rifle-ammo-2",
              starting_speed = 1.75,
              direction_deviation = 0.15,
              range_deviation = 0.15,
              max_range = rifle_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
        },
      },
    },
    magazine_size = 30,
    subgroup = "ammo",
    order = "a[basic-clips]-a04[rifle-magazine]",
    stack_size = 200,
  },
  {
    type = "projectile",
    name = "rifle-ammo-2",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.02,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit-p",
          },
          {
            type = "damage",
            damage = { amount = 14, type = "physical" },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-2.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-2.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.25, size = 7, color = { r = 1.0, g = 0.8, b = 0.5 } },
  },

  {
    type = "recipe",
    name = "armor-piercing-rifle-magazine",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "rifle-magazine", amount = 1 },
      { type = "item", name = "steel-plate", amount = 2 },
    },
    results = { { type = "item", name = "armor-piercing-rifle-magazine", amount = 1 } },
  },

  -- ---------------------------------------------------------------------------------------------------------------- --

  {
    type = "ammo",
    name = "uranium-rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/rifle-ammo-3.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/rifle-ammo-3.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "bullet",
    ammo_type = {
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "rifle-ammo-3",
              starting_speed = 1.75,
              direction_deviation = 0.15,
              range_deviation = 0.15,
              max_range = rifle_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
        },
      },
    },
    magazine_size = 30,
    subgroup = "ammo",
    order = "a[basic-clips]-a05[rifle-magazine]",
    stack_size = 200,
  },

  {
    type = "projectile",
    name = "rifle-ammo-3",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.02,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit-u",
          },
          {
            type = "damage",
            damage = { amount = 14, type = "physical" },
          },
          {
            type = "damage",
            damage = { amount = 6, type = "radioactive" },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-3.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-3.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.25, size = 7, color = { r = 0.5, g = 1, b = 0.5 } },
  },

  {
    type = "recipe",
    name = "uranium-rifle-magazine",
    energy_required = 3,
    enabled = false,
    ingredients = {
      { type = "item", name = "rifle-magazine", amount = 1 },
      { type = "item", name = "uranium-238", amount = 2 },
    },
    results = { { type = "item", name = "uranium-rifle-magazine", amount = 1 } },
  },

  -- ---------------------------------------------------------------------------------------------------------------- --

  {
    type = "ammo",
    name = "imersite-rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/rifle-ammo-4.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/rifle-ammo-4.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "bullet",
    ammo_type = {
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "rifle-ammo-4",
              starting_speed = 2.25,
              direction_deviation = 0.1,
              range_deviation = 0.1,
              max_range = rifle_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
        },
      },
    },
    magazine_size = 30,
    subgroup = "ammo",
    order = "a[basic-clips]-a06[rifle-magazine]",
    stack_size = 200,
  },

  {
    type = "projectile",
    name = "rifle-ammo-4",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.02,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit-i",
          },
          {
            type = "damage",
            damage = { amount = 14, type = "physical" },
          },
          {
            type = "damage",
            damage = { amount = 10, type = "laser" },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-4.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/rifle-bullet-4.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.25, size = 8, color = { r = 1, g = 0.45, b = 0.8 } },
  },

  {
    type = "recipe",
    name = "imersite-rifle-magazine",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "rifle-magazine", amount = 1 },
      { type = "item", name = "imersite-crystal", amount = 2 },
    },
    results = { { type = "item", name = "imersite-rifle-magazine", amount = 1 } },
  },
})

----------------------------------------------------------------------------------------------------------------------
----------------------------------------- -- ANTI-MATERIAL RIFLE STUFF -- --------------------------------------------
----------------------------------------------------------------------------------------------------------------------

data:extend({

  {
    type = "gun",
    name = "anti-material-rifle",
    icon = "__Krastorio2Assets__/icons/guns/anti-material-rifle.png",
    icon_size = 64,
    subgroup = "gun",
    order = "c1[anti-material-rifle]",
    attack_parameters = {
      type = "projectile",
      ammo_category = "anti-material-rifle-ammo",
      cooldown = 60,
      movement_slow_down_factor = 0.75,
      shell_particle = {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = { 0, 0.1 },
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1,
      },
      projectile_creation_distance = 1.125,
      min_range = k_s_rifle_min_range,
      range = sniper_range,
      sound = {
        {
          filename = "__Krastorio2Assets__/sounds/weapons/anti-material-rifle.ogg",
          volume = 0.5,
        },
      },
    },
    stack_size = 10,
  },

  {
    type = "recipe",
    name = "anti-material-rifle",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "submachine-gun", amount = 2 },
      { type = "item", name = "steel-plate", amount = 4 },
    },
    results = { { type = "item", name = "anti-material-rifle", amount = 1 } },
  },

  -- ---------------------------------------------------------------------------------------------------------------- --

  {
    type = "ammo",
    name = "anti-material-rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-1.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-1.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "anti-material-rifle-ammo",
    ammo_type = {
      cooldown_modifier = 0.8,
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "anti-material-rifle-ammo-1",
              starting_speed = 3,
              direction_deviation = 0.02,
              range_deviation = 0.02,
              max_range = sniper_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
          force = "not-same",
        },
      },
    },
    magazine_size = 7,
    subgroup = "ammo",
    order = "a[basic-clips]-a07[anti-material-rifle-magazine]",
    stack_size = 200,
  },

  {
    type = "projectile",
    name = "anti-material-rifle-ammo-1",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.025,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = k_d_radius + 0.25,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 80, type = "physical" },
                  },
                },
              },
              force = "not-same",
            },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-1.png",
      frame_count = 1,
      width = 3,
      height = 100,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-1.png",
      frame_count = 1,
      width = 3,
      height = 100,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.45, size = 8, color = { r = 1.0, g = 1.0, b = 0.5 } },
  },

  {
    type = "recipe",
    name = "anti-material-rifle-magazine",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "coal", amount = 3 },
      { type = "item", name = "iron-plate", amount = 2 },
      { type = "item", name = "copper-plate", amount = 1 },
    },
    results = { { type = "item", name = "anti-material-rifle-magazine", amount = 1 } },
  },

  -- ---------------------------------------------------------------------------------------------------------------- --

  {
    type = "ammo",
    name = "armor-piercing-anti-material-rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-2.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-2.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "anti-material-rifle-ammo",
    ammo_type = {
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "anti-material-rifle-ammo-2",
              starting_speed = 3,
              direction_deviation = 0.02,
              range_deviation = 0.02,
              max_range = sniper_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
          force = "not-same",
        },
      },
    },
    magazine_size = 7,
    subgroup = "ammo",
    order = "a[basic-clips]-a08[anti-material-rifle-magazine]",
    stack_size = 200,
  },

  {
    type = "projectile",
    name = "anti-material-rifle-ammo-2",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.025,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit-p",
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = k_d_radius + 0.25,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 125, type = "physical" },
                  },
                },
              },
              force = "not-same",
            },
          },
        },
      },
      force = "not-same",
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-2.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-2.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.45, size = 8, color = { r = 1.0, g = 0.8, b = 0.5 } },
  },

  {
    type = "recipe",
    name = "armor-piercing-anti-material-rifle-magazine",
    energy_required = 3,
    enabled = false,
    ingredients = {
      { type = "item", name = "anti-material-rifle-magazine", amount = 1 },
      { type = "item", name = "steel-plate", amount = 3 },
    },
    results = { { type = "item", name = "armor-piercing-anti-material-rifle-magazine", amount = 1 } },
  },

  -- ---------------------------------------------------------------------------------------------------------------- --

  {
    type = "ammo",
    name = "uranium-anti-material-rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-3.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-3.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "anti-material-rifle-ammo",
    ammo_type = {
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "anti-material-rifle-ammo-3",
              starting_speed = 3,
              direction_deviation = 0.02,
              range_deviation = 0.02,
              max_range = sniper_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
          force = "not-same",
        },
      },
    },
    magazine_size = 7,
    subgroup = "ammo",
    order = "a[basic-clips]-a09[anti-material-rifle-magazine]",
    stack_size = 200,
  },

  {
    type = "projectile",
    name = "anti-material-rifle-ammo-3",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.025,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit-u",
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = k_d_radius + 0.25,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 125, type = "physical" },
                  },
                  {
                    type = "damage",
                    damage = { amount = 75, type = "radioactive" },
                  },
                },
              },
              force = "not-same",
            },
          },
        },
      },
      force = "not-same",
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-3.png",
      frame_count = 1,
      width = 3,
      height = 100,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-3.png",
      frame_count = 1,
      width = 3,
      height = 100,
      priority = "high",
      draw_as_shadow = true,
    },
    force_condition = "not-same",
    light = { intensity = 0.45, size = 8, color = { r = 0.5, g = 1, b = 0.5 } },
  },

  {
    type = "recipe",
    name = "uranium-anti-material-rifle-magazine",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "anti-material-rifle-magazine", amount = 1 },
      { type = "item", name = "uranium-238", amount = 3 },
    },
    results = { { type = "item", name = "uranium-anti-material-rifle-magazine", amount = 1 } },
  },

  -- ---------------------------------------------------------------------------------------------------------------- --

  {
    type = "ammo",
    name = "imersite-anti-material-rifle-magazine",
    icon = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-4.png",
    icon_size = 64,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items/anti-material-rifle-ammo-4.png",
        scale = 0.5,
        mipmap_count = 4,
      },
    },
    ammo_category = "anti-material-rifle-ammo",
    ammo_type = {
      target_type = k_target_type,
      action = {
        {
          type = "direct",
          action_delivery = {
            {
              type = "projectile",
              projectile = "anti-material-rifle-ammo-4",
              starting_speed = 5,
              direction_deviation = 0.02,
              range_deviation = 0.02,
              max_range = sniper_range,
              source_effects = {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot",
                },
              },
            },
          },
          force = "not-same",
        },
      },
    },
    magazine_size = 7,
    subgroup = "ammo",
    order = "a[basic-clips]-a10[anti-material-rifle-magazine]",
    stack_size = 200,
  },

  {
    type = "projectile",
    name = "anti-material-rifle-ammo-4",
    flags = { "not-on-map" },
    collision_box = bullets_collision_box,
    acceleration = -0.02,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit-i",
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = k_d_radius + 0.25,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 125, type = "physical" },
                  },
                  {
                    type = "damage",
                    damage = { amount = 50, type = "laser" },
                  },
                  {
                    type = "damage",
                    damage = { amount = 25, type = "radioactive" },
                  },
                },
              },
              force = "not-same",
            },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-4.png",
      frame_count = 1,
      width = 3,
      height = 100,
      priority = "high",
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/anti-material-rifle-bullet-4.png",
      frame_count = 1,
      width = 3,
      height = 100,
      priority = "high",
      draw_as_shadow = true,
    },
    --hit_at_collision_position = true,
    force_condition = "not-same",
    light = { intensity = 0.5, size = 9, color = { r = 1, g = 0.45, b = 0.8 } },
  },

  {
    type = "recipe",
    name = "imersite-anti-material-rifle-magazine",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "anti-material-rifle-magazine", amount = 1 },
      { type = "item", name = "imersite-crystal", amount = 3 },
    },
    results = { { type = "item", name = "imersite-anti-material-rifle-magazine", amount = 1 } },
  },
})

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------- -- EDIT THINGS -- ----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

-- -- Vanilla

data.raw.gun["shotgun"].attack_parameters.cooldown = 60
data.raw.gun["shotgun"].movement_slow_down_factor = 0.2
data.raw.gun["shotgun"].attack_parameters.damage_modifier = 1.5

data.raw.gun["combat-shotgun"].attack_parameters.cooldown = 30
data.raw.gun["combat-shotgun"].movement_slow_down_factor = 0.3
data.raw.gun["combat-shotgun"].attack_parameters.damage_modifier = 1.5

data.raw.ammo["shotgun-shell"].magazine_size = 6
data.raw.ammo["piercing-shotgun-shell"].magazine_size = 6
data.raw.ammo["shotgun-shell"].ammo_type.action = {
  {
    type = "direct",
    action_delivery = {
      type = "instant",
      source_effects = {
        {
          type = "create-explosion",
          entity_name = "explosion-gunshot",
        },
      },
    },
  },
  {
    type = "direct",
    repeat_count = 16,
    action_delivery = {
      type = "projectile",
      projectile = "shotgun-pellet",
      starting_speed = 1,
      starting_speed_deviation = 0.1,
      direction_deviation = 0.3,
      range_deviation = 0.3,
      max_range = 15,
    },
  },
}

data.raw.projectile["shotgun-pellet"].acceleration = -0.01
data.raw.projectile["shotgun-pellet"].action.action_delivery.target_effects.damage = { amount = 6, type = "physical" }

data.raw.projectile["piercing-shotgun-pellet"].acceleration = -0.01
data.raw.projectile["piercing-shotgun-pellet"].action.action_delivery.target_effects.damage = {
  amount = 10,
  type = "physical",
}

--data.raw["ammo-turret"]["gun-turret"].localised_name={"kr-gun-turret"}
data.raw["ammo-turret"]["gun-turret"].attack_parameters.range = 25
data.raw["ammo-turret"]["gun-turret"].attack_parameters.ammo_category = "bullet"
data.raw["ammo-turret"]["gun-turret"].attack_parameters.min_range = turret_range

data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 50
data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50

data.raw.gun["artillery-wagon-cannon"].attack_parameters.range = 6 * 32

data.raw.gun["vehicle-machine-gun"].attack_parameters.range = rifle_range
data.raw.gun["vehicle-machine-gun"].attack_parameters.min_range = 1.75
data.raw.gun["vehicle-machine-gun"].attack_parameters.ammo_category = "bullet"
data.raw.gun["tank-machine-gun"].attack_parameters.range = rifle_range
data.raw.gun["tank-machine-gun"].attack_parameters.min_range = 2
data.raw.gun["tank-machine-gun"].attack_parameters.ammo_category = "bullet"
data.raw.gun["tank-cannon"].attack_parameters.range = 50
data.raw.gun["rocket-launcher"].attack_parameters.range = 50

-- -- Vanilla worms

data.raw.turret["small-worm-turret"].attack_parameters.range = 30
data.raw.turret["small-worm-turret"].call_for_help_radius = 40

data.raw.turret["medium-worm-turret"].attack_parameters.range = 35
data.raw.turret["medium-worm-turret"].call_for_help_radius = 45

data.raw.turret["big-worm-turret"].attack_parameters.range = 40
data.raw.turret["big-worm-turret"].call_for_help_radius = 50

data.raw.turret["behemoth-worm-turret"].attack_parameters.range = 55
data.raw.turret["behemoth-worm-turret"].call_for_help_radius = 65

-- -- Krastorio

data.raw.ammo["uranium-rounds-magazine"] = nil
data.raw.recipe["uranium-rounds-magazine"] = nil
data.raw.ammo["imersite-rounds-magazine"] = nil
data.raw.recipe["imersite-rounds-magazine"] = nil

data.raw.gun["advanced-tank-machine-gun"].attack_parameters.ammo_category = "anti-material-rifle-ammo"
data.raw.gun["advanced-tank-machine-gun"].attack_parameters.range = sniper_range
data.raw.gun["advanced-tank-machine-gun"].attack_parameters.min_range = 3.5
data.raw.gun["advanced-tank-machine-gun"].attack_parameters.cooldown = 15
data.raw.gun["advanced-tank-machine-gun"].sound = {
  {
    filename = "__Krastorio2Assets__/sounds/weapons/anti-material-rifle.ogg",
    volume = 0.8,
  },
}

-- Technologies

data_util.remove_recipe_unlock("uranium-ammo", "uranium-rounds-magazine")
data_util.remove_recipe_unlock("kr-military-5", "imersite-rounds-magazine")

data_util.add_recipe_unlock("military", "rifle-magazine")

data_util.add_recipe_unlock("military-2", "armor-piercing-rifle-magazine")

data_util.add_recipe_unlock("military-2", "anti-material-rifle")
data_util.add_recipe_unlock("military-2", "anti-material-rifle-magazine")

data_util.add_recipe_unlock("military-3", "armor-piercing-anti-material-rifle-magazine")

data_util.add_recipe_unlock("uranium-ammo", "uranium-rifle-magazine")
data_util.add_recipe_unlock("uranium-ammo", "uranium-anti-material-rifle-magazine")

data_util.add_recipe_unlock("kr-military-5", "imersite-rifle-magazine")
data_util.add_recipe_unlock("kr-military-5", "imersite-anti-material-rifle-magazine")

data_util.add_prerequisite("gun-turret", "military")
