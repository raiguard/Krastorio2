local function disable_rocket_victory()
  if remote.interfaces["silo_script"] and remote.interfaces["silo_script"]["set_no_victory"] then
    remote.call("silo_script", "set_no_victory", true)
  end
  if remote.interfaces["freeplay"] and remote.interfaces["freeplay"]["set_skip_intro"] then
    remote.call("freeplay", "set_skip_intro", true)
  end
end

-- With control-callbacks-merger
return
{
  -- -- Bootstrap
  { disable_rocket_victory, "on_init" }      
}