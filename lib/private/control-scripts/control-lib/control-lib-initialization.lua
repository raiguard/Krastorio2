-- Load lib functions
if not krastorio then
	krastorio = {}
end
fixed_flib_path = "__Krastorio2__/lib/private/control-scripts/control-lib/flib/"
require("script-initialization-status") -- Priority 1
require("flying-texts") -- Priority 2
require("gui") -- Priority 3
