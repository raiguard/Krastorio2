local mined_entity =
{
  ["kr-shelter"] = "kr-shelter", 
  ["kr-intergalactic-transceiver"] = "kr-intergalactic-transceiver", 
  ["kr-activated-intergalactic-transceiver"] = "kr-intergalactic-transceiver",
  ["kr-electric-offshore-pump"] = "offshore-pump"
}

local function destroyScriptedEntities(names)
  for _, surface in pairs(game.surfaces) do
    local entities_finded = surface.find_entities_filtered
    { 
      name = names
    }
    for _, entity in pairs(entities_finded) do
      if entity and entity.valid then
        -- Get entity back
        if mined_entity[entity.name] then
          local player = entity.last_user
          if player and player.valid then
            local inventory = player.get_main_inventory()
            if inventory and inventory.valid then
              inventory.insert({type = "item", name = mined_entity[entity.name], count = 1})
            end
          end
        end
        -- Destroy entity
        entity.destroy()
      end
    end
  end
end

local function restore()
  intergalactic_transceiverVariablesInitializing()
  initializeCreepCollectorConstats()
  creepVariablesInitializing()
  initializePlanetaryTeleportersGlobalVariables()
  setupKRRadioactivityGlobalVariables()
  shelterVariablesInitializing()
  initializePatreonsGlobalVariables()
  destroyScriptedEntities(
  {
    "kr-shelter",
    "kr-shelter-container",
    "kr-shelter-light",   
    "kr-intergalactic-transceiver",
    "kr-activated-intergalactic-transceiver",
    "kr-electric-offshore-pump"
  })
  game.print({"other.forced-reset-message"})
end
-- Associate command to function
if not commands.commands["kr-restore"] then
  commands.add_command("kr-restore", {"other.kr-restore-help"}, restore)
end

if not remote.interfaces["kr-restore"] then
  remote.add_interface("kr-restore",
  {
    reset_global_data = 
    function()
      restore()
    end
  })
end

return{}
