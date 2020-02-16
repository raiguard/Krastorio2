-- -- Rebalance the bonus given by technologies to ammo and turrets damage and attack speed

	-- -- physical-projectile-damage
	data.raw["technology"]["physical-projectile-damage-1"].effects =
	{
	  {
		type = "ammo-damage",
		ammo_category = "bullet",
		modifier = 0.25
	  },
	  {
		type = "turret-attack",
		turret_id = "gun-turret",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "shotgun-shell",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "artillery-shell",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "cannon-shell",
		modifier = 0.25
	  }
	}
	data.raw["technology"]["physical-projectile-damage-2"].effects =
	{
	  {
		type = "ammo-damage",
		ammo_category = "bullet",
		modifier = 0.25
	  },
	  {
		type = "turret-attack",
		turret_id = "gun-turret",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "shotgun-shell",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "artillery-shell",
		modifier = 0.25
	  },	  
	  {
		type = "ammo-damage",
		ammo_category = "cannon-shell",
		modifier = 0.25
	  }
	}
	data.raw["technology"]["physical-projectile-damage-3"].effects =
	{
	  {
		type = "ammo-damage",
		ammo_category = "bullet",
		modifier = 0.25
	  },
	  {
		type = "turret-attack",
		turret_id = "gun-turret",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "shotgun-shell",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "artillery-shell",
		modifier = 0.25
	  },
	  {
		type = "ammo-damage",
		ammo_category = "cannon-shell",
		modifier = 0.25
	  }
	}
	data.raw["technology"]["physical-projectile-damage-4"].effects =
	{
	  {
		type = "ammo-damage",
		ammo_category = "bullet",
		modifier = 0.35
	  },
	  {
		type = "turret-attack",
		turret_id = "gun-turret",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "shotgun-shell",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "artillery-shell",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "cannon-shell",
		modifier = 0.35
	  }
	}
	data.raw["technology"]["physical-projectile-damage-5"].effects =
	{
	  {
		type = "ammo-damage",
		ammo_category = "bullet",
		modifier = 0.35
	  },
	  {
		type = "turret-attack",
		turret_id = "gun-turret",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "shotgun-shell",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "artillery-shell",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "cannon-shell",
		modifier = 0.35
	  }
	}
	data.raw["technology"]["physical-projectile-damage-6"].effects =
	{
	  {
		type = "ammo-damage",
		ammo_category = "bullet",
		modifier = 0.35
	  },
	  {
		type = "turret-attack",
		turret_id = "gun-turret",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "shotgun-shell",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "artillery-shell",
		modifier = 0.35
	  },
	  {
		type = "ammo-damage",
		ammo_category = "cannon-shell",
		modifier = 0.35
	  }
	}
	data.raw["technology"]["physical-projectile-damage-7"].effects =
	{
	  {
		type = "ammo-damage",
		ammo_category = "bullet",
		modifier = 0.1
	  },
	  {
		type = "turret-attack",
		turret_id = "gun-turret",
		modifier = 0.1
	  },
	  {
		type = "ammo-damage",
		ammo_category = "shotgun-shell",
		modifier = 0.1
	  },
	  {
		type = "ammo-damage",
		ammo_category = "artillery-shell",
		modifier = 0.1
	  },
	  {
		type = "ammo-damage",
		ammo_category = "cannon-shell",
		modifier = 0.1
	  }
	}
   
------------------------------------------------
   
	-- -- stronger-explosives
	data.raw["technology"]["stronger-explosives-1"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.25
      }
	}
	data.raw["technology"]["stronger-explosives-2"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.25
      }
	}
	data.raw["technology"]["stronger-explosives-3"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.25
      }
	}
	data.raw["technology"]["stronger-explosives-4"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.35
      }
	}
	data.raw["technology"]["stronger-explosives-5"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.35
      }
	}
	data.raw["technology"]["stronger-explosives-6"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.35
      }
	}
	
	data.raw["technology"]["stronger-explosives-7"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.1
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.1
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.1
      }
	}
	  
------------------------------------------------

	data.raw["technology"]["refined-flammables-1"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.25
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.25
      }
    }
	data.raw["technology"]["refined-flammables-2"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.25
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.25
      }
    }
	data.raw["technology"]["refined-flammables-3"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.25
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.25
      }
    }
	data.raw["technology"]["refined-flammables-4"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.35
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.35
      }
    }
	data.raw["technology"]["refined-flammables-5"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.35
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.35
      }
    }
	data.raw["technology"]["refined-flammables-6"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.35
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.35
      }
    }
	data.raw["technology"]["refined-flammables-7"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.1
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.1
      }
    }
	
------------------------------------------------

	data.raw["technology"]["energy-weapons-damage-1"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.25
      }
    }
	data.raw["technology"]["energy-weapons-damage-2"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.25
      }
    }
	data.raw["technology"]["energy-weapons-damage-3"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.25
      }
    }
	data.raw["technology"]["energy-weapons-damage-4"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.35
      }
    }
	data.raw["technology"]["energy-weapons-damage-5"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.35
      }
    }
	data.raw["technology"]["energy-weapons-damage-6"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.35
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.35
      }
    }
	data.raw["technology"]["energy-weapons-damage-7"].effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.1
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.1
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.1
      }
    }
	
------------------------------------------------

	data.raw["technology"]["weapon-shooting-speed-1"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.2
      }
    }
	data.raw["technology"]["weapon-shooting-speed-2"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.2
      }
    }
	data.raw["technology"]["weapon-shooting-speed-3"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.15
      }
    }
	data.raw["technology"]["weapon-shooting-speed-4"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.15
      }
    }
	data.raw["technology"]["weapon-shooting-speed-5"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.15
      }
    }
	data.raw["technology"]["weapon-shooting-speed-6"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.15
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.15
      }
    }

------------------------------------------------

	data.raw["technology"]["laser-turret-speed-1"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.1
      }
    }
	data.raw["technology"]["laser-turret-speed-2"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.15
      }
    }
	data.raw["technology"]["laser-turret-speed-3"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.15
      }
    }
	data.raw["technology"]["laser-turret-speed-4"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.15
      }
    }
	data.raw["technology"]["laser-turret-speed-5"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.15
      }
    }
	data.raw["technology"]["laser-turret-speed-6"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.15
      }
    }
	data.raw["technology"]["laser-turret-speed-7"].effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.15
      }
    }
	
	
-- -- -- Adding new Krastorio ammo damages effects in vanilla technologies

-- Technology for railgun turret

krastorio.technologies.addEffect("physical-projectile-damage-1", {type = "ammo-damage",	ammo_category = "railgun-shell", modifier = 0.25})
krastorio.technologies.addEffect("physical-projectile-damage-2", {type = "ammo-damage",	ammo_category = "railgun-shell", modifier = 0.25})
krastorio.technologies.addEffect("physical-projectile-damage-3", {type = "ammo-damage",	ammo_category = "railgun-shell", modifier = 0.25})
krastorio.technologies.addEffect("physical-projectile-damage-4", {type = "ammo-damage",	ammo_category = "railgun-shell", modifier = 0.35})
krastorio.technologies.addEffect("physical-projectile-damage-5", {type = "ammo-damage",	ammo_category = "railgun-shell", modifier = 0.35})
krastorio.technologies.addEffect("physical-projectile-damage-6", {type = "ammo-damage",	ammo_category = "railgun-shell", modifier = 0.35})
krastorio.technologies.addEffect("physical-projectile-damage-7", {type = "ammo-damage",	ammo_category = "railgun-shell", modifier = 0.1})

krastorio.technologies.addEffect("weapon-shooting-speed-2", {type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-3", {type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-4", {type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-5", {type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-6", {type = "gun-speed", ammo_category = "railgun-shell", modifier = 0.2})

-- Technology for rocker turret

krastorio.technologies.addEffect("stronger-explosives-1", {type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.25})
krastorio.technologies.addEffect("stronger-explosives-2", {type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.25})
krastorio.technologies.addEffect("stronger-explosives-3", {type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.25})
krastorio.technologies.addEffect("stronger-explosives-4", {type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.35})
krastorio.technologies.addEffect("stronger-explosives-5", {type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.35})
krastorio.technologies.addEffect("stronger-explosives-6", {type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.35})
krastorio.technologies.addEffect("stronger-explosives-7", {type = "ammo-damage", ammo_category = "missiles-for-turrets", modifier = 0.1})

krastorio.technologies.addEffect("weapon-shooting-speed-2", {type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-3", {type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-4", {type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-5", {type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-6", {type = "gun-speed", ammo_category = "missiles-for-turrets", modifier = 0.2})

-- Technology for heavy rocket launcher

krastorio.technologies.addEffect("stronger-explosives-1", {type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25})
krastorio.technologies.addEffect("stronger-explosives-2", {type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25})
krastorio.technologies.addEffect("stronger-explosives-3", {type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.25})
krastorio.technologies.addEffect("stronger-explosives-4", {type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35})
krastorio.technologies.addEffect("stronger-explosives-5", {type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35})
krastorio.technologies.addEffect("stronger-explosives-6", {type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.35})
krastorio.technologies.addEffect("stronger-explosives-7", {type = "ammo-damage", ammo_category = "heavy-rocket", modifier = 0.1})

krastorio.technologies.addEffect("weapon-shooting-speed-2", {type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-3", {type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-4", {type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-5", {type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2})
krastorio.technologies.addEffect("weapon-shooting-speed-6", {type = "gun-speed", ammo_category = "heavy-rocket", modifier = 0.2})

-- Technology for impulse rifle

krastorio.technologies.addEffect("energy-weapons-damage-1", {type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.25})
krastorio.technologies.addEffect("energy-weapons-damage-2", {type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.25})
krastorio.technologies.addEffect("energy-weapons-damage-3", {type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.25})
krastorio.technologies.addEffect("energy-weapons-damage-4", {type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.35})
krastorio.technologies.addEffect("energy-weapons-damage-5", {type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.35})
krastorio.technologies.addEffect("energy-weapons-damage-6", {type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.35})
krastorio.technologies.addEffect("energy-weapons-damage-7", {type = "ammo-damage", ammo_category = "impulse-rifle", modifier = 0.1})

krastorio.technologies.addEffect("laser-turret-speed-1", {type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2})
krastorio.technologies.addEffect("laser-turret-speed-2", {type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2})
krastorio.technologies.addEffect("laser-turret-speed-3", {type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2})
krastorio.technologies.addEffect("laser-turret-speed-4", {type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2})
krastorio.technologies.addEffect("laser-turret-speed-5", {type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.2})
krastorio.technologies.addEffect("laser-turret-speed-6", {type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.25})
krastorio.technologies.addEffect("laser-turret-speed-7", {type = "gun-speed", ammo_category = "impulse-rifle", modifier = 0.25})
