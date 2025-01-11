local function add_starting_items()
  local items = remote.call("freeplay", "get_created_items")
  -- Shelter
  items["kr-shelter"] = 1
  -- Electric poles
  if script.active_mods["aai-industry"] and prototypes.item["medium-electric-pole"] then
    items["medium-electric-pole"] = 10
  end
  remote.call("freeplay", "set_created_items", items)
end

local new_ship_parts = {
  {
    name = "crash-site-generator",
    angle_deviation = 0.2,
    max_distance = 25,
    min_separation = 10,
    fire_count = 3,
    explosion_count = 1,
    force = "player",
  },
  {
    name = "crash-site-lab",
    angle_deviation = 0.05,
    max_distance = 30,
    min_separation = 10,
    fire_count = 3,
    explosion_count = 1,
    force = "player",
  },
  {
    name = "crash-site-assembling-machine-1",
    repeat_count = 2,
    angle_deviation = 0.3,
    max_distance = 20,
    min_separation = 5,
    fire_count = 1,
    force = "player",
  },
  {
    name = "crash-site-assembling-machine-2",
    repeat_count = 2,
    angle_deviation = 0.3,
    max_distance = 20,
    min_separation = 5,
    fire_count = 1,
    force = "player",
  },
  {
    name = "crash-site-chest-1",
    repeat_count = 3,
    angle_deviation = 0.1,
    max_distance = 20,
    min_separation = 3,
    fire_count = 1,
  },
  {
    name = "crash-site-chest-2",
    repeat_count = 3,
    angle_deviation = 0.1,
    max_distance = 20,
    min_separation = 2,
    fire_count = 1,
  },
}

local function add_to_crash_site()
  if
    not remote.interfaces.freeplay.get_disable_crashsite
    or remote.call("freeplay", "get_disable_crashsite")
    or remote.call("freeplay", "get_init_ran")
  then
    return
  end

  local ship_parts = remote.call("freeplay", "get_ship_parts")
  for _, part in pairs(new_ship_parts) do
    ship_parts[#ship_parts + 1] = part
  end
  remote.call("freeplay", "set_ship_parts", ship_parts)

  -- If playing a treeless game, add wood to the spaceship
  local nauvis = game.get_surface("nauvis")
  if nauvis then
    local tree_setting = nauvis.map_gen_settings.autoplace_controls.trees
    if not tree_setting or tree_setting.size == 0 then
      -- Add wood to the ship inventory
      local items = remote.call("freeplay", "get_ship_items")
      -- This is overkill for base K2, but should provide for plenty of margin of error
      items["wood"] = 400
      remote.call("freeplay", "set_ship_items", items)
    end
  end
end

local function set_custom_intro()
  if not remote.interfaces.freeplay.set_custom_intro_message then
    return
  end
  remote.call("freeplay", "set_custom_intro_message", { "message.kr-intro" })
end

local function disable_rocket_victory()
  if remote.interfaces.silo_script then
    remote.call("silo_script", "set_no_victory", true)
  end
end

local function run()
  if not remote.interfaces.freeplay then
    return
  end
  add_starting_items()
  add_to_crash_site()
  set_custom_intro()
  disable_rocket_victory()
end

--- @param entity_name EntityID
--- @param value boolean
local function set_minable(entity_name, value)
  for _, entity in pairs(game.surfaces.nauvis.find_entities_filtered({ name = entity_name })) do
    entity.minable = value
    entity.destructible = value
  end
end

--- @param e EventData.on_research_finished
local function on_research_finished(e)
  for _, effect in pairs(e.research.prototype.effects) do
    if effect.type ~= "unlock-recipe" then
      goto continue
    end

    local recipe_name = effect.recipe
    if recipe_name == "assembling-machine-1" then
      set_minable("crash-site-assembling-machine-1", true)
      set_minable("crash-site-assembling-machine-2", true)
    elseif recipe_name == "lab" then
      set_minable("crash-site-lab", true)
    elseif recipe_name == "steam-engine" then
      set_minable("crash-site-generator", true)
    end

    ::continue::
  end
end

local function on_player_created()
  if not remote.interfaces.freeplay then
    return
  end
  if storage.crash_site_init_ran then
    return
  end
  storage.crash_site_init_ran = true

  local recipes = game.forces.player.recipes
  set_minable("crash-site-assembling-machine-1", recipes["assembling-machine-1"].enabled)
  set_minable("crash-site-assembling-machine-2", recipes["assembling-machine-1"].enabled)
  set_minable("crash-site-lab", recipes["lab"].enabled)
  set_minable("crash-site-generator", recipes["steam-engine"].enabled)
end

local freeplay = {}

freeplay.on_init = run
freeplay.on_configuration_changed = run

freeplay.events = {
  [defines.events.on_research_finished] = on_research_finished,
  [defines.events.on_player_created] = on_player_created,
}

return freeplay
