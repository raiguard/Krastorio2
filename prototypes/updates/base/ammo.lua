data.raw.ammo["atomic-bomb"].ammo_category = "heavy-rocket"
data.raw.ammo["atomic-bomb"].ammo_type.range_modifier = 1
data.raw.ammo["atomic-bomb"].ammo_type.cooldown_modifier = 3

-- Firearm magazine (normal ammo)
data.raw["ammo"]["firearm-magazine"].ammo_type.action = {
  type = "direct",
  action_delivery = {
    {
      type = "instant",
      source_effects = {
        {
          type = "create-explosion",
          entity_name = "explosion-gunshot",
        },
      },
      target_effects = {
        {
          type = "create-entity",
          entity_name = "explosion-hit",
          offsets = { { 0, 1 } },
          offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        },
        {
          type = "damage",
          damage = { amount = 8, type = "physical" },
        },
      },
    },
  },
}

-- Piercing rounds magazine
data.raw["ammo"]["piercing-rounds-magazine"].ammo_type.action.type = "direct"
data.raw["ammo"]["piercing-rounds-magazine"].ammo_type.action.action_delivery = {
  type = "instant",
  source_effects = {
    type = "create-explosion",
    entity_name = "explosion-gunshot",
  },
  target_effects = {
    {
      type = "create-entity",
      entity_name = "explosion-hit",
      offsets = { { 0, 1 } },
      offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    },
    {
      type = "damage",
      damage = { amount = 12, type = "physical" },
    },
  },
}

-- Uranium rounds magazine
data.raw["ammo"]["uranium-rounds-magazine"].ammo_type.action.type = "direct"
data.raw["ammo"]["uranium-rounds-magazine"].ammo_type.action.action_delivery = {
  type = "instant",
  source_effects = {
    type = "create-explosion",
    entity_name = "explosion-gunshot",
  },
  target_effects = {
    {
      type = "create-entity",
      entity_name = "explosion-hit",
      offsets = { { 0, 1 } },
      offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    },
    {
      type = "damage",
      damage = { amount = 9, type = "physical" },
    },
    {
      type = "damage",
      damage = { amount = 9, type = "radioactive" },
    },
  },
}

data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 50
data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
