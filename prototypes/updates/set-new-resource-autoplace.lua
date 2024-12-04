local base_ore = "iron-ore"
if mods["angelssmelting"] then
  base_ore = "angels-ore1"
end

for _, preset in pairs(data.raw["map-gen-presets"].default) do
  if
    type(preset) == "table"
    and preset.basic_settings
    and preset.basic_settings.autoplace_controls
    and preset.basic_settings.autoplace_controls[base_ore]
  then
    preset.basic_settings.autoplace_controls["imersite"] = preset.basic_settings.autoplace_controls[base_ore]
    preset.basic_settings.autoplace_controls["mineral-water"] = preset.basic_settings.autoplace_controls[base_ore]
    preset.basic_settings.autoplace_controls["rare-metals"] = preset.basic_settings.autoplace_controls[base_ore]
  end
end

for _, resource in ipairs({"imersite", "mineral-water", "rare-metals"}) do
  data.raw.planet.nauvis.map_gen_settings.autoplace_controls[resource] = {}
  data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings[resource] = {}
end
