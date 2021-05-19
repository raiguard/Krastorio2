-- Init global vars
local util = require("__core__/lualib/util")
require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

------------------------------------------------------------------------------------
-- -- Vars

-- Constants
WIRELESS_CHARGE_RADIUS = 20
TRIGGER_ENTITY_NAME = "kr-tesla-coil"
TRIGGER_EQUIP_NAME = "energy-absorber"
TRIGGER_EQUIPMENT_SIZE = { W = 2, H = 2 }

-- Filter to events that support filtering
local KRASTORIO_WIRELESS_CHARGING_BUILT_EVENT_FILTER = {
  {
    filter = "name",
    name = TRIGGER_ENTITY_NAME,
  },
  {
    filter = "type",
    type = "car",
  },
  {
    filter = "type",
    type = "artillery-wagon",
  },
  {
    filter = "type",
    type = "cargo-wagon",
  },
  {
    filter = "type",
    type = "fluid-wagon",
  },
  {
    filter = "type",
    type = "locomotive",
  },
}

------------------------------------------------------------------------------------
-- -- Utils

-- In case that globals was resetted
local function inizializeGlobalWirelessDictionary()
  if not global.wireless_grids then
    global.wireless_grids = {}
  end
  if not global.players_wireless_grids then
    global.players_wireless_grids = {}
  end
end
local function inizializeGlobalLastOpenDictionary()
  if not global.player_last_open_entity then
    global.player_last_open_entity = {}
  end
end

-- Return the gui type name from the identifier number
local function getGUITypeName(given_id)
  for name, id in pairs(defines.gui_type) do
    if given_id == id then
      return name
    end
  end
end

-- Called when a player open a gui
local function saveLastOpenInformations(event)
  inizializeGlobalLastOpenDictionary()
  if not global.player_last_open_entity[event.player_index] then
    global.player_last_open_entity[event.player_index] = { nil, nil }
  end

  if
    (event.gui_type == 3 or event.gui_type == 5)
    and game.players[event.player_index]
    and game.players[event.player_index].character
  then
    global.player_last_open_entity[event.player_index] = game.players[event.player_index].character
  elseif event.gui_type == 1 and event.entity then
    global.player_last_open_entity[event.player_index] = event.entity
  end
end

-- Return if the current open grid match the modified grid in the listen event
local function havePlayerThisGridOpen(player_index, grid)
  local player = game.players[player_index]
  if player and player.valid then
    if player.opened_gui_type == 1 then
      if player.opened.grid == grid then
        return true
      end
    else
      if player.opened == grid then
        return true
      end
    end
  end
  return false
end

-- Return if the equip is already installed
local function countTriggerEquip(grid)
  local count = 0
  local equipment = nil
  for w = 1, grid.width, TRIGGER_EQUIPMENT_SIZE.W do
    for h = 1, grid.height, TRIGGER_EQUIPMENT_SIZE.H do
      equipment = grid.get({ w, h })
      if equipment and equipment.name == TRIGGER_EQUIP_NAME then
        count = count + 1
      end
    end
  end
  return count
end

-- Return if the grid have only one trigger item installed
local function haveOneTriggerEquip(grid)
  local count = countTriggerEquip(grid)
  if count == 1 then
    return true
  else
    return false
  end
end

-- Remove a monitored grid associated to an entity
-- this function will automatically manage removing and readding/override, player monitored entity
local function removeMonitoredGrid(index, player_index)
  inizializeGlobalWirelessDictionary()

  -- Remove from player grid indexing if the grid is from an armor
  if player_index ~= nil then
    global.players_wireless_grids[player_index] = nil
  else
    for player_index, entity_index in pairs(global.players_wireless_grids) do
      if index == entity_index then
        global.players_wireless_grids[player_index] = nil
        break
      end
    end
  end

  local old_index = table_size(global.wireless_grids)
  if old_index < 2 or old_index == index then
    -- Simply empty the table
    global.wireless_grids[index] = nil
  elseif global.wireless_grids[old_index] ~= nil then
    -- Move the tail over the element to be removed
    global.wireless_grids[index] = util.copy(global.wireless_grids[old_index])
    global.wireless_grids[old_index] = nil

    -- Update the players grid indexing if necessary
    for player_index, entity_index in pairs(global.players_wireless_grids) do
      if entity_index == old_index then
        global.players_wireless_grids[player_index] = index
        break
      end
    end
  else
    -- Find the latest element if the table is not well indexed
    local i, _ = next(global.wireless_grids, nil)
    while i do
      old_index = i
      i, _ = next(global.wireless_grids, i)
    end

    if old_index ~= index then
      -- Move the tail over the element to be removed
      global.wireless_grids[index] = util.copy(global.wireless_grids[old_index])

      -- Update the players grid indexing if necessary
      for player_index, entity_index in pairs(global.players_wireless_grids) do
        if entity_index == old_index then
          global.players_wireless_grids[player_index] = index
          break
        end
      end
    end

    global.wireless_grids[old_index] = nil
  end
end

-- Add a new monitored grid associated to an entity
-- this function will automatically manage removing and readding/override, player monitored entity
local function addMonitoredGrid(grid, entity, player_index)
  inizializeGlobalWirelessDictionary()

  if entity.grid then
    if grid == entity.grid then
      -- if player entity is already under monitoring
      if player_index ~= nil and global.players_wireless_grids[player_index] ~= nil then
        removeMonitoredGrid(global.players_wireless_grids[player_index], player_index)
      end

      local index = table_size(global.wireless_grids) + 1
      global.wireless_grids[index] = { grid, entity, nil }
      if player_index ~= nil then
        global.players_wireless_grids[player_index] = index
      end
      if entity.type == "character" then
        for _, player in pairs(game.players) do
          if player.character and player.character == entity then
            global.players_wireless_grids[player.index] = index
            break
          end
        end
      end
    elseif entity.type == "character" then
      if haveOneTriggerEquip(entity.grid) then
        for _, player in pairs(game.players) do
          if player.character and player.character == entity then
            addMonitoredGrid(entity.grid, entity, player.index)
            break
          end
        end
      end
    end
  end
end

local function drawLightnings(sender_entity, receiver_entity)
  sender_entity.surface.create_entity({
    name = "kr-tesla-coil-electric-beam",
    source = sender_entity,
    source_offset = { 0, -2.2 },
    position = sender_entity.position,
    target = receiver_entity,
    duration = 30,
    max_length = 21,
    force = sender_entity.force,
  })
end
------------------------------------------------------------------------------------
-- -- Callbacks

-- Called when the game is created (or updated),
-- inizialize global variable for this script
local function wirelessChargerVariablesInitializing()
  inizializeGlobalWirelessDictionary()
  inizializeGlobalLastOpenDictionary()
  if not global.wireless_charge_ratio then
    global.wireless_charge_ratio = 375000
  end
end

-- callback associated to wirelessChargerVariablesInitializing()
local function onInitAndConf()
  if not global.krastorio then
    global.krastorio = {}
  end
  if not global.krastorio.script_initialization_status then
    global.krastorio.script_initialization_status = {}
  end
  if not global.krastorio.script_initialization_status["wireless-charger"] then
    wirelessChargerVariablesInitializing()
    global.krastorio.script_initialization_status["wireless-charger"] = true
  end
end

-- Called when player install a new equip in a grid
local function onInstallingEquip(event)
  local equipment = event.equipment or false
  if event.player_index and equipment.valid and equipment.name == TRIGGER_EQUIP_NAME then
    local grid = event.grid
    if havePlayerThisGridOpen(event.player_index, grid) and haveOneTriggerEquip(grid) then
      local last_open_entity = global.player_last_open_entity[event.player_index]
      if last_open_entity and last_open_entity.valid and last_open_entity.grid == grid then
        addMonitoredGrid(grid, last_open_entity)
      end
    elseif havePlayerThisGridOpen(event.player_index, grid) then
      local player = game.get_player(event.player_index)
      if player and player.valid then
        player.insert(grid.take({ equipment = equipment }))
        player.create_local_flying_text({ text = { "other.kr-already-one-antenna" }, create_at_cursor = true })
        player.play_sound({ path = "utility/cannot_build" })
      end
    end
  end
end

-- Called when player remove an equip from a grid
local function onRemovingingEquip(event)
  local equipment = event.equipment or false
  if equipment == TRIGGER_EQUIP_NAME then
    for i, group in pairs(global.wireless_grids) do
      if group[1] == event.grid then
        removeMonitoredGrid(i)
      end
    end
  end
end

-- Check if any of monitored grids are in range with any tesla coil
local function checkIfInRange(event)
  if not global.wireless_grids or table_size(global.wireless_grids) == 0 then
    return false
  end

  local i, group = next(global.wireless_grids)
  local entity = nil

  while i do
    entity = group[2]
    if entity and entity.valid then
      local matched = entity.surface.find_entities_filtered({
        position = entity.position,
        radius = WIRELESS_CHARGE_RADIUS,
        name = TRIGGER_ENTITY_NAME,
      })
      if matched and table_size(matched) > 0 then
        global.wireless_grids[i][3] = matched
      else
        global.wireless_grids[i][3] = nil
      end
    elseif not entity.valid then
      removeMonitoredGrid(i)
    end

    i, group = next(global.wireless_grids, i)
  end
end

-- Charge if possible
local function charge(event)
  if not global.wireless_grids or table_size(global.wireless_grids) == 0 then
    return false
  end

  local i, group = next(global.wireless_grids)
  local grid, grid_entity, matched = nil, nil, nil
  local powered = false
  local receiver_equiment = nil
  local needed_energy = nil

  while i and group do
    grid = group[1]
    grid_entity = group[2]
    matched = group[3]

    if
      grid
      and grid.valid
      and grid_entity
      and grid_entity.valid
      and matched
      and table_size(matched) > 0
      and grid.available_in_batteries < grid.battery_capacity
    then
      receiver_equiment = nil
      for _, equipment in pairs(grid.equipment) do
        if equipment.name == TRIGGER_EQUIP_NAME then
          receiver_equiment = equipment
          break
        end
      end

      if receiver_equiment and receiver_equiment.energy < receiver_equiment.max_energy then
        powered = false
        for _, entity in pairs(matched) do
          if
            entity
            and entity.valid
            and entity.surface == grid_entity.surface
            and entity.energy >= global.wireless_charge_ratio * 6
          then
            powered = true
            -- Calculate energy can must be inserted in the equipment, between max available and available space
            needed_energy = math.min(
              receiver_equiment.max_energy - receiver_equiment.energy,
              global.wireless_charge_ratio
            )
            -- Add energy to equiment
            receiver_equiment.energy = receiver_equiment.energy + needed_energy
            -- Remove energy from the entity
            entity.energy = entity.energy - needed_energy * 6
            -- Draw a visible lighting to show the passage
            drawLightnings(entity, grid_entity)
            break
          end
          if powered then
            break
          end
        end
      elseif receiver_equiment == nil then
        removeMonitoredGrid(i)
      end
    elseif not grid.valid then
      removeMonitoredGrid(i)
    end

    i, group = next(global.wireless_grids, i)
  end
end

local function onBuiltAnEntity(event)
  local entity = event.created_entity or event.entity

  if entity and entity.valid then
    if entity.name == TRIGGER_ENTITY_NAME then
      local same_entities = entity.surface.find_entities_filtered({
        position = entity.position,
        radius = WIRELESS_CHARGE_RADIUS,
        name = TRIGGER_ENTITY_NAME,
      })
      if table_size(same_entities) > 1 then
        for _, product in pairs(entity.prototype.mineable_properties.products) do
          entity.last_user.insert({ name = product.name or product[1], count = product.amount or product[2] })
        end
        krastorio.flying_texts.showOnSurfaceText({
          entity = entity,
          text = { "other.kr-another-tesla-coil-in-range" },
          color = { 1, 0, 0 },
        })
        -- Only try to play the sound if a player placed this
        if event.player_index then
          game.players[event.player_index].play_sound({
            path = "utility/cannot_build",
            volume_modifier = 1.0,
          })
        end
        entity.destroy()
      end
    elseif entity.grid and haveOneTriggerEquip(entity.grid) then
      addMonitoredGrid(entity.grid, entity)
    elseif event.player_index and game.players[event.player_index].character == entity then
      addMonitoredGrid(entity.grid, entity, player_index)
    end
  end
end

local function onRemovingAnEntity(event)
  local removed_entity = event.entity

  if
    removed_entity
    and removed_entity.valid
    and removed_entity.grid
    and haveOneTriggerEquip(removed_entity.grid)
  then
    local i, group = next(global.wireless_grids)
    local entity = nil

    while i and group do
      entity = group[2]
      if removed_entity == entity then
        removeMonitoredGrid(i)
        break
      end
      i, group = next(global.wireless_grids, i)
    end
  end
end

local function onPlayerArmorInventoryChanged(event)
  local player_index = event.player_index
  local player = game.players[player_index]
  if player and player.valid then
    local armor = player.get_inventory(defines.inventory.character_armor)
    if armor and armor.valid and not armor.is_empty() then
      local character = player.character

      if character and character.valid and character.grid and haveOneTriggerEquip(character.grid) then
        addMonitoredGrid(character.grid, character, player_index)
      end
    else
      if global.players_wireless_grids[player_index] ~= nil then
        removeMonitoredGrid(global.players_wireless_grids[player_index], player_index)
      end
    end
  end
end

local function onPlayerJoinedGame(event)
  onPlayerArmorInventoryChanged(event)
end

local function onResearchFinished(event)
  if event.research.name == "kr-tesla-coil-upgrade-mk1" then
    global.wireless_charge_ratio = 500000
  elseif event.research.name == "kr-tesla-coil-upgrade-mk2" then
    global.wireless_charge_ratio = 750000
  elseif event.research.name == "kr-tesla-coil-upgrade-mk3" then
    global.wireless_charge_ratio = 1500000
  elseif event.research.name == "kr-tesla-coil-upgrade-mk4" then
    global.wireless_charge_ratio = 3000000
  end
end

-- Fix for previous versions
local function tidyUpIndexes()
  local count = 1
  local tidy_up_table = {}
  local i, group = next(global.wireless_grids, nil)

  while i do
    tidy_up_table[count] = util.copy(group)
    -- Update the players grid indexing if necessary
    for player_index, entity_index in pairs(global.players_wireless_grids) do
      if entity_index == i then
        global.players_wireless_grids[player_index] = count
        break
      end
    end
    count = count + 1
    i, group = next(global.wireless_grids, i)
  end
end

------------------------------------------------------------------------------------
return {
  -- -- Bootstrap
  -- For setup variables
  { onInitAndConf, "on_init" },
  { onInitAndConf, "on_configuration_changed" },
  { tidyUpIndexes, "on_configuration_changed" },
  -- -- Actions
  -- Equip
  { saveLastOpenInformations, "on_gui_opened" },
  { onPlayerJoinedGame, "on_player_joined_game" },
  { onInstallingEquip, "on_player_placed_equipment" },
  { onRemovingingEquip, "on_player_removed_equipment" },
  { onPlayerArmorInventoryChanged, "on_player_armor_inventory_changed" },
  -- Built entity
  { onBuiltAnEntity, "on_built_entity", KRASTORIO_WIRELESS_CHARGING_BUILT_EVENT_FILTER },
  { onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_WIRELESS_CHARGING_BUILT_EVENT_FILTER },
  { onBuiltAnEntity, "script_raised_built" },
  { onBuiltAnEntity, "script_raised_revive" },
  -- Remove entity
  { onRemovingAnEntity, "on_player_mined_entity", KRASTORIO_WIRELESS_CHARGING_BUILT_EVENT_FILTER },
  { onRemovingAnEntity, "on_robot_mined_entity", KRASTORIO_WIRELESS_CHARGING_BUILT_EVENT_FILTER },
  { onRemovingAnEntity, "on_entity_died", KRASTORIO_WIRELESS_CHARGING_BUILT_EVENT_FILTER },
  -- Researchs
  { onResearchFinished, "on_research_finished" },
  -- Overtime (charing)
  { checkIfInRange, "on_nth_tick", 120 },
  { charge, "on_nth_tick", 30 },
}
