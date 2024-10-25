local flib_position = require("__flib__.position")

local util = require("scripts.util")

--- @class RadioactivityPlayerData
--- @field entity boolean
--- @field inventory boolean
--- @field last_position MapPosition

local default_entities = { "uranium-ore" }
local default_items = {
  "nuclear-fuel",
  "uranium-235",
  "uranium-238",
  "uranium-fuel-cell",
  "uranium-ore",
  "depleted-uranium-fuel-cell",
}
local range = 7

--- @param player LuaPlayer
local function check_inventory(player)
  if not storage.radioactivity.enabled or not next(storage.radioactivity.entities) then
    return
  end

  local player_data = storage.radioactivity.players[player.index]
  if not player_data then
    return
  end

  if not player.character or not player.character.valid then
    player_data.inventory = false
    return
  end

  for _, item_name in pairs(storage.radioactivity.items) do
    -- FIXME: This does not check trash inventory
    if player.get_item_count(item_name) > 0 then
      player_data.inventory = true
      return
    end
  end

  player_data.inventory = false
end

--- @param player LuaPlayer
local function check_around_player(player)
  if not storage.radioactivity.enabled or not next(storage.radioactivity.items) then
    return
  end

  local player_data = storage.radioactivity.players[player.index]
  if not player_data then
    return
  end

  if not player.character or not player.character.valid then
    player_data.entity = false
    return
  end

  local position = flib_position.floor(player.position)
  local last_position = player_data.last_position
  if flib_position.eq(position, last_position) then
    return
  end
  player_data.last_position = position

  player_data.entity = player.surface.count_entities_filtered({
    name = storage.radioactivity.entities,
    radius = range,
    position = position,
  }) > 0
end

--- @param player LuaPlayer
local function add_player(player)
  storage.radioactivity.players[player.index] = {
    entity = false,
    inventory = false,
    last_position = { x = 0, y = 0 },
  }
end

--- @param player_index uint
local function remove_player(player_index)
  storage.radioactivity.players[player_index] = nil
end

local function update_and_damage()
  if not storage.radioactivity.enabled then
    return
  end

  for player_index, player_data in pairs(storage.radioactivity.players) do
    if not player_data.entity and not player_data.inventory then
      goto continue
    end

    local player = game.get_player(player_index)
    if not player or not player.connected or not player.character then
      goto continue
    end

    player.add_custom_alert(
      player.character,
      { type = "virtual", name = "kr-nuclear-2" },
      { "other.kr-taking-radioactive-damage" },
      false
    )

    -- Damage the player
    -- TODO: Account for armor and energy shields
    local base_damage = 7.25
    player.character.damage(base_damage, "enemy", "radioactive")

    ::continue::
  end
end

local function update_sounds()
  if not storage.radioactivity.enabled then
    return
  end

  for player_index, player_data in pairs(storage.radioactivity.players) do
    if not player_data.entity and not player_data.inventory then
      goto continue
    end

    local player = game.get_player(player_index)
    if not player or not player.connected then
      goto continue
    end

    player.play_sound({
      path = "kr-radioactive",
      volume_modifier = 0.5,
    })

    ::continue::
  end
end

--- @param e EventData.on_player_changed_position|EventData.on_player_changed_surface
local function on_player_moved(e)
  local player = game.get_player(e.player_index)
  if player then
    check_around_player(player)
  end
end

--- @param e EventData.on_player_main_inventory_changed|EventData.on_player_trash_inventory_changed
local function on_player_inventory_changed(e)
  local player = game.get_player(e.player_index)
  if player then
    check_inventory(player)
  end
end

--- @param e EventData.on_player_created
local function on_player_created(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  add_player(player)
end

--- @param e EventData.on_player_removed
local function on_player_removed(e)
  remove_player(e.player_index)
end

local radioactivity = {}

function radioactivity.on_init()
  storage.radioactivity = {
    enabled = true,
    --- @type table<uint, RadioactivityPlayerData>
    players = {},
  }
  radioactivity.on_configuration_changed()
end

function radioactivity.on_configuration_changed()
  -- TODO: Migration
  storage.radioactivity.entities = {}
  for _, entity_name in pairs(default_entities) do
    if prototypes.entity[entity_name] then
      table.insert(storage.radioactivity.entities, entity_name)
    end
  end
  storage.radioactivity.items = {}
  for _, item_name in pairs(default_items) do
    if prototypes.item[item_name] then
      table.insert(storage.radioactivity.items, item_name)
    end
  end
end

remote.add_interface("kr-radioactivity", {
  add_entity = function(name)
    if not storage.radioactivity then
      return
    end
    if not name or type(name) ~= "string" then
      error("`name` must be a string.")
    end

    if not prototypes.entity[name] then
      error("Entity `" .. name .. "` does not exist.")
    end

    table.insert(storage.radioactivity.entities, name)
  end,
  add_item = function(name)
    if not storage.radioactivity then
      return
    end
    if not name or type(name) ~= "string" then
      error("`name` must be a string.")
    end

    if not prototypes.item[name] then
      error("Item `" .. name .. "` does not exist.")
    end

    table.insert(storage.radioactivity.items, name)
  end,
  set_enabled = function(to_state)
    if not storage.radioactivity then
      return
    end
    if to_state == nil or type(to_state) ~= "boolean" then
      error("`to_state` must be a boolean.")
    end

    storage.radioactivity.enabled = to_state
  end,
})

util.add_commands({
  ["kr-disable-radioactivity"] = function()
    storage.radioactivity.enabled = false
    game.print({ "message.kr-radioactivity-disabled" })
  end,
  ["kr-enable-radioactivity"] = function()
    storage.radioactivity.enabled = true
    game.print({ "message.kr-radioactivity-enabled" })
  end,
})

radioactivity.events = {
  [defines.events.on_player_changed_position] = on_player_moved,
  [defines.events.on_player_changed_surface] = on_player_moved,
  [defines.events.on_player_created] = on_player_created,
  [defines.events.on_player_cursor_stack_changed] = on_player_inventory_changed,
  [defines.events.on_player_died] = on_player_moved,
  [defines.events.on_player_main_inventory_changed] = on_player_inventory_changed,
  [defines.events.on_player_removed] = on_player_removed,
  [defines.events.on_player_respawned] = on_player_moved,
  [defines.events.on_player_toggled_map_editor] = on_player_moved,
  [defines.events.on_player_trash_inventory_changed] = on_player_inventory_changed,
  [defines.events.on_tick] = update_sounds,
}

radioactivity.on_nth_tick = {
  [20] = update_and_damage,
}

return radioactivity
