require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local gui = require("__Krastorio2__/lib/private/control-scripts/control-lib/flib/gui-beta")

local pt_built_entity_filters = {{filter = "name", name = "kr-planetary-teleporter"}}
local pt_entity_name = "kr-planetary-teleporter"

-- GUI

local function create_gui(player, entity)
	local refs = gui.build(player.gui.screen, {
		{
			type = "frame",
			direction = "vertical",
			ref = {"window"},
			actions = {
				on_closed = {gui = "planetary_teleporter", action = "close"}
			},
			children = {
				-- titlebar
				{type = "flow", ref = {"titlebar_flow"}, children = {
					{
						type = "label",
						style = "frame_title",
						caption = {"entity-name.kr-planetary-teleporter"},
						ignored_by_interaction = true
					},
					{type = "empty-widget", style = "kr-title-draggable-space", ignored_by_interaction = true},
					{
						type = "sprite-button",
						style = "frame_action_button",
						sprite = "utility/search_white",
						hovered_sprite = "utility/search_black",
						clicked_sprite = "utility/search_black",
						actions = {
							on_click = {gui = "planetary_teleporter", action = "toggle_search"}
						}
					},
					{
						type = "sprite-button",
						style = "frame_action_button",
						sprite = "utility/close_white",
						hovered_sprite = "utility/close_black",
						clicked_sprite = "utility/close_black",
						actions = {
							on_click = {gui = "planetary_teleporter", action = "close"}
						}
					}
				}},
				-- content frame
				{type = "frame", style = "inside_shallow_frame", direction = "vertical", children = {
					-- toolbar
					{type = "frame", style = "subheader_frame", children = {
						{type = "label", style = "subheader_caption_label", caption = "<unnamed>"},
						{
							type = "sprite-button",
							style = "mini_button_aligned_to_text_vertically_when_centered",
							sprite = "utility/rename_icon_small_black",
						},
						{type = "empty-widget", style_mods = {horizontally_stretchable = true}}
					}},
					{type = "flow", style_mods = {padding = 12, vertical_spacing = 8}, direction = "vertical", children = {
						-- entity status line
						{type = "flow", style = "status_flow", children = {
							{type = "sprite", style = "status_image", sprite = "utility/status_working"},
							{type = "label", caption = "Fully charged"}
							-- TODO: progress bar
						}},
						-- entity preview
						{type = "frame", style = "deep_frame_in_shallow_frame", children = {
							{type = "entity-preview", style = "wide_entity_button", elem_mods = {entity = entity}}
						}},
					}},
					-- destinations listing
					{
						type = "scroll-pane",
						style = "kr_planetary_teleporter_destinations_scroll_pane",
						children = {
							{type = "frame", style = "kr_planetary_teleporter_destinations_frame", children = {
								{type = "table", style = "slot_table", column_count = 2, ref = {"destinations_table"}, children = {
									-- MOCKUP
									{type = "frame", style = "train_with_minimap_frame", direction = "vertical", children = {
										{type = "frame", style = "deep_frame_in_shallow_frame", children = {
											{
												type = "minimap",
												style = "kr_planetary_teleporter_destination_minimap",
												position = {0, 0},
												surface_index = 1,
												chart_player_index = 1,
												force = "player",
												zoom = 2
											}
										}},
										{type = "frame", style = "deep_frame_in_shallow_frame", children = {
											{
												type = "button",
												style = "kr_planetary_teleporter_destination_name_button",
												caption = "Teleporter 1 (5 km)"
											}
										}}
									}}
								}}
							}}
						}
					}
				}}
			}
		}
	})

	refs.titlebar_flow.drag_target = refs.window
	refs.window.force_auto_center()

	player.opened = refs.window

	global.planetary_teleporter_guis[player.index] = {
		refs = refs,
		state = {
			entity = entity,
			search_query = ""
		}
	}
end

local function handle_gui_action(msg, e)
	local player = game.get_player(e.player_index)
	local gui_data = global.planetary_teleporter_guis[e.player_index]
	local refs = gui_data.refs
	local state = gui_data.state

	if msg.action == "close" then
		if player.opened == refs.window then
			player.opened = nil
		end
		refs.window.destroy()
		player.play_sound{
			path = "entity-close/kr-planetary-teleporter"
		}
	end
end

-- EVENT HANDLERS

local function init_global_data(e)
	if not global.planetary_teleporters then
		global.planetary_teleporters = {}
	end
	if not global.planetary_teleporter_guis then
		global.planetary_teleporter_guis = {}
	end
end

local function on_entity_built(e)
	local entity = e.created_entity
	if entity and entity.valid and entity.name == pt_entity_name then
		global.planetary_teleporters[entity.unit_number] = {
			entity = entity,
			force = entity.force,
			name = nil, -- has no value by default
			position = entity.position
		}
	end
	__DebugAdapter.print(global)
end

local function on_entity_destroyed(e)
	local entity = e.entity
	if entity and entity.valid then
		global.planetary_teleporters[entity.unit_number] = nil
	end
end

local function on_gui_opened(e)
	local entity = e.entity
	if entity and entity.valid and entity.name == pt_entity_name then
		local player = game.get_player(e.player_index)
		create_gui(player, entity)
	end
end

local function on_gui_event(e)
	local msg = gui.read_action(e)
	if msg and msg.gui == "planetary_teleporter" then
		handle_gui_action(msg, e)
	end
end

return {
	-- bootstrap
	{init_global_data, "on_init"},
	{init_global_data, "on_configuration_changed"},
	-- built
	{on_entity_built, "on_built_entity", pt_built_entity_filters},
	{on_entity_built, "on_robot_built_entity", pt_built_entity_filters},
	{on_entity_built, "script_raised_built"},
	{on_entity_built, "script_raised_revive"},
	-- destroyed
	{on_entity_destroyed, "on_player_mined_entity", pt_built_entity_filters},
	{on_entity_destroyed, "on_robot_mined_entity", pt_built_entity_filters},
	{on_entity_destroyed, "on_entity_died", pt_built_entity_filters},
	-- gui
	{on_gui_opened, "on_gui_opened"},
	{on_gui_event, "on_gui_closed"},
	{on_gui_event, "on_gui_click"},
}
