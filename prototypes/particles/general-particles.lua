local default_ended_in_water_trigger_effect = function()
  return {
    type = "create-entity",
    entity_name = "water-splash",
  }
end

local make_particle = function(params)
  if not params then
    error("No params given to make_particle function")
  end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle = {
    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,

    mining_particle_frame_speed = params.mining_particle_frame_speed,
  }

  return particle
end

data:extend({
  make_particle({
    name = "kr-welding-particle",
    pictures = {
      layers = {
        {
          filename = kr_particles_path .. "welding/welding.png",
          priority = "extra-high",
          width = 200,
          height = 200,
          frame_count = 30,
          line_length = 6,
          animation_speed = 0.75,
          variation_count = 1,
          scale = 0.5,
        },
        {
          filename = kr_particles_path .. "welding/welding.png",
          priority = "extra-high",
          width = 200,
          height = 200,
          frame_count = 30,
          line_length = 6,
          animation_speed = 0.75,
          variation_count = 1,
          scale = 0.5,
          blend_mode = "additive-soft",
        },
        {
          filename = kr_particles_path .. "welding/welding.png",
          priority = "extra-high",
          width = 200,
          height = 200,
          frame_count = 30,
          line_length = 6,
          animation_speed = 0.75,
          variation_count = 1,
          scale = 0.5,
          blend_mode = "additive-soft",
        },
      },
    },
    life_time = 30,
  }),
})
