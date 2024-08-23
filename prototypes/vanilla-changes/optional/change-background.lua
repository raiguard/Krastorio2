local backgrounds_util = require("lib.public.data-stages.main-menu-backgrounds-util")

-- Add possible backgrounds
backgrounds_util.addBackgroundImage("Krastorio Legacy", "__Krastorio2Assets__/backgrounds/krastorio-legacy.jpg")
backgrounds_util.addBackgroundImage("Krastorio 2", "__Krastorio2Assets__/backgrounds/krastorio-2.jpg")
backgrounds_util.addBackgroundImage("Krastorio CyberSkull", "__Krastorio2Assets__/backgrounds/krastorio-cyberskull.jpg")
backgrounds_util.addBackgroundImage("Krastorio Chan", "__Krastorio2Assets__/backgrounds/krastorio-chan.jpg")
backgrounds_util.addBackgroundImage("Krastorio THE FACTORY MUST GROW", "__Krastorio2Assets__/backgrounds/krastorio-fmg.jpg")
backgrounds_util.addBackgroundImage("Krastorio Explorer", "__Krastorio2Assets__/backgrounds/krastorio-explorer.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 1", "__Krastorio2Assets__/backgrounds/factorio-alternative-1.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 2", "__Krastorio2Assets__/backgrounds/factorio-alternative-2.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 3", "__Krastorio2Assets__/backgrounds/factorio-alternative-3.jpg")
backgrounds_util.addBackgroundImage("Factorio Alternative 4", "__Krastorio2Assets__/backgrounds/factorio-alternative-4.jpg")

-- Choose the background depending on the setting
local path_name = krastorio.general.getSafeSettingValue("kr-main-menu-background")
if path_name then
  local path = backgrounds_util.getBackgroundPath(path_name)
  if path then
    data.raw["utility-constants"]["default"].main_menu_background_image_location = path
  end
end

-- Remove base Factorio menu simulations (leave modded in)
if settings.startup["kr-main-menu-override-simulations"].value then
  if data.raw["utility-constants"]["default"].main_menu_simulations ~= nil then
    data.raw["utility-constants"]["default"].main_menu_simulations.forest_fire = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.solar_power_construction = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.lab = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.burner_city = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.mining_defense = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.biter_base_steamrolled = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.biter_base_spidertron = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.biter_base_artillery = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.biter_base_player_attack = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.biter_base_laser_defense = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.artillery = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.train_junction = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.oil_pumpjacks = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.oil_refinery = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.early_smelting = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.train_station = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.logistic_robots = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.nuclear_power = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.chase_player = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.big_defense = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.brutal_defeat = nil
    data.raw["utility-constants"]["default"].main_menu_simulations.spider_ponds = nil
  else
    data.raw["utility-constants"]["default"].main_menu_simulations = {}
  end
end

-- Add new Krastorio 2 menu simulation
data.raw["utility-constants"]["default"].main_menu_simulations.kr_menu_simulation = {
  checkboard = false,
  save = "__Krastorio2__/menu-simulations/menu-simulation-kr-mixed-crafting.zip",
  length = 60 * (settings.startup["kr-main-menu-override-simulations"].value and 60 or 10),
  init = [[
    game.camera_zoom = 1
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5
  ]],
}
