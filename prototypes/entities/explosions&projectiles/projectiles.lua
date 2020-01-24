data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
   
	{
    type = "projectile",
    name = "heavy-explosive-rocket-projectile",
    --flags = {"not-on-map"},
    reveal_map = true,
    map_color = {r=1, g=0, b=0},
    acceleration = 0.075,
	action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
			{
				type = "create-trivial-smoke",
				smoke_name = "artillery-smoke",
				initial_height = 0,
				speed_from_center = 0.05,
				speed_from_center_deviation = 0.005,
				offset_deviation = {{-4, -4}, {4, 4}},
				max_radius = 12,
				repeat_count = 4 * 4 * 15
           },
           {
				type = "create-entity",
				entity_name = "small-scorchmark",
				check_buildability = true
           },
		   {
				repeat_count = 100,
				type = "create-trivial-smoke",
				smoke_name = "nuclear-smoke",
				offset_deviation = {{-1, -1}, {1, 1}},
				starting_frame = 3,
				starting_frame_deviation = 5,
				starting_frame_speed = 0,
				starting_frame_speed_deviation = 5,
				speed_from_center = 0.75
          },
          {
				type = "create-entity",
				entity_name = "big-explosion"
          },
          {
				type = "create-entity",
				entity_name = "big-artillery-explosion"
          },
          {
				type = "show-explosion-on-chart",
				scale = 1
          },
          {
				type = "nested-result",
				action =
            {
				type = "area",
				target_entities = false,
				trigger_from_target = true,
				repeat_count = 50,
				radius = 12,
				action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.35
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
	},
  
-----------------------------------------------------------------------------------------------------------------
  
	{
    type = "projectile",
    name = "antimatter-rocket-projectile",
    --flags = {"not-on-map"},
    reveal_map = true,
    map_color = {r=0, g=0, b=1},
    acceleration = 0.01,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
              repeat_count = 250,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-1, -1}, {1, 1}},
              starting_frame = 3,
              starting_frame_deviation = 5,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 1
          },
          {
            type = "create-entity",
            entity_name = "big-matter-explosion"
          },
          {
            type = "damage",
            damage = {amount = 5000, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "show-explosion-on-chart",
            scale = 7
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2000,
              radius = 75,
              action_delivery =
              {
                type = "projectile",
                projectile = "matter-wave",
                starting_speed = 0.5
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
  
  
   
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
   
	{
    type = "artillery-projectile",
    name = "antimatter-artillery-projectile",
    flags = {"not-on-map"},
    acceleration = 0,
    direction_only = true,
    reveal_map = true,
    map_color = {r=1, g=1, b=0},
    picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
      width = 64,
      height = 64,
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
      width = 64,
      height = 64,
      scale = 0.5
    },
    chart_picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.25
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
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
            entity_name = "big-matter-explosion"
          },
          {
            type = "damage",
            damage = {amount = 5000, type = "explosion"}
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 250,
              radius = 16,
              action_delivery =
              {
                type = "projectile",
                projectile = "matter-wave",
                starting_speed = 0.25
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "big-artillery-explosion"
          },
          {
            type = "show-explosion-on-chart",
            scale = 2
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
    height_from_ground = 280 / 64
	},
   
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
   
    {
    type = "projectile",
    name = "matter-wave",
    flags = {"not-on-map"},
    acceleration = 0,
    action =
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
              entity_name = "matter-explosion"
            }
          }
        }
      },
      {
        type = "area",
        radius = 6,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = {amount = 3000, type = "explosion"}
          }
        }
      }
    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
    },
   
------------------------------------------------
------------------------------------------------
   
    {
    type = "projectile",
    name = "basic-railgun-projectile",
    flags = {"not-on-map"},
    -- collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0.25,
    -- direction_only = true,
    piercing_damage = 1000,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 2000 , type = "physical"}
          },
          {
            type = "damage",
            damage = {amount = 500 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/railbullet.png",
      frame_count = 1,
      width = 5,
      height = 90,
      priority = "high"
    },
    },
   
    {
    type = "projectile",
    name = "explosion-railgun-projectile",
    flags = {"not-on-map"},
    -- collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0.25,
    -- direction_only = true,
    piercing_damage = 1000,
     action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 2000, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {

          {
            type = "create-entity",
            entity_name = "big-explosion"
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
              radius = 4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 2000, type = "explosion"}
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
      }
    },
    animation =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/missile-e.png",
      frame_count = 1,
      width = 5,
      height = 90,
      priority = "high"
    },
    },

	{
    type = "projectile",
    name = "matter-railgun-projectile",
    flags = {"not-on-map"},
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0.25,
    --direction_only = true,
    piercing_damage = 1000,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 2000 , type = "physical"}
          },
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
		  {
            type = "create-entity",
            entity_name = "rail-matter-explosion"
          },
		  {
              repeat_count = 50,
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
			type = "show-explosion-on-chart",
			scale = 1
		  },
		  {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10,
              radius = 6,
              action_delivery =
              {
                type = "projectile",
                projectile = "matter-wave",
                starting_speed = 0.5
              }
            }
		   },
           {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 6,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 2000, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "rail-matter-explosion"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/missile-m.png",
      frame_count = 1,
      width = 10,
      height = 167,
      priority = "high"
    },
	},
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

	{
    type = "projectile",
    name = "explosion-turret-rocket-projectile",
    flags = {"not-on-map"},
    acceleration = 0.1,
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
            entity_name = "big-explosion"
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
              radius = 8,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 3000, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  },
				  {
					type = "show-explosion-on-chart",
					scale = 0.5
				  }
                }
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/rocket.png",
      frame_count = 5,
      line_length = 5,
      width = 13,
      height = 100,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/rocket-shadow.png",
      frame_count = 1,
      width = 12,
      height = 40,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
    },
	
	{
    type = "projectile",
    name = "nuclear-turret-rocket-projectile",
    flags = {"not-on-map"},
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0.1,
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
              repeat_count = 50,
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
            entity_name = "big-explosion"
          },
          {
            type = "damage",
            damage = {amount = 3500, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "show-explosion-on-chart",
            scale = 2
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 500,
              radius = 20,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.25
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/rocket-n.png",
      frame_count = 5,
      line_length = 5,
      width = 13,
      height = 100,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/rocket-shadow.png",
      frame_count = 1,
      width = 12,
      height = 40,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
    },

	{
    type = "projectile",
    name = "matter-turret-rocket-projectile",
    flags = {"not-on-map"},
    acceleration = 0.1,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
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
            entity_name = "big-matter-explosion"
          },
          {
            type = "damage",
            damage = {amount = 5000, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
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
              repeat_count = 500,
              radius = 25,
              action_delivery =
              {
                type = "projectile",
                projectile = "matter-wave",
                starting_speed = 0.25
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/rocket-m.png",
      frame_count = 5,
      line_length = 5,
      width = 13,
      height = 100,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__Krastorio-graphics__/graphics/entity/turrets/rocket-shadow.png",
      frame_count = 1,
      width = 12,
      height = 40,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
}
)