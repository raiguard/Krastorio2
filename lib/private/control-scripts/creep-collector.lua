require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local area = require("__flib__.area")
local misc = require("__flib__.misc")

local function onInitAndConf()
	initializeCreepCollectorConstats()
end

function initializeCreepCollectorConstats()
	global.MAX_TILE_DISTANCE   = 10
	global.COLLECT_PROBABILITY = 30
end

local function showFlyingText(player, text, color, position)
	player.create_local_flying_text{
		text = text,
		color = color,
		position = position
	}
end

local function onCollection(event)
	if event.item == "kr-creep-collector" then
		local player = game.players[event.player_index]
		local position = player.position -- position will always be their actual location
		local inventory = player.get_main_inventory()

		local SelectionArea = area.load(event.area)
		local tiles = event.tiles

		-- do nothing if we do not have an inventory
		if not inventory then
			showFlyingText(player, {"other.kr-player-inventory-full-error"}, {1, 0, 0}, SelectionArea:center())
			return
		-- or if there are no tiles in the selection
		elseif #tiles == 0 then
			return
		-- or if we're in the SE satellite view
		elseif script.active_mods["space-exploration"] and player.controller_type == defines.controllers.god then
			return
		end

		if
			SelectionArea:contains_position(position)
			or SelectionArea:distance_to_nearest_edge(position) <= global.MAX_TILE_DISTANCE
		then
			-- assemble list of tiles to replace
			local count = 0
			local tiles_to_set = {}
			for _, tile in pairs(tiles) do
				local tile_position = tile.position
				if misc.get_distance(position, tile_position) <= global.MAX_TILE_DISTANCE then
					count = count + 1
					tiles_to_set[count] = {name = tile.hidden_tile or "landfill", position = tile_position}
				end
			end

			local surface = event.surface
			local percentage = math.random(global.COLLECT_PROBABILITY, 80)
			local collected_count = math.ceil(count * (percentage / 100))
			if collected_count > 0 and not inventory.can_insert{type = "item", name = "biomass", count = collected_count} then
				showFlyingText(player, {"other.kr-player-inventory-full-error"}, {1, 0, 0}, SelectionArea:center())
			elseif collected_count > 0 then
				surface.set_tiles(tiles_to_set)
				local inserted = inventory.insert{type = "item", name = "biomass", count = collected_count}
				if inserted ~= collected_count then
					surface.spill_item_stack(position, {type = "item", name = "biomass", count = collected_count - inserted})
				end
				showFlyingText(
					player,
					{"other.kr-collect-message-with-icon-prob", collected_count, percentage, {"item-name.biomass"}, "biomass"},
					{0.3, 1, 0.3},
					SelectionArea:center()
				)
				player.play_sound{
					path = "kr-collect-creep",
					position = position,
					volume_modifier = 1.0
				}
			else
				showFlyingText(player, {"other.kr-collect-distant-error"}, {1, 0, 0}, SelectionArea:center())
			end
		else
			showFlyingText(player, {"other.kr-collect-distant-error"}, {1, 0, 0}, SelectionArea:center())
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
	-- When player select creep
	{ onCollection, "on_player_selected_area" }
}
