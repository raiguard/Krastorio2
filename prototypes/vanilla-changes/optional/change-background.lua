if krastorio.general.getSafeSettingValue("kr-re-enable-menu-simulations") ~= true then
	-- Deactive menu simulations
	data.raw["utility-constants"]["default"].main_menu_simulations = nil
	
	-- Change background with the selected one
	local backgrounds_util = require(kr_public_lib .. "main-menu-backgrounds-util")

	backgrounds_util.addBackgroundImage("Factorio",                        "__core__/graphics/background-image.jpg")
	backgrounds_util.addBackgroundImage("Krastorio Legacy",       		   kr_backgrounds_icons_path .. "krastorio-legacy.jpg")
	backgrounds_util.addBackgroundImage("Krastorio 2",            		   kr_backgrounds_icons_path .. "krastorio-2.jpg")
	backgrounds_util.addBackgroundImage("Krastorio CyberSkull",   		   kr_backgrounds_icons_path .. "krastorio-cyberskull.jpg")
	backgrounds_util.addBackgroundImage("Krastorio Chan",      			   kr_backgrounds_icons_path .. "krastorio-chan.jpg")
	backgrounds_util.addBackgroundImage("Krastorio THE FACTORY MUST GROW", kr_backgrounds_icons_path .. "krastorio-fmg.jpg")
	backgrounds_util.addBackgroundImage("Krastorio Explorer",     		   kr_backgrounds_icons_path .. "krastorio-explorer.jpg")
	backgrounds_util.addBackgroundImage("Factorio Alternative 1", 		   kr_backgrounds_icons_path .. "factorio-alternative-1.jpg")
	backgrounds_util.addBackgroundImage("Factorio Alternative 2", 		   kr_backgrounds_icons_path .. "factorio-alternative-2.jpg")
	backgrounds_util.addBackgroundImage("Factorio Alternative 3", 		   kr_backgrounds_icons_path .. "factorio-alternative-3.jpg")
	backgrounds_util.addBackgroundImage("Factorio Alternative 4", 		   kr_backgrounds_icons_path .. "factorio-alternative-4.jpg")

	local path_name = krastorio.general.getSafeSettingValue("kr-main-menu-background")
	if path_name then
		data.raw["utility-constants"]["default"].main_menu_background_image_location = backgrounds_util.getBackgroundPath(path_name)
	else
		data.raw["utility-constants"]["default"].main_menu_background_image_location = "__core__/graphics/background-image.jpg"
	end
end
