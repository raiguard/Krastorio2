local compatibility = {}

function compatibility.aai_industry()
  -- Disable AAI industry crash site
  if script.active_mods["aai-industry"] and not remote.interfaces["kr-to-aai-industry"] then
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

function compatibility.nuclear_fuel()
  if game.active_mods["Nuclear Fuel"] then
    remote.call("kr-radioactivity", "add_item", "breeder-fuel-cell")
    remote.call("kr-radioactivity", "add_item", "plutonium")
    remote.call("kr-radioactivity", "add_item", "used-up-breeder-fuel-cell")
  end
end

function compatibility.schall_uranium()
  if script.active_mods["SchallUraniumProcessing"] then
    remote.call("kr-radioactivity", "add_item", "uranium-concentrate")
    remote.call("kr-radioactivity", "add_item", "uranium-low-enriched")
  end
end

function compatibility.nuclear_fuel()
  if script.active_mods["nuclear-overhaul"] then
    remote.call("kr-radioactivity", "add_entity", "thorium-ore")
    remote.call("kr-radioactivity", "add_item", "neptunium-237")
    remote.call("kr-radioactivity", "add_item", "plutonium-238")
    remote.call("kr-radioactivity", "add_item", "plutonium-239")
    remote.call("kr-radioactivity", "add_item", "plutonium-fuel")
    remote.call("kr-radioactivity", "add_item", "plutonium-mox")
    remote.call("kr-radioactivity", "add_item", "protactinium-233")
    remote.call("kr-radioactivity", "add_item", "protactinium-234")
    remote.call("kr-radioactivity", "add_item", "thorium-232")
    remote.call("kr-radioactivity", "add_item", "thorium-233")
    remote.call("kr-radioactivity", "add_item", "thorium-fuel")
    remote.call("kr-radioactivity", "add_item", "thorium-mox")
    remote.call("kr-radioactivity", "add_item", "thorium-ore")
    remote.call("kr-radioactivity", "add_item", "uranium-233")
    remote.call("kr-radioactivity", "add_item", "uranium-234")
    remote.call("kr-radioactivity", "add_item", "uranium-236")
    remote.call("kr-radioactivity", "add_item", "uranium-237")
    remote.call("kr-radioactivity", "add_item", "uranium-mox")
    remote.call("kr-radioactivity", "add_item", "used-plutonium-mox")
    remote.call("kr-radioactivity", "add_item", "used-thorium-mox")
    remote.call("kr-radioactivity", "add_item", "used-uranium-mox")
  end
end

function compatibility.should_build_pump()
  if game.entity_prototypes["kr-electric-offshore-pump"] then
    return true
  end
  return false
end

return compatibility
