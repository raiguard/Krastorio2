local impulse_rifle_shot_sound = {
  variations = {
    {
      filename = kr_weapons_sounds_path .. "impulse-shot-1.ogg",
      volume = 0.85,
    },
    {
      filename = kr_weapons_sounds_path .. "impulse-shot-2.ogg",
      volume = 0.85,
    },
    {
      filename = kr_weapons_sounds_path .. "impulse-shot-3.ogg",
      volume = 0.85,
    },
  },
  aggregation = {
    max_count = 2,
    remove = false,
    count_already_playing = true,
  },
}

data:extend({
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "gun",
    name = "impulse-rifle",
    icon = kr_guns_icons_path .. "impulse-rifle.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "gun",
    order = "c2[impulse-rifle]",
    attack_parameters = {
      type = "projectile",
      ammo_category = "impulse-rifle",
      cooldown = 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 0.6,
      fire_penalty = 1,
      range = 50,
      sound = impulse_rifle_shot_sound,
    },
    stack_size = 10,
  },
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "gun",
    name = "heavy-rocket-launcher",
    icon = kr_guns_icons_path .. "heavy-rocket-launcher.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "gun",
    order = "d[heavy-rocket-launcher]",
    attack_parameters = {
      type = "projectile",
      ammo_category = "heavy-rocket",
      movement_slow_down_factor = 0.75,
      cooldown = 180,
      projectile_creation_distance = 0.6,
      range = 90,
      projectile_center = { -0.17, 0 },
      sound = {
        {
          filename = kr_weapons_sounds_path .. "rocket-launch.ogg",
          volume = 1,
        },
      },
    },
    stack_size = 5,
  },
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "gun",
    name = "dolphin-gun",
    icon = kr_guns_icons_path .. "dolphin-gun.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "other",
    flags = { "hidden" },
    --subgroup = "gun",
    --order = "z[dolphin-gun]",
    attack_parameters = {
      type = "projectile",
      ammo_category = "heavy-rocket",
      movement_slow_down_factor = 0.35,
      cooldown = 90,
      projectile_creation_distance = 0.6,
      range = 100,
      projectile_center = { -0.17, 0 },
      sound = {
        {
          filename = kr_weapons_sounds_path .. "dolphin-gun.ogg",
          volume = 1,
        },
      },
    },
    stack_size = 1,
  },
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "gun",
    name = "kr-accelerator",
    icon = kr_guns_icons_path .. "accelerator.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-a[pistol]",
    attack_parameters = {
      type = "projectile",
      ammo_category = "bullet",
      damage_modifier = 5,
      cooldown = 7.5,
      movement_slow_down_factor = 0.1,
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
      range = 22,
      sound = {
        {
          filename = kr_weapons_sounds_path .. "accelerator.ogg",
          volume = 0.3,
        },
      },
    },
    stack_size = 1,
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
