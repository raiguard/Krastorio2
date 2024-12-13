data.raw["ammo-turret"]["gun-turret"].attack_parameters.cooldown = 10
data.raw["ammo-turret"]["gun-turret"].attack_parameters.call_for_help_radius = 25
data.raw["ammo-turret"]["gun-turret"].max_health = 500

data.raw["artillery-turret"]["artillery-turret"].turn_after_shooting_cooldown = 120
data.raw["artillery-turret"]["artillery-turret"].manual_range_modifier = 5

data.raw["artillery-wagon"]["artillery-wagon"].turn_after_shooting_cooldown = 120
data.raw["artillery-wagon"]["artillery-wagon"].manual_range_modifier = 3.5

data.raw["electric-turret"]["laser-turret"].max_health = 500 -- nerf /2
data.raw["electric-turret"]["laser-turret"].call_for_help_radius = 35 -- nerf -5
data.raw["electric-turret"]["laser-turret"].energy_source = { -- nerf x2
  type = "electric",
  buffer_capacity = "2000kJ",
  input_flow_limit = "4000kW",
  drain = "100kW",
  usage_priority = "primary-input",
}
data.raw["electric-turret"]["laser-turret"].attack_parameters = {
  type = "beam",
  cooldown = 30,
  range = 30,
  source_direction_count = 64,
  source_offset = { 0, -3.423489 / 4 },
  damage_modifier = 3,
  ammo_category = "laser",
  ammo_type = {
    energy_consumption = "975kJ",
    action = {
      type = "direct",
      action_delivery = {
        type = "beam",
        beam = "laser-beam",
        max_length = 30,
        duration = 30,
        source_offset = { 0, -1.31439 },
      },
    },
  },
}
