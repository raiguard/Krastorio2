local util = {}

function util.disable_rocket_victory()
  if remote.interfaces["silo_script"] then
    remote.call("silo_script", "set_no_victory", true)
  end
end

return util
