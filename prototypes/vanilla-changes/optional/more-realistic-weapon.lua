-- -- -- Vehicles minable changes
if krastorio.general.getSafeSettingValue("kr-more-realistic-weapon") then





	--data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	--data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	--data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	--data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
	--data.raw.gun["artillery-wagon-cannon"].attack_parameters.range = 6 * 32
	--data.raw.gun["vehicle-machine-gun"].attack_parameters.range = 25
	--data.raw.gun["tank-machine-gun"].attack_parameters.range = 25
	--data.raw.gun["tank-cannon"].attack_parameters.range = 40
	--data.raw.gun["rocket-launcher"].attack_parameters.range = 45

	--data.raw["ammo-turret"]["gun-turret"].attack_parameters.range = 22
	

	
data.raw.gun["submachine-gun"].attack_parameters.range = 50
data.raw.gun["submachine-gun"].attack_parameters.movement_slow_down_factor = 0.25
	
data.raw.gun["pistol"].attack_parameters.range = 30
data.raw.gun["pistol"].attack_parameters.cooldown = 20
data.raw.gun["pistol"].attack_parameters.movement_slow_down_factor = 0.15
	
data:extend(
{
	
	
{
	type = "ammo",
	name = "firearm-magazine",
	icon = kr_mip_icons_path .. "ammo/pistol-ammo-1.png",
	icon_size = 64,
	icon_mipmaps = 4,
	pictures =
	{
		{ size = 64, filename = kr_mip_icons_path .. "ammo/pistol-ammo-1.png",   scale = 0.25, mipmap_count = 4 },
	},
  ammo_type =
  {
    category = "bullet",
	target_type = "position",
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          {
			type = "projectile",
			projectile = "zzz",
			starting_speed = 1.2,
			direction_deviation = 0.1,
			range_deviation = 0.1,
			max_range = 40,
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        }
      }
    }
  },
  magazine_size = 10,
  subgroup = "ammo",
  order = "a[basic-clips]-a[firearm-magazine]",
  stack_size = 200
},
	
	
	
    {
      type = "projectile",
      name = "zzz",
      flags = {"not-on-map"},
      collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
      acceleration = -0.015,
      --direction_only = true,
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
        {
              {
                type = "create-entity",
                entity_name = "explosion-hit"
              },
              {
                type = "damage",
                damage = { amount = 5 , type = "physical"}
              }
        }
        }
      },
      animation =
      {
        filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high"
      },
      shadow =
      {
        filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true
      },
      hit_at_collision_position = true,
      force_condition = "not-same",
      light = {intensity = 0.6, size = 4, color = {r=1.0, g=1.0, b=0.5}},
    }	

	
	
	
	
	
	
	
})








	
end

	