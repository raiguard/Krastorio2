local matrix = require ("__Krastorio2__/lib/private/data-stages/matrix")

-- -- -- FLARE STACK AND LIQUID EVAPORATOR UTIL
-- -- PRIVATE KRASTORIO USE ONLY
-- Notes: in flare stack liquid is blacklisted, in liquid evaporator is whitelisted 

if not krastorio.dlr_func then
	krastorio.dlr_func = {}
	-- CONSTANTS
	krastorio.dlr_func.CORNER_PATH      = kr_recipes_icon_path .. "burn-recipe-corner.png"
	krastorio.dlr_func.CORNER_PATH_MASK = kr_recipes_icon_path .. "burn-recipe-corner-mask.png"
	krastorio.dlr_func.ICON_SIZE        = 64
	krastorio.dlr_func.SCALE            = 0.34
end

-- @ fluid_name, name of fluid
-- @ recipe_type, "burn" or "evaporate"
-- @ building "k-flare-stack" or "k-liquid-evaporator"
-- @ residue, pointer to residue list
-- @ list, pointer to whitelist or blacklist
-- @ list_mode blacklist false whitelist true
-- @ color_fixer a color for smooth the main liquid color
function krastorio.dlr_func.generateDestroyFluidsRecipe(fluid_name, recipe_type, building, residue, list, list_mode, color)

	if data.raw.fluid[fluid_name] then
	
		local tech_name = krastorio.technologies.getTechnologyThatUnlockRecipe(building)
		local accepted = false
		if list_mode then
			if list[fluid_name] then accepted = true end -- whitelist
		else
			if not list[fluid_name] then accepted = true end -- blacklist
		end
		
		if tech_name and accepted then					
			local fluid = data.raw.fluid[fluid_name]
			local recipe = 
			{
				type = "recipe",
				name = "kr-" .. recipe_type .. "-" .. fluid.name,
				localised_name={"recipe-name." .. recipe_type, (fluid.localised_name or ({"fluid-name." .. fluid.name}))},
				localised_description={"recipe-description." .. recipe_type, (fluid.localised_name or ({"fluid-name." .. fluid.name}))},
				category = building,
				icons=
				{
					{
						icon = krastorio.dlr_func.CORNER_PATH,
						icon_size = krastorio.dlr_func.ICON_SIZE
					},
					{
						icon = krastorio.dlr_func.CORNER_PATH_MASK,
						icon_size = krastorio.dlr_func.ICON_SIZE,
						tint = krastorio.dlr_func.setTransparency(fluid.base_color, 0.9)
					}						
				},
				crafting_machine_tint =
				{
					primary = fluid.base_color, 
                    secondary = krastorio.dlr_func.setTransparency(fluid.base_color, 0.35), 
                    tertiary = krastorio.dlr_func.setTransparency(fluid.flow_color, 0.5), 
                    quaternary = krastorio.dlr_func.setTransparency(fluid.flow_color, 0.75)					
				},
				energy_required = 2,
				enabled = false,
				hidden = true,
				hide_from_player_crafting = true,
				always_show_products = false,
				show_amount_in_title = false,
				ingredients =
				{
					{type="fluid", name=fluid.name, amount=100}
				},
				results =
				{
					{type="fluid", name="kr-void", amount=0}
				},
				subgroup = "k-void",
				order = fluid.order
			}
			
			-- complete icon overlay
			krastorio.icons.addOverlayIcons(recipe, krastorio.icons.getIconsForOverlay(fluid), krastorio.dlr_func.ICON_SIZE, krastorio.dlr_func.SCALE)
			
			-- if have a residue, insert in product and changed description
			if residue[fluid.name] then
				table.insert(recipe.results, residue[fluid.name])
				recipe.localised_description=
				{
					"recipe-description." .. recipe_type .. "-with-residue", 
					{"fluid-name." .. fluid.name}, 
					{"item-name." .. krastorio.items.getItemName(residue[fluid.name])}
				}
			end
	
			data:extend({recipe})
			krastorio.technologies.addUnlockRecipe(tech_name, recipe.name)		
			
		end		
		
	end
	
end

-- For fade the fluid corner colors, used in flame quaternary colors definition 
function krastorio.dlr_func.setTransparency(colour, alpha)
	colour.a = alpha
	return colour
end	

-- See https://en.wikipedia.org/wiki/Color_balance#Scaling_monitor_R,_G,_and_B
function krastorio.dlr_func.scalingColorMonitor(fixer, colour)
	
	local fixer_matrix  = matrix{{fixer.r,0,0},{0,fixer.g,0},{0,0,fixer.b}}
	local colour_matrix = matrix{{colour.r},{colour.g},{colour.b}}

	local result_matrix = fixer_matrix * colour_matrix
	
	return {r = result_matrix[1][1], g = result_matrix[2][1], b = result_matrix[3][1]}
end

return krastorio.dlr_func
