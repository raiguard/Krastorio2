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

--- @class BiterVirusData
--- @field active BiterVirusKillData[]
--- @field to_iterate ChunkPositionAndDistance[]
--- @field surface LuaSurface

--- @class BiterVirusKillData
--- @field box BoundingBox
--- @field entities LuaEntity[]
--- @field to_kill integer

--- @class ChunkPositionAndDistance
--- @field distance number
--- @field position ChunkPosition

-- Plan:
-- Iterate chunks starting from the origin and progressively getting further away.
-- Destroy a certain % of the enemy units and buildings on each chunk, which gives diminishing returns as the number grows smaller.
-- If new chunks are created during iteration... oh well. By design, you need to use a bunch of viruses to totally remove the biters.

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

  local profiler = helpers.create_profiler()
  local origin = flib_position.to_chunk(e.position)
  --- @type ChunkPositionAndDistance[]
  local chunks = {}
  for chunk in player.surface.get_chunks() do
    --- @type ChunkPosition
    local chunk_position = { x = chunk.x, y = chunk.y }
    chunks[#chunks + 1] = { distance = flib_position.distance(chunk_position, origin), position = chunk_position }
  end
  table.sort(chunks, function(pos_a, pos_b)
    -- Sort backwards so that we can remove items from the end.
    return pos_a.distance > pos_b.distance
  end)
  profiler.stop()
  game.print(profiler)

  local step = 1 / #chunks
  local color = { r = 0, g = 1, b = 1 }
  for i = #chunks, 1, -1 do
    local pos = chunks[i].position
    rendering.draw_rectangle({
      color = color,
      filled = true,
      left_top = { pos.x, pos.y },
      right_bottom = { pos.x + 1, pos.y + 1 },
      surface = player.surface_index,
    })
    color.g = color.g - step
    color.r = color.r + step
    chunks[i] = nil
  end
end

local function on_tick()
  -- if not storage.biter_viruses then
  --   return
  -- end
  -- --- @type uint[]
  -- local to_remove = {}
  -- for surface_index, virus_data in pairs(storage.biter_viruses) do
  --   if not virus_data.surface.valid then
  --     to_remove[#to_remove + 1] = surface_index
  --     goto continue
  --   end
  --   for _, active_data in pairs(virus_data.active) do
  --   end
  --   ::continue::
  -- end
end

local virus = {}

function virus.on_init()
  --- @type table<uint, BiterVirusData>
  storage.biter_viruses = {}
end

virus.events = {
  [defines.events.on_player_used_capsule] = on_player_used_capsule,
  [defines.events.on_tick] = on_tick,
}

return virus
