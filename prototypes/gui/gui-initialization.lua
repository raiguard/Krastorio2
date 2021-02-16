-- -- GUI parts

-- GUI elements styles
require("gui-styles")

-- Images to show in GUIs
require("images")

-- Button sprites
require("button-sprites")

-- Skip this part if not preset
if mods["flib"] then
	return
end

require("flib/sprite")
require("flib/style")