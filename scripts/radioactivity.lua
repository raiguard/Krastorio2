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
  for types, list in pairs(constants.default_radioactive_objects) do
    global.radioactivity[types[1]] = {}
    for _, name in pairs(list) do
      radioactivity.remote_interface["add_"..types[2]](name)
    end
  end
end

function radioactivity.add_player(player)
  global.radioactivity.players[player.index] = {
    inventory = false,
    position = false,
  }
end

function radioactivity.remove_player(player_index)
  global.radioactivity.players[player_index] = nil
end

function radioactivity.refresh_players()
  local existing = global.radioactivity.players
  local new = {}
  for player_index in pairs(game.players) do
    new[player_index] = existing[player_index] or {
      inventory = false,
      position = false,
    }
  end
  global.radioactivity.players = new
end

-- TODO: Only check if the player moves tiles, not if they move at all
function radioactivity.check_around_player(player)
  if not global.radioactivity.enabled then return end

  local player_data = global.radioactivity.players[player.index]
  if not player.character or not player.character.valid then
    player_data.position = false
    return
  end

  local in_range = player.character and player.surface.count_entities_filtered{
    name = global.radioactivity.entities,
    radius = constants.radioactivity_range,
    position = player.position
  } > 0
  player_data.position = in_range
end

function radioactivity.check_inventory(player)
  if not global.radioactivity.enabled then return end

  local player_data = global.radioactivity.players[player.index]
  if not player.character or not player.character.valid then
    player_data.inventory = false
    return
  end

  local inventories = {player.get_main_inventory(), player.get_inventory(defines.inventory.character_trash)}

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
  if not global.radioactivity.enabled then return end

  for player_index, player_data in pairs(global.radioactivity.players) do
    if table.find(player_data, true) then
      local player = game.get_player(player_index)
      if player.connected then
        player.play_sound{
          path = "kr-radioactive",
          volume_modifier = 0.5,
        }
      end
    end
  end
end

function radioactivity.update_and_damage()
  if not global.radioactivity.enabled then return end

  for player_index, player_data in pairs(global.radioactivity.players) do
    if table.find(player_data, true) then
      local player = game.get_player(player_index)
      if player.connected and player.character then
        player.add_custom_alert(
          player.character,
          {type = "virtual", name = "kr-nuclear-2"},
          {"other.kr-taking-radioactive-damage"},
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

radioactivity.remote_interface = {
  add_entity = function(name)
    if not name or type(name) ~= "string" then
      error("`name` must be a string.")
    end

    if not game.entity_prototypes[name] then
      error("Entity `"..name.."` does not exist.")
    end

    table.insert(global.radioactivity.entities, name)
  end,
  add_item = function(name)
    if not name or type(name) ~= "string" then
      error("`name` must be a string.")
    end

    if not game.item_prototypes[name] then
      error("Item `"..name.."` does not exist.")
    end

    table.insert(global.radioactivity.items, name)
  end,
  set_enabled = function(to_state)
    if to_state == nil or type(to_state) ~= "boolean" then
      error("`to_state` must be a boolean.")
    end

    global.radioactivity.enabled = to_state
  end
}

return radioactivity
