local table = require("__flib__.table")

local creep = {}

--- @param entities LuaEntity[]
local function generate_creep(entities)
  -- We can safely assume that all of the entities will be on the same surface
  -- Check if this surface is allowed to generate creep
  local surface = entities[1].surface
  if not global.creep.surfaces[surface.index] then
    return
  end

  local radius = math.random(3, 5)
  local to_add = {}
  local i = 0
  for _, entity in pairs(entities) do
    ---@type LuaTile
    for _, tile in pairs(surface.find_tiles_filtered({ position = entity.position, radius = radius })) do
      if not tile.collides_with("player-layer") then
        i = i + 1
        to_add[i] = { name = "kr-creep", position = tile.position }
      end
    end
  end
  surface.set_tiles(to_add)
end

function creep.init()
  global.creep = {
    on_biter_base_built = true,
    on_chunk_generated = true,
    surfaces = { [game.get_surface("nauvis").index] = true },
  }
end

--- @param surface_index number
function creep.add_surface(surface_index)
  global.creep.surfaces[surface_index] = true
end

--- @param entity LuaEntity
function creep.on_biter_base_built(entity)
  if entity.type == "unit-spawner" and global.creep.surfaces[entity.surface.index] then
    generate_creep({ entity })
  end
end

--- @param chunk_area BoundingBox
--- @param surface LuaSurface
function creep.on_chunk_generated(chunk_area, surface)
  -- Mods can cause chunk generations before we migrate from pre-1.2.0
  if not global.creep or not global.creep.surfaces[surface.index] then
    return
  end

  local entities = surface.find_entities_filtered({ type = { "unit-spawner" }, area = chunk_area, force = "enemy" })

  for _, entity in pairs(entities) do
    if entity.valid then
      generate_creep({ entity })
    end
  end
end

creep.commands = {
  --- @param e CustomCommandData
  ["kr-set-creep-on-surface"] = function(e)
    local player = game.get_player(e.player_index) --[[@as LuaPlayer]]

    if not e.parameter then
      player.print({ "message.kr-invalid-command-syntax" })
      return
    end

    local _, _, surface_ident, value = string.find(e.parameter, "^(%w-) (%w-)$")
    if not surface_ident or not value then
      player.print({ "message.kr-invalid-command-syntax" })
      return
    end

    if value == "true" then
      value = true
    elseif value == "false" then
      value = false
    else
      player.print({ "message.kr-invalid-command-syntax" })
      return
    end

    local surface_index = tonumber(surface_ident)
    if surface_index then
      global.creep.surfaces[surface_index] = value
    elseif game.surfaces[surface_ident] then
      global.creep.surfaces[game.surfaces[surface_ident].index] = value
    else
      player.print({ "message.kr-could-not-find-surface", surface_ident })
    end
  end,
}

creep.remote_interface = {
  --- Set whether creep should generate on the given surface
  --- @param surface_index number
  --- @param value boolean
  set_creep_on_surface = function(surface_index, value)
    if not global.creep then
      return
    end
    if type(surface_index) ~= "number" or type(value) ~= "boolean" then
      error("Invalid parameter types for `set_creep_on_surface`")
    end
    global.creep.surfaces[surface_index] = value
  end,
  --- Spawn some creep at the given position
  --- @param surface LuaSurface
  --- @param position MapPosition
  --- @param override boolean
  spawn_creep_at_position = function(surface, position, override)
    if not global.creep then
      return
    end
    if type(surface) ~= "table" or type(position) ~= "table" or not surface.valid then
      error("The surface or the position are invalid.")
    end
    -- The code here is duplicated from `generate_creep()` because that function is specifically optimized for multiple
    -- if not global.creep then return end
    -- entities, while this function only needs to do it once.
    -- if not global.creep then return end
    if not global.creep.surfaces[surface.index] and not override then
      return
    end
    local radius = math.random(3, 5)
    surface.set_tiles(table.map(surface.find_tiles_filtered({ position = position, radius = radius }), function(tile)
      if not global.creep then
        return
      end
      if not tile.collides_with("player-layer") then
        return { name = "kr-creep", position = tile.position }
      end
    end))
  end,
}

return creep
