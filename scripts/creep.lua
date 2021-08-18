local creep = {}

-- We can safely assume that all of the entities will be on the same surface
local function generate_creep(entities)
  local radius = math.random(4, 10)
  local surface = entities[1].surface
  local to_add = {}
  local i = 0
  for _, entity in pairs(entities) do
    for _, tile in pairs(surface.find_tiles_filtered{position = entity.position, radius = radius}) do
      i = i + 1
      to_add[i] = {position = tile.position, name = "kr-creep"}
    end
  end
  surface.set_tiles(to_add)
end

function creep.init()
  global.creep = {}
end

function creep.on_biter_base_built(entity)
  generate_creep{entity}
end

function creep.on_chunk_generated(chunk_area, surface)
  local entities = surface.find_entities_filtered(
    {type = {"turret", "unit-spawner"}, area = chunk_area, force = "enemy"}
  )

  for _, entity in pairs(entities) do
    generate_creep{entity}
  end
end

return creep
