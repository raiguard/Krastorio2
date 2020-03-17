local backgrounds_util = require(kr_public_lib .. "main-menu-backgrounds-util")

backgrounds_util.addBackgroundImage("Krastorio 2",            kr_backgrounds_icons_path .. "K2-4K.jpg")
backgrounds_util.addBackgroundImage("Krastorio Legacy",       kr_backgrounds_icons_path .. "KL-4K.jpg")
backgrounds_util.addBackgroundImage("Factorio",               "__core__/graphics/background-image.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 1", kr_backgrounds_icons_path .. "factorio-alternative-1.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 2", kr_backgrounds_icons_path .. "factorio-alternative-2.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 3", kr_backgrounds_icons_path .. "factorio-alternative-3.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 4", kr_backgrounds_icons_path .. "factorio-alternative-4.jpg")

local path_name = krastorio.general.getSafeSettingValue("kr-main-menu-background")
if path_name then
	data.raw["utility-constants"]["default"].main_menu_background_image_location = backgrounds_util.getBackgroundPath(path_name)
else
	data.raw["utility-constants"]["default"].main_menu_background_image_location = "__core__/graphics/background-image.jpg"
end
