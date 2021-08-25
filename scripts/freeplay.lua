local constants = require("scripts.constants")

local freeplay = {}

function freeplay.add_to_crash_site()
  if
    remote.interfaces["freeplay"]
    and not remote.call("freeplay", "get_disable_crashsite")
    and not remote.call("freeplay", "get_init_ran")
  then
    local ship_parts = remote.call("freeplay", "get_ship_parts")
    for _, part in pairs(constants.freeplay_crash_site_parts) do
      ship_parts[#ship_parts + 1] = part
    end
    remote.call("freeplay", "set_ship_parts", ship_parts)
  end
end

function freeplay.disable_rocket_victory()
  if remote.interfaces["silo_script"] then
    remote.call("silo_script", "set_no_victory", true)
  end
end

return freeplay
