local flib_position = require("__flib__.position")

--- @class BiterVirusData
--- @field active BiterVirusActiveData[]
--- @field active_len integer
--- @field to_iterate ChunkPositionAndAreaAndDistance[]
--- @field to_iterate_len integer
--- @field surface LuaSurface

--- @class BiterVirusActiveData
--- @field entities LuaEntity[]
--- @field to_kill integer

--- @class ChunkPositionAndAreaAndDistance : ChunkPositionAndArea
--- @field distance number

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

  local surface = player.surface
  if storage.biter_viruses[surface.index] then
    return
  end

  local profiler = helpers.create_profiler()
  local origin = flib_position.to_chunk(e.position)
  --- @type ChunkPositionAndAreaAndDistance[]
  local chunks = {}
  for chunk in surface.get_chunks() do
    --- @cast chunk ChunkPositionAndAreaAndDistance
    chunk.distance = flib_position.distance(chunk --[[@as ChunkPosition]], origin)
    chunks[#chunks + 1] = chunk
  end
  table.sort(chunks, function(pos_a, pos_b)
    -- Sort backwards so that we can remove items from the end.
    return pos_a.distance > pos_b.distance
  end)
  profiler.stop()
  log({ "", "Biter virus init ", profiler })

  -- rendering.clear("Krastorio2")
  -- local step = 1 / #chunks
  -- local color = { r = 0, g = 1, b = 1 }
  -- for i = #chunks, 1, -1 do
  --   local pos = chunks[i]
  --   rendering.draw_rectangle({
  --     color = color,
  --     filled = true,
  --     left_top = { pos.x, pos.y },
  --     right_bottom = { pos.x + 1, pos.y + 1 },
  --     surface = player.surface_index,
  --   })
  --   color.g = color.g - step
  --   color.r = color.r + step
  -- end

  storage.biter_viruses[surface.index] = {
    active = {},
    active_len = 0,
    to_iterate = chunks,
    to_iterate_len = #chunks,
    surface = surface,
  }
end

local function on_tick()
  if not storage.biter_viruses then
    return
  end
  --- @type uint[]
  local to_remove = {}
  for surface_index, virus in pairs(storage.biter_viruses) do
    if not virus.surface.valid or (virus.active_len == 0 and virus.to_iterate_len == 0) then
      to_remove[#to_remove + 1] = surface_index
      goto continue
    end

    if virus.to_iterate_len > 0 then
      for _ = 1, 5 - virus.active_len do
        if virus.to_iterate_len > 0 then
          local chunk = table.remove(virus.to_iterate, virus.to_iterate_len)
          virus.to_iterate_len = virus.to_iterate_len - 1

          local entities = virus.surface.find_entities_filtered({
            area = chunk.area,
            force = "enemy",
            type = { "unit", "unit-spawner" },
          })
          local entities_len = #entities
          if entities_len > 0 then
            virus.active_len = virus.active_len + 1
            virus.active[virus.active_len] = {
              entities = entities,
              to_kill = math.ceil(entities_len / 5),
            }
          end
        end
      end
    end

    local active_to_remove = {}
    for i = 1, virus.active_len do
      local active = virus.active[i]
      if active then
        for _ = 1, math.min(active.to_kill, 1) do
          local entity = table.remove(active.entities, #active.entities)
          if entity and entity.valid then
            entity.die()
            active.to_kill = active.to_kill - 1
          end
        end
        if active.to_kill == 0 then
          active_to_remove[#active_to_remove + 1] = i
        end
      end
    end
    for i = #active_to_remove, 1, -1 do
      table.remove(virus.active, active_to_remove[i])
      virus.active_len = virus.active_len - 1
    end
    ::continue::
  end

  for i = 1, #to_remove do
    storage.biter_viruses[to_remove[i]] = nil
  end
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
