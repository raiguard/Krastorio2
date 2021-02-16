-- INDICATOR SPRITES

local indicators = {}
for i, color in ipairs{"black", "white", "red", "orange", "yellow", "green", "cyan", "blue", "purple", "pink"} do
  indicators[i] = {
    type = "sprite",
    name = "flib_indicator_"..color,
    filename = "__Krastorio2__/graphics/gui/styles/indicators.png",
    y = (i - 1) * 32,
    size = 32,
    flags = {"icon"}
  }
end
data:extend(indicators)