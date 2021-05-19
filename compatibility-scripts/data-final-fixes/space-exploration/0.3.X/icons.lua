if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Re-graphics update of shield-equipments
  local objects_to_modify = {
    ["energy-shield-equipment"] = {
      ["energy-shield-equipment"] = { "energy-shield-mk1-equipment.png", 32, 64, 64 },
      ["energy-shield-mk2-equipment"] = { "energy-shield-mk2-equipment.png", 32, 64, 64 },
      ["energy-shield-mk3-equipment"] = { "energy-shield-mk3-equipment.png", 32, 64, 64 },
      ["energy-shield-mk4-equipment"] = { "energy-shield-mk4-equipment.png", 32, 64, 64 },
    },
  }

  -- iterating...
  updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)
end
