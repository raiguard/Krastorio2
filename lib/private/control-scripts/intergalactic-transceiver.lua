local check_it_interval, check_victory_interval = 120, 360 -- 2, 6 seconds

-- Filter for building events
local KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER =
{
	-- intergalactic-transceiver entity name
	{
		filter = "name", 
        name   = "kr-intergalactic-transceiver"
    },
	{
		filter = "name", 
        name   = "kr-activated-intergalactic-transceiver"
    }
}

if not remote.interfaces["kr-intergalactic-transceiver"] then
	remote.add_interface("kr-intergalactic-transceiver",
	{
		set_no_victory = 
		function(bool)
			if type(bool) ~= "boolean" then 
				error("Value for 'set_no_victory' must be a boolean.")
			end
			global.krastorio_victory_disabled = bool
		end,
		charge_it =
		function(force_index)
			if type(force_index) ~= "number" then 
				error("Value for 'force_index' must be a integer.")
			end
			if global.intergalactic_transceivers[force_index] then
				global.intergalactic_transceivers[force_index].energy = global.intergalactic_transceivers[force_index].prototype.electric_energy_source_prototype.buffer_capacity
			end			
		end
	})
end

local function onInitAndConf()
	if not global.krastorio.script_initialization_status["intergalactic-transceiver"] then
		intergalactic_transceiverVariablesInitializing()
		global.krastorio.script_initialization_status["intergalactic-transceiver"] = true
	end
end

-- Called when the game is created
function intergalactic_transceiverVariablesInitializing()
	-- global variable
	global.intergalactic_transceivers = {}
	global.intergalactic_transceivers_energy_status = {}
	global.game_won = false
end

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local entity = event.created_entity or event.entity
	if entity and entity.valid and (entity.name == "kr-intergalactic-transceiver" or entity.name == "kr-activated-intergalactic-transceiver") then
		local force_index = entity.force.index
		if not global.intergalactic_transceivers[force_index] then
			global.intergalactic_transceivers[force_index] = entity
		else
			entity.last_user.insert{name="kr-intergalactic-transceiver", count=1}
			krastorio.flying_texts.showOnSurfaceText
			{
				entity = entity,
				text   = {"other.kr-intergalactic-transceiver-error"},
				color  = {1, 0, 0}
			}
			entity.destroy()
		end
	end
end

-- @event, on_player_mined_entity or on_robot_mined_entity or on_entity_died
local function onRemovingAnEntity(event)
	local entity = event.entity	
	if entity and entity.valid and (entity.name == "kr-intergalactic-transceiver" or entity.name == "kr-activated-intergalactic-transceiver") then
		local force_index = entity.force.index
		if global.intergalactic_transceivers[force_index] then
			global.intergalactic_transceivers[force_index] = nil
			global.intergalactic_transceivers_energy_status[force_index] = nil
		end
	end
end

-- Test if a team have with every 4 seconds (120 tick)
local function checkVictory()	
	-- Check if someone win
	if global.win_next_check then
		if not (global.krastorio_victory_disabled or global.game_won) then -- If disabled from other mods or if already winned
			global.game_won = true
			game.set_game_state{game_finished = true, player_won = true, can_continue = true, victorious_force = game.forces[global.win_next_check]}
		end
		global.win_next_check = nil
	end
end

-- Test if a team have with every 2 seconds (120 tick)
local function checkITs()		
	-- Check for each team
    for force_index, it in pairs(global.intergalactic_transceivers) do
		if it.valid and it.name == "kr-intergalactic-transceiver" then
			if it.energy == it.prototype.electric_energy_source_prototype.buffer_capacity then -- Win!
				if global.game_won ~= true then
					it.surface.create_entity
					{
						type      = "projectile",
						name      = "beacon-projectile",
						force     = it.force,
						player    = it.last_user,
						position  = it.position,
						speed     = 0,
						max_range = 100,
						target    = it,
						create_build_effect_smoke = false
					}
					if not global.win_next_check then
						global.win_next_check = force_index
					end
				end
				it.surface.create_entity
				{
					type     = "electric-energy-interface",
					name     = "kr-activated-intergalactic-transceiver",
					force    = it.force,
					player   = it.last_user,
					position = it.position,
					create_build_effect_smoke = false
				}
				it.destroy()
			else -- Energy drain			
				if not global.intergalactic_transceivers_energy_status[force_index] then -- Initialize
					global.intergalactic_transceivers_energy_status[force_index] = it.energy
				else -- Exist entity
					if it.energy ~= 0 and global.intergalactic_transceivers_energy_status[force_index] == it.energy then -- Must drain
						if global.intergalactic_transceivers_energy_status[force_index] <= 2000000000 then -- Cut off on 2GJ
							it.energy = 0
							global.intergalactic_transceivers_energy_status[force_index] = 0
						else -- Reduce by 20%
							it.energy = it.energy - (it.energy * 2 / 10)
							global.intergalactic_transceivers_energy_status[force_index] = it.energy
							for _, player in pairs(game.connected_players) do
								if player.force == it.force then
									player.add_custom_alert(it, {type="virtual", name="kr-battery_low"}, {"other.kr-intergalactic-transceiver-discharging"}, true)
								end
							end
						end
					else -- Not building in use so update the latest value
						global.intergalactic_transceivers_energy_status[force_index] = it.energy
					end
				end
			end
		end
    end
end

return
{ 
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },
	{ onInitAndConf, "on_configuration_changed" },	
	-- -- Actions		
	{ onBuiltAnEntity, "on_built_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onBuiltAnEntity, "script_raised_built" },
	{ onBuiltAnEntity, "script_raised_revive" },		
	{ onRemovingAnEntity, "on_player_mined_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_robot_mined_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_entity_died", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ checkITs, "on_nth_tick", check_it_interval },
	{ checkVictory, "on_nth_tick", check_victory_interval }	
}
