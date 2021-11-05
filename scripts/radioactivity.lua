local table = require("__flib__.table")

local constants = require("scripts.constants")

local radioactivity = {}

function radioactivity.init()
  global.radioactivity = {
    enabled = true,
    players = {},
  }
end

function radioactivity.reset_entities_items()
  for _, data in pairs(constants.radioactivity_defaults) do
    global.radioactivity[data.tbl] = {}
    for _, name in pairs(data.objects) do
      radioactivity.remote_interface["add_" .. data.type](name)
    end
  end
end

function radioactivity.add_player(player)
  global.radioactivity.players[player.index] = {
    entity = false,
    inventory = false,
    last_position = { x = 0, y = 0 },
  }
end

function radioactivity.remove_player(player_index)
  global.radioactivity.players[player_index] = nil
end

function radioactivity.refresh_players()
  local existing = global.radioactivity.players
  local new = {}
  for player_index in pairs(game.players) do
    new[player_index] = existing[player_index]
      or {
        entity = false,
        inventory = false,
        last_position = { x = 0, y = 0 },
      }
  end
  global.radioactivity.players = new
end

function radioactivity.check_around_player(player)
  if not global.radioactivity.enabled then
    return
  end

  local player_data = global.radioactivity.players[player.index]
  if not player_data then
    return
  end

  if not player.character or not player.character.valid then
    player_data.entity = false
    return
  end

  local position = player.position
  local last_position = player_data.last_position
  if math.floor(position.x) ~= math.floor(last_position.x) or math.floor(position.y) ~= math.floor(last_position.y) then
    player_data.last_position = position

    local in_range = player.character
      and player.surface.count_entities_filtered({
          name = global.radioactivity.entities,
          radius = constants.radioactivity_range,
          position = player.position,
        })
        > 0
    player_data.entity = in_range
  end
end

function radioactivity.check_inventory(player)
  if not global.radioactivity.enabled then
    return
  end

  local player_data = global.radioactivity.players[player.index]
  if not player.character or not player.character.valid then
    player_data.inventory = false
    return
  end

  local inventories = { player.get_main_inventory(), player.get_inventory(defines.inventory.character_trash) }

  for _, inventory in pairs(inventories) do
    for _, item_name in pairs(global.radioactivity.items) do
      if inventory.get_item_count(item_name) > 0 then
        player_data.inventory = true
        return
      end
    end
  end

  player_data.inventory = false
end

function radioactivity.update_sounds()
  if not global.radioactivity.enabled then
    return
  end

  for player_index, player_data in pairs(global.radioactivity.players) do
    if table.find(player_data, true) then
      local player = game.get_player(player_index)
      if player.connected then
        player.play_sound({
          path = "kr-radioactive",
          volume_modifier = 0.5,
        })
      end
    end
  end
end

function radioactivity.update_and_damage()
  if not global.radioactivity.enabled then
    return
  end

  for player_index, player_data in pairs(global.radioactivity.players) do
    if table.find(player_data, true) then
      local player = game.get_player(player_index)
      if player.connected and player.character then
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
      end
    end
  end
end

radioactivity.commands = {
  ["kr-disable-radioactivity"] = function()
    global.radioactivity.enabled = false
    game.print({ "message.kr-radioactivity-disabled" })
  end,
  ["kr-enable-radioactivity"] = function()
    global.radioactivity.enabled = true
    game.print({ "message.kr-radioactivity-enabled" })
  end,
}

radioactivity.remote_interface = {
  add_entity = function(name)
    if not name or type(name) ~= "string" then
      error("`name` must be a string.")
    end

    if not game.entity_prototypes[name] then
      error("Entity `" .. name .. "` does not exist.")
    end

    table.insert(global.radioactivity.entities, name)
  end,
  add_item = function(name)
    if not name or type(name) ~= "string" then
      error("`name` must be a string.")
    end

    if not game.item_prototypes[name] then
      error("Item `" .. name .. "` does not exist.")
    end

    table.insert(global.radioactivity.items, name)
  end,
  set_enabled = function(to_state)
    if to_state == nil or type(to_state) ~= "boolean" then
      error("`to_state` must be a boolean.")
    end

    global.radioactivity.enabled = to_state
  end,
}

return radioactivity
