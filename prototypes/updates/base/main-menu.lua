local backgrounds = {
  ["Factorio Alternative 1"] = "__Krastorio2Assets__/backgrounds/factorio-alternative-1.jpg",
  ["Factorio Alternative 2"] = "__Krastorio2Assets__/backgrounds/factorio-alternative-2.jpg",
  ["Factorio Alternative 3"] = "__Krastorio2Assets__/backgrounds/factorio-alternative-3.jpg",
  ["Factorio Alternative 4"] = "__Krastorio2Assets__/backgrounds/factorio-alternative-4.jpg",
  ["Krastorio 2"] = "__Krastorio2Assets__/backgrounds/krastorio-2.jpg",
  ["Krastorio Chan"] = "__Krastorio2Assets__/backgrounds/krastorio-chan.jpg",
  ["Krastorio CyberSkull"] = "__Krastorio2Assets__/backgrounds/krastorio-cyberskull.jpg",
  ["Krastorio Explorer"] = "__Krastorio2Assets__/backgrounds/krastorio-explorer.jpg",
  ["Krastorio Legacy"] = "__Krastorio2Assets__/backgrounds/krastorio-legacy.jpg",
  ["Krastorio THE FACTORY MUST GROW"] = "__Krastorio2Assets__/backgrounds/krastorio-fmg.jpg",
}
local path_name = settings.startup["kr-main-menu-background"].value --[[@as string]]
local background = backgrounds[path_name]
if background then
  data.raw["utility-constants"]["default"].main_menu_background_image_location = background
end

-- Add new Krastorio 2 menu simulation
data.raw["utility-constants"]["default"].main_menu_simulations = {
  kr_menu_simulation = {
    checkboard = false,
    save = "__Krastorio2__/menu-simulations/menu-simulation-kr-mixed-crafting.zip",
    length = minute,
    init = [[
      game.simulation.camera_zoom = 1
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 0.5
  ]],
  },
}
