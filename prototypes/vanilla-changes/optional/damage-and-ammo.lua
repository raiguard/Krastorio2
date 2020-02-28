-- -- Rebalance all damage done by player weapons (Turrets, ammo...)
if krastorio.general.getSafeSettingValue("kr-damage-and-ammo") then

	-----------------------------------------------------------------------------
	-- -- -- Turrets
	-----------------------------------------------------------------------------

	-- Artillery wagon gun
	data.raw["artillery-turret"]["artillery-turret"].turn_after_shooting_cooldown = 120
	data.raw["artillery-turret"]["artillery-turret"].manual_range_modifier = 5
   
	data.raw["artillery-wagon"]["artillery-wagon"].turn_after_shooting_cooldown = 120
	data.raw["artillery-wagon"]["artillery-wagon"].manual_range_modifier = 3.5

	data.raw.gun["artillery-wagon-cannon"].attack_parameters.min_range = 3 * 32
	data.raw.gun["artillery-wagon-cannon"].attack_parameters.cooldown = 300

	-- Vehicles guns
	data.raw.gun["vehicle-machine-gun"].attack_parameters.cooldown = 8
	data.raw.gun["vehicle-machine-gun"].attack_parameters.damage_modifier = 1.25
	data.raw.gun["tank-machine-gun"].attack_parameters.cooldown = 8
	data.raw.gun["tank-machine-gun"].attack_parameters.damage_modifier = 1.25
	data.raw.gun["tank-cannon"].attack_parameters.cooldown = 120
	data.raw.gun["rocket-launcher"].attack_parameters.cooldown = 60
	data.raw.gun["pistol"].attack_parameters.cooldown = 20

	-- Gun turret
	data.raw["ammo-turret"]["gun-turret"].attack_parameters.cooldown = 10
	data.raw["ammo-turret"]["gun-turret"].attack_parameters.call_for_help_radius = 25
	data.raw["ammo-turret"]["gun-turret"].max_health = 500

	-- Laser turret
	data.raw["electric-turret"]["laser-turret"].max_health = 500 -- nerf /2
	data.raw["electric-turret"]["laser-turret"].call_for_help_radius = 35 -- nerf -5
	data.raw["electric-turret"]["laser-turret"].energy_source = -- nerf x2
	{
		type = "electric",
		buffer_capacity = "1602kJ",
		input_flow_limit = "19200kW",
		drain = "48kW",
		usage_priority = "primary-input"
    }

	data.raw["electric-turret"]["laser-turret"].attack_parameters = -- boost range +5 and damage x2
	{
		ammo_type = 
		{	
			action = 
			{
				action_delivery = 
				{
					beam = "laser-beam",
					duration = 10,
					max_length = 35,
					source_offset = 
					{
						0,
						-1.3143899999999999
					},
					type = "beam"
				},
				type = "direct"
			},
			category = "laser-turret",
			energy_consumption = "800kJ"
		},
		cooldown = 20,
		damage_modifier = 4,
		range = 30,
		source_direction_count = 64,
		source_offset = 
		{
			0,
			-0.85587225
		},
		type = "beam",
		sound =
		{
			filename = "__base__/sound/fight/pulse.ogg",
			volume = 0.75
		}
	}	

	data.raw.recipe["gun-turret"].energy_required = 10
	data.raw.recipe["flamethrower-turret"].energy_required = 20
	data.raw.recipe["laser-turret"].energy_required = 60
	data.raw.recipe["artillery-turret"].energy_required = 120
   
	-----------------------------------------------------------------------------
	-- -- -- Projectile
	-----------------------------------------------------------------------------

	-- Projectile accelerations
	data.raw.projectile["cannon-projectile"].acceleration = 0.1
	data.raw.projectile["cannon-projectile"].light = {intensity = 0.45, size = 8, color = {r=0.8, g=0.8, b=0.8}}
	data.raw.projectile["explosive-cannon-projectile"].acceleration = 0.1
	data.raw.projectile["explosive-cannon-projectile"].light = {intensity = 0.45, size = 8, color = {r=1.0, g=0.75, b=0.75}}
	data.raw.projectile["uranium-cannon-projectile"].acceleration = 0.1
	data.raw.projectile["uranium-cannon-projectile"].light = {intensity = 0.45, size = 8, color = {r=0.5, g=0.75, b=0.75}}
	data.raw.projectile["explosive-uranium-cannon-projectile"].acceleration = 0.1
	data.raw.projectile["explosive-uranium-cannon-projectile"].light = {intensity = 0.45, size = 8, color = {r=0.5, g=1.0, b=0.75}}
    
	-- Grenade (normal)
	data.raw["projectile"]["grenade"].action =
    {
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "medium-explosion"
					},
					{
						type = "show-explosion-on-chart",
						scale = 0.5
					},
					{
						type = "create-entity",
						entity_name = "small-scorchmark",
						check_buildability = true
					}
				}
			}
		},
		{
			type = "area",
			radius = 6.5,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "damage",
						damage = {amount = 100, type = "explosion"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
					}
				}
			}
		}
    }

	-- Artillery projectile
	data.raw["artillery-projectile"]["artillery-projectile"].action.action_delivery.target_effects =
	{
		{
			type = "nested-result",
			action =
			{
				type = "area",
				radius = 8.0,
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "damage",
							damage = {amount = 1000 , type = "physical"}
						},
						{
							type = "damage",
							damage = {amount = 1000 , type = "explosion"}
						}
					}
				}
			}
		},
		{
			type = "create-trivial-smoke",
			smoke_name = "artillery-smoke",
			initial_height = 0,
			speed_from_center = 0.05,
			speed_from_center_deviation = 0.005,
			offset_deviation = {{-4, -4}, {4, 4}},
			max_radius = 5,
			repeat_count = 4 * 4 * 15
		},
		{
			type = "create-entity",
			entity_name = "big-artillery-explosion"
		},
		{
			type = "show-explosion-on-chart",
			scale = 1
		}
	}

	-- Rocket
	data.raw["projectile"]["rocket"].acceleration = 0.05
	data.raw["projectile"]["rocket"].light = {intensity = 0.45, size = 8, color = {r=0.8, g=0.8, b=0.8}}
	data.raw["projectile"]["rocket"].action.action_delivery.target_effects =
	{
		{
			type = "create-entity",
			entity_name = "explosion"
		},
		{
			type = "damage",
			damage = {amount = 300, type = "explosion"}
		},
		{
			type = "create-entity",
			entity_name = "small-scorchmark",
			check_buildability = true
		}
	}
	
	-- Explosive rocket
	data.raw["projectile"]["explosive-rocket"].acceleration = 0.05
	data.raw["projectile"]["explosive-rocket"].light = {intensity = 0.45, size = 8, color = {r=1, g=0.75, b=0.8}}
	data.raw["projectile"]["explosive-rocket"].action.action_delivery.target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "damage",
            damage = {amount = 75, type = "explosion"}
          },
		  {
			type = "show-explosion-on-chart",
			scale = 0.5
		  },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 6.5,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 200, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            }
          }
        }


	data.raw["projectile"]["atomic-rocket"].acceleration = 0.01
	data.raw["projectile"]["atomic-rocket"].light = {intensity = 0.45, size = 9, color = {r=0.5, g=1, b=0.75}}
	data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects =
	{
		{
			repeat_count = 100,
			type = "create-trivial-smoke",
			smoke_name = "nuclear-smoke",
			offset_deviation = {{-1, -1}, {1, 1}},
			starting_frame = 3,
			starting_frame_deviation = 5,
			starting_frame_speed = 0,
			starting_frame_speed_deviation = 5,
			speed_from_center = 0.5
		},
		{
			type = "create-entity",
			entity_name = "explosion"
		},
		{
			type = "damage",
			damage = {amount = 1500, type = "explosion"}
		},
		{
			type = "damage",
			damage = {amount = 1500, type = "radioactive"}
		},
		{
			type = "create-entity",
			entity_name = "big-artillery-explosion",
			check_buildability = true
		},
		{
			type = "show-explosion-on-chart",
			scale = 3
		},
		{
			type = "nested-result",
			action =
			{
				type = "area",
				target_entities = false,
				trigger_from_target = true,
				repeat_count = 2000,
				radius = 50,
				action_delivery =
				{
					type = "projectile",
					projectile = "atomic-bomb-wave",
					starting_speed = 0.5
				}
			}
		}
	}
	data.raw["projectile"]["atomic-bomb-wave"].action = 
	{
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "explosion"
					}
				}
			}
		},
		{
			type = "area",
			radius = 3,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "damage",
						damage = {amount = 200, type = "explosion"}
					},
					{
						type = "damage",
						damage = {amount = 200, type = "radioactive"}
					}
				}
			}
		}
    }

	-----------------------------------------------------------------------------
	-- -- -- AMMO
	
	data.raw.ammo["atomic-bomb"].ammo_type.category = "heavy-rocket"
	data.raw.ammo["atomic-bomb"].ammo_type.range_modifier = 1
	data.raw.ammo["atomic-bomb"].ammo_type.cooldown_modifier = 3
	

	-- Firearm magazine (normal ammo)
	data.raw["ammo"]["firearm-magazine"].ammo_type.action =
	{
		type = "direct",
		action_delivery =
		{
			{
				type = "instant",
				source_effects =
				{
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				},
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "explosion-hit",
						offsets = {{0, 1}},
						offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
					},
					{
						type = "damage",
						damage = { amount = 8 , type = "physical"}
					}
				}
			}
		}
	}

	-- Piercing rounds magazine
	data.raw["ammo"]["piercing-rounds-magazine"].ammo_type.action.action_delivery =
	{
		type = "instant",
		source_effects =
		{
			type = "create-explosion",
			entity_name = "explosion-gunshot"
		},
		target_effects =
		{
			{
				type = "create-entity",
				entity_name = "explosion-hit",
				offsets = {{0, 1}},
				offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
			},
			{
				type = "damage",
				damage = { amount = 12, type = "physical"}
			}
		}
	}
	
	-- Uranium rounds magazine
	data.raw["ammo"]["uranium-rounds-magazine"].ammo_type.action.action_delivery =
	{
		type = "instant",
		source_effects =
		{
			type = "create-explosion",
			entity_name = "explosion-gunshot"
		},
		target_effects =
		{
			{
				type = "create-entity",
				entity_name = "explosion-hit",
				offsets = {{0, 1}},
				offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
			},
			{
				type = "damage",
				damage = { amount = 9, type = "physical"}
			},
			{
				type = "damage",
				damage = { amount = 9, type = "radioactive"}
			}
		}
	}

	data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	-----------------------------------------------------------------------------
   
end