-- Change background with the selected one
local backgrounds_util = require(kr_public_lib .. "main-menu-backgrounds-util")

if krastorio.general.getSafeSettingValue("kr-re-enable-menu-simulations") ~= true then
  -- Deactive menu simulations
  data.raw["utility-constants"]["default"].main_menu_simulations = nil

  backgrounds_util.addBackgroundImage("Factorio", "__core__/graphics/background-image.jpg")
  backgrounds_util.addBackgroundImage("Krastorio Legacy", kr_backgrounds_icons_path .. "krastorio-legacy.jpg")
  backgrounds_util.addBackgroundImage("Krastorio 2", kr_backgrounds_icons_path .. "krastorio-2.jpg")
  backgrounds_util.addBackgroundImage("Krastorio CyberSkull", kr_backgrounds_icons_path .. "krastorio-cyberskull.jpg")
  backgrounds_util.addBackgroundImage("Krastorio Chan", kr_backgrounds_icons_path .. "krastorio-chan.jpg")
  backgrounds_util.addBackgroundImage(
    "Krastorio THE FACTORY MUST GROW",
    kr_backgrounds_icons_path .. "krastorio-fmg.jpg"
  )
  backgrounds_util.addBackgroundImage("Krastorio Explorer", kr_backgrounds_icons_path .. "krastorio-explorer.jpg")
  backgrounds_util.addBackgroundImage(
    "Factorio Alternative 1",
    kr_backgrounds_icons_path .. "factorio-alternative-1.jpg"
  )
  backgrounds_util.addBackgroundImage(
    "Factorio Alternative 2",
    kr_backgrounds_icons_path .. "factorio-alternative-2.jpg"
  )
  backgrounds_util.addBackgroundImage(
    "Factorio Alternative 3",
    kr_backgrounds_icons_path .. "factorio-alternative-3.jpg"
  )
  backgrounds_util.addBackgroundImage(
    "Factorio Alternative 4",
    kr_backgrounds_icons_path .. "factorio-alternative-4.jpg"
  )

  local path_name = krastorio.general.getSafeSettingValue("kr-main-menu-background")
  if path_name then
    data.raw["utility-constants"]["default"].main_menu_background_image_location = backgrounds_util.getBackgroundPath(
      path_name
    )
  else
    data.raw["utility-constants"]["default"].main_menu_background_image_location =
      "__core__/graphics/background-image.jpg"
  end
else
  -- Remove base Factorio menu simulations (leave modded in)
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

  -- Add new Krastorio 2 menu simulation
  data.raw["utility-constants"]["default"].main_menu_simulations.kr_menu_simulation = {
    checkboard = false,
    save = "__Krastorio2__/menu-simulations/menu-simulation-kr-mixed-crafting.zip",
    length = 60 * 60,
    init = [[
      game.camera_zoom = 1
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 0.5
    ]],
    update = [[
    ]],
  }
  -- local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
  -- game.camera_position = {logo.position.x, logo.position.y+9.75}
end
