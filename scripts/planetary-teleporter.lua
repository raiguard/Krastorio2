local flib_table = require("__flib__.table")

--- @class PlanetaryTeleporterData
--- @field entities PlanetaryTeleporterEntities
--- @field force LuaForce
--- @field name string?
--- @field position MapPosition
--- @field surface LuaSurface
--- @field turret_unit_number UnitNumber

--- @class PlanetaryTeleporterEntities
--- @field base LuaEntity
--- @field turret LuaEntity
--- @field collision_1 LuaEntity
--- @field collision_2 LuaEntity
--- @field collision_3 LuaEntity
--- @field front_layer LuaEntity

local collision_entity_offsets = {
  { x = 0, y = 0 },
  { x = -2, y = 2 },
  { x = 2, y = 2 },
}

--- @param base_entity LuaEntity
--- @return PlanetaryTeleporterEntities?
local function create_entities(base_entity)
  local entities = {
    base = base_entity,
  }
  local surface = base_entity.surface
  local position = base_entity.position

  -- Building the turret can fail due to AAI vehicles
  entities.turret = surface.create_entity({
    name = "kr-planetary-teleporter-turret",
    position = { x = position.x, y = position.y + 1.15 },
    force = "kr-internal-turrets",
    create_build_effect_smoke = false,
    raise_built = true,
  })

  if not entities.turret or not entities.turret.valid then
    game.print(
      "Building planetary teleporter failed due to AAI Programmable Vehicles. This teleporter will not function."
    )
    base_entity.active = false
    return
  end

  for i, offset in ipairs(collision_entity_offsets) do
    entities["collision_" .. i] = surface.create_entity({
      name = "kr-planetary-teleporter-collision-" .. i,
      position = { x = position.x + offset.x, y = position.y + offset.y },
      create_build_effect_smoke = false,
      raise_built = true,
    })
  end
  entities.front_layer = surface.create_entity({
    name = "kr-planetary-teleporter-front-layer",
    position = position,
    create_build_effect_smoke = false,
    raise_built = true,
  })
  for name, entity in pairs(entities) do
    if name ~= "base" then
      entity.destructible = false
    end
  end
  return entities
end

--- @param e EntityBuiltEvent
local function on_entity_built(e)
  local entity = e.entity or e.destination
  if not entity or not entity.valid then
    return
  end
  local entity_name = entity.name

  -- Don't keep cloned internal entities.
  if
    e.name == defines.events.on_entity_cloned
    and (
      entity_name == "kr-planetary-teleporter-front-layer"
      or entity_name == "kr-planetary-teleporter-turret"
      or string.find(entity_name, "kr-planetary-teleporter-collision", nil, true)
    )
  then
    entity.destroy()
    return
  end

  if entity_name ~= "kr-planetary-teleporter" then
    return
  end

  -- If revived from a blueprint and it has a name, get it from the tags
  local name = e.tags and e.tags.kr_planetary_teleporter_name or nil --[[@as string?]]
  local entities = create_entities(entity)
  if not entities then
    return
  end

  storage.planetary_teleporter[entity.unit_number] = {
    entities = entities,
    force = entity.force --[[@as LuaForce]],
    name = name,
    position = entity.position,
    surface = entity.surface,
    turret_unit_number = entities.turret.unit_number,
  }
end

--- @param e EntityDestroyedEvent
local function on_entity_destroyed(e)
  local entity = e.entity
  if not entity or not entity.valid or entity.name ~= "kr-planetary-teleporter" then
    return
  end
  local unit_number = entity.unit_number --[[@as uint]]
  local data = storage.planetary_teleporter[unit_number]
  -- AAI vehicles will destroy the entity before we have an opportuity to create data.
  if not data then
    return
  end
  for _, entity_to_destroy in pairs(data.entities) do
    if entity_to_destroy.valid then
      entity_to_destroy.destroy()
    end
  end
  storage.planetary_teleporter[unit_number] = nil
end

--- @param e EventData.on_player_setup_blueprint
local function on_player_setup_blueprint(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  -- Get blueprint
  local bp = player.blueprint_to_setup
  if not bp or not bp.valid_for_read then
    bp = player.cursor_stack
    if not bp then
      return
    end
    if bp.type == "blueprint-book" then
      local item_inventory = bp.get_inventory(defines.inventory.item_main)
      if item_inventory then
        bp = item_inventory[bp.active_index]
      else
        return
      end
    end
  end

  local entities = bp.get_blueprint_entities()
  if not entities then
    return
  end

  -- Iterate each entity
  for i = 1, #entities do
    local entity = entities[i]
    local entity_name = entity.name
    if entity_name == "kr-planetary-teleporter" then
      local real_entity = player.surface.find_entity("kr-planetary-teleporter", entity.position)
      if real_entity then
        local unit_number = real_entity.unit_number --[[@as uint]]
        local data = storage.planetary_teleporter[unit_number]
        if data and data.name then
          bp.set_blueprint_entity_tag(i, "kr_planetary_teleporter_name", data.name)
        end
      end
    end
  end
end

--- @param e EventData.on_script_trigger_effect
local function on_script_trigger_effect(e)
  if e.effect_id ~= "kr-planetary-teleporter-character-trigger" then
    return
  end

  if not e.source_entity.valid or not e.target_entity.valid then
    return
  end

  local player = e.target_entity.player
  if not player or not player.valid then
    return
  end

  table.insert(
    flib_table.get_or_insert(storage.planetary_teleporter_players, e.source_entity.unit_number, {}),
    player.index
  )
end

-- on_tick is executed before on_script_trigger_effect
local function on_tick()
  storage.planetary_teleporter_players = {}
end

local planetary_teleporter = {}

function planetary_teleporter.on_init()
  --- @type table<uint, PlanetaryTeleporterData>
  storage.planetary_teleporter = {}
  --- @type table<UnitNumber, PlayerIndex[]>
  storage.planetary_teleporter_players = {}
end

planetary_teleporter.events = {
  [defines.events.on_built_entity] = on_entity_built,
  [defines.events.on_entity_cloned] = on_entity_built,
  [defines.events.on_entity_died] = on_entity_destroyed,
  [defines.events.on_player_mined_entity] = on_entity_destroyed,
  [defines.events.on_player_setup_blueprint] = on_player_setup_blueprint,
  [defines.events.on_robot_built_entity] = on_entity_built,
  [defines.events.on_robot_mined_entity] = on_entity_destroyed,
  [defines.events.on_script_trigger_effect] = on_script_trigger_effect,
  [defines.events.on_tick] = on_tick,
  [defines.events.script_raised_built] = on_entity_built,
  [defines.events.script_raised_destroy] = on_entity_destroyed,
  [defines.events.script_raised_revive] = on_entity_built,
  [defines.events.on_space_platform_built_entity] = on_entity_built,
  [defines.events.on_space_platform_mined_entity] = on_entity_destroyed,
}

return planetary_teleporter
