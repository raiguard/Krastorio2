local flib_bounding_box = require("__flib__.bounding-box")
local flib_math = require("__flib__.math")
local flib_position = require("__flib__.position")

-- local biter_virus_evolution_multiplier = 0.67

-- local virus_iteration_counts = {
--   [1000] = 20,
--   [5000] = 40,
--   [10000] = 80,
--   [20000] = 160,
--   [30000] = 280,
--   [40000] = 300,
--   [50000] = 400,
--   [flib_math.max_int53] = 800,
-- }

-- --- Modifier to change the quantity of objects iterated for each round of the function, based on the total
-- --- @param count number
-- local function get_removal_count(count)
--   for limit, per in pairs(virus_iteration_counts) do
--     if count <= limit then
--       return per
--     end
--   end
-- end

-- --- @param virus_data BiterVirusData
-- local function iterate_biter_virus(virus_data)
--   local surface = virus_data.surface
--   if not surface or not surface.valid then
--     storage.virus.biter[surface.index] = nil
--     return
--   end

--   local entities = virus_data.entities
--   local entities_killed = virus_data.entities_killed
--   local entities_to_kill = virus_data.entities_to_kill
--   local force = virus_data.force
--   local len = virus_data.entities_len

--   -- Kill some entities
--   for _ = 1, virus_data.amount_per_iteration do
--     if entities_killed >= entities_to_kill then
--       storage.virus.biter[surface.index] = nil
--       break
--     end

--     local i = math.random(1, len)
--     local entity = entities[i]
--     if entity and entity.valid then
--       entity.die(force)

--       -- Move the element at the end to the gap
--       -- This removes the element at `i` while achieving O(1) performance
--       entities[i] = entities[len]
--       entities[len] = nil

--       entities_killed = entities_killed + 1
--       len = len - 1
--     end
--   end

--   virus_data.entities_killed = entities_killed
--   virus_data.tiles_len = len
-- end

-- --- @param player LuaPlayer
-- --- @param surface LuaSurface
-- local function init_biter_virus(player, surface)
--   local biter_viruses = storage.virus.biter
--   if not biter_viruses[surface.index] then
--     -- Reduce evolution factor
--     local enemy = game.forces.enemy
--     enemy.set_evolution_factor(enemy.get_evolution_factor(surface) * biter_virus_evolution_multiplier, surface)

--     -- Begin gradual enemy killoff
--     local enemy_entities = surface.find_entities_filtered({ force = "enemy" })
--     local len = #enemy_entities
--     if len > 0 then
--       biter_viruses[surface.index] = {
--         amount_per_iteration = math.ceil(len / get_removal_count(len)),
--         entities = enemy_entities,
--         entities_killed = 0,
--         entities_len = len,
--         entities_to_kill = len / 2.5,
--         force = player.force,
--         surface = surface,
--       }
--     end
--   end
-- end

-- Plan:
-- Create a spiral chunk iterator from the point at which the virus was thrown.
-- Destroy a certain % of the enemy units and buildings on each chunk, which gives diminishing returns as the number grows smaller.
-- If new chunks are created during iteration... oh well. By design, you need to use a bunch of viruses to totally remove the biters.

--- @class SpiralChunkIterator
--- @field delta ChunkPosition
--- @field origin ChunkPosition
--- @field position ChunkPosition
--- @field iteration integer
--- @field max_iterations integer
--- @field radius_x integer
--- @field radius_y integer

--- Based on https://stackoverflow.com/questions/398299/looping-in-a-spiral
--- @param it SpiralChunkIterator
--- @return ChunkPosition?
local function spiral(it)
  it.iteration = it.iteration + 1
  if it.iteration >= it.max_iterations then
    return
  end
  --- @type ChunkPosition?
  local to_return
  if
    (-it.radius_x <= it.position.x and it.position.x < it.radius_x)
    and (-it.radius_y <= it.position.y and it.position.y < it.radius_y)
  then
    to_return = flib_position.add(it.position, it.origin)
  end
  if
    it.position.x == it.position.y
    or (it.position.x < 0 and it.position.x == -it.position.y)
    or (it.position.x > 0 and it.position.x == 1 - it.position.y)
  then
    it.delta.x, it.delta.y = -it.delta.y, it.delta.x
  end
  it.position = flib_position.add(it.position, it.delta)
  return to_return
end

--- @param origin ChunkPosition
--- @param radii ChunkPosition
--- @return SpiralChunkIterator
local function new_spiral(origin, radii)
  return {
    delta = { x = 0, y = -1 },
    origin = origin,
    position = { x = 0, y = 0 },
    iteration = 0,
    max_iterations = math.max(radii.x * 2 + 1, radii.y * 2 + 1) ^ 2,
    radius_x = radii.x,
    radius_y = radii.y,
  }
end

--- @param e EventData.on_player_used_capsule
local function on_player_used_capsule(e)
  local item = e.item
  if not item or not item.valid or item.name ~= "kr-biter-virus" then
    return
  end

  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  rendering.clear("Krastorio2")

  --- @type BoundingBox
  local surface_box = { left_top = { x = 0, y = 0 }, right_bottom = { x = 0, y = 0 } }
  for chunk in player.surface.get_chunks() do
    if player.surface.is_chunk_generated({ chunk.x, chunk.y }) then
      surface_box = flib_bounding_box.expand_to_contain_position(surface_box, { chunk.x + 0.5, chunk.y + 0.5 })
      rendering.draw_rectangle({
        color = { r = 0.5, a = 0.5 },
        filled = true,
        left_top = { chunk.x, chunk.y },
        right_bottom = { chunk.x + 1, chunk.y + 1 },
        surface = player.surface_index,
      })
    end
  end
  surface_box = flib_bounding_box.ceil(surface_box)
  rendering.draw_rectangle({
    color = { r = 1, g = 1, b = 1 },
    width = 3,
    left_top = surface_box.left_top,
    right_bottom = surface_box.right_bottom,
    surface = player.surface,
  })
  local origin = flib_position.to_chunk(e.position)
  local radii = {
    x = (math.max(math.abs(surface_box.left_top.x), math.abs(surface_box.right_bottom.x)) + math.abs(origin.x)),
    y = (math.max(math.abs(surface_box.left_top.y), math.abs(surface_box.right_bottom.y)) + math.abs(origin.y)),
  }
  local extents_box = flib_bounding_box.from_dimensions(origin, radii.x * 2, radii.y * 2)
  rendering.draw_rectangle({
    color = { g = 1, b = 1 },
    width = 3,
    left_top = extents_box.left_top,
    right_bottom = extents_box.right_bottom,
    surface = player.surface,
  })

  local color = { r = 0, g = 255 }
  local prev_x, prev_y
  local it = new_spiral(origin, radii)
  while it.iteration < it.max_iterations do
    local chunk_pos = spiral(it)
    if chunk_pos then
      if player.surface.is_chunk_generated(chunk_pos) then
        if prev_x and prev_y then
          rendering.draw_line({
            color = color,
            width = 3,
            from = { prev_x + 0.5, prev_y + 0.5 },
            to = { chunk_pos.x + 0.5, chunk_pos.y + 0.5 },
            surface = player.surface,
          })
          color.r = math.min(color.r + 1, 255)
        end
        prev_x = chunk_pos.x
        prev_y = chunk_pos.y
      else
        rendering.draw_circle({
          color = { b = 1 },
          radius = 0.2,
          filled = true,
          target = { chunk_pos.x + 0.5, chunk_pos.y + 0.5 },
          surface = player.surface,
        })
      end
    end
  end
end

local virus = {}

function virus.on_init()
  --- @type table<uint, BiterVirusData>
  storage.biter_viruses = {}
end

virus.events = {
  [defines.events.on_player_used_capsule] = on_player_used_capsule,
}

return virus
