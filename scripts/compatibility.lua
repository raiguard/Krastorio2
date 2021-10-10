local compatibility = {}

function compatibility.aai_industry()
  -- Disable AAI industry crash site
  if script.active_mods["aai-industry"] then
    remote.add_interface("kr-to-aai-industry", {
      allow_aai_crash_sequence = function(_)
        return { allow = false, weight = 1 }
      end,
    })
  end
end

function compatibility.disco_science()
  if
    game.active_mods["DiscoScience"]
    and remote.interfaces["DiscoScience"]
    and remote.interfaces["DiscoScience"]["setIngredientColor"]
  then
    remote.call("DiscoScience", "setIngredientColor", "basic-tech-card", { r = 0.823, g = 0.411, b = 0.117 })
  end
end

function compatibility.schall_uranium()
  if script.active_mods["SchallUraniumProcessing"] then
    remote.call("kr-radioactivity", "add_item", "uranium-concentrate")
    remote.call("kr-radioactivity", "add_item", "uranium-low-enriched")
  end
end

function compatibility.should_build_pump()
  if game.entity_prototypes["kr-electric-offshore-pump"] then
    return true
  end
  return false
end

return compatibility
