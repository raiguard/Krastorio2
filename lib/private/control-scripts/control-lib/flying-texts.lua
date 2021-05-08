krastorio.flying_texts = {}

function krastorio.flying_texts.showOnSurfaceText(tag)
  -- Error handlers
  if not tag then error("You shouldn't be creating a tag without any parameters.") end
  if not tag.entity then error("No entity to follow for tag.") end
  if not tag.entity.valid then error("Well the entity wasn't valid to create a tag.") end
  -- Calculate position
  if not tag.position then
    if not tag.offset then
      tag.offset = {x = 0, y = 0}
    else
      if not tag.offset.x then tag.offset.x = tag.offset[1] or 0 end
      if not tag.offset.y then tag.offset.y = tag.offset[2] or 0 end
    end
    tag.position = {x = tag.entity.position.x + tag.offset.x, y = tag.entity.position.y + tag.offset.y}
  end
  -- Create text on surface
  tag.entity.surface.create_entity
  {
    type         = "flying-text",
    name         = "flying-text",
    position     = tag.position,
    text         = tag.text or tag.entity.localised_name,
    color        = tag.color or {},
    time_to_live = tag.time_to_live or 200,
    speed        = tag.speed or 200
  }
end