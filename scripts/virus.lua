local constants = require("scripts.constants")

local virus = {}

local function iterate_biter_virus(virus_data)

end

local function iterate_creep_virus(virus_data)
  local surface = virus_data.surface
  if surface and surface.valid then
    local creeps = virus_data.tiles
    local len = virus_data.tiles_len
    local tiles_to_replace = {}
    for i = 1, virus_data.amount_per_iteration do
      if len == 0 then
        global.virus.creep[surface.index] = nil
        break
      end
      local j = math.random(1, len)
      local tile = creeps[j]
      if tile and tile.valid then
        tiles_to_replace[i] = { name = tile.hidden_tile or "landfill", position = tile.position }
        -- Move the element at the end to the gap
        -- This effectively removes the element from the table while retaining an O(1) performance impact
        creeps[j] = creeps[len]
        creeps[len] = nil
        len = len - 1
      end
    end
    virus_data.tiles_len = len
    surface.set_tiles(tiles_to_replace)
  else
    global.virus.creep[surface.index] = nil
  end
end

local function init_creep_virus(surface, position)
  local creep_viruses = global.virus.creep
  if not creep_viruses[surface.index] then
      -- Disable creep generation on this surface
      global.creep.surfaces[surface.index] = nil

      -- Begin creep removal
      -- FIXME: This causes insane amounts of lag with lots os creep tiles
      local creep_tiles = surface.find_tiles_filtered({name = "kr-creep"})
      local num_creeps = #creep_tiles
      creep_viruses[surface.index] = {
        amount_per_iteration = math.floor(num_creeps / constants.creep_to_remove_per_tick),
        surface = surface,
        tiles = creep_tiles,
        tiles_len = num_creeps,
      }
  end
end

function virus.init()
  global.virus = {
    biter = {},
    creep = {},
  }
end

function virus.on_player_used_capsule(e)
  local item = e.item
  if not item or not item.valid then return end

  local surface = game.get_player(e.player_index).surface
  local position = e.position

  if item.name == "kr-biter-virus" then
    game.print("BITER VIRUS")
  elseif item.name == "kr-creep-virus" then
    init_creep_virus(surface, position)
    game.print("CREEP VIRUS")
  end
end

function virus.iterate()
  for _, biter_virus in pairs(global.virus.biter) do
    iterate_biter_virus(biter_virus)
  end
  for _, creep_virus in pairs(global.virus.creep) do
    iterate_creep_virus(creep_virus)
  end
end

return virus
