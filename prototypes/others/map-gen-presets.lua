local presets = data.raw["map-gen-presets"]["default"]

local rich_resources = presets["rich-resources"]
if rich_resources then
  local controls = rich_resources.basic_settings and rich_resources.basic_settings.autoplace_controls
  if controls then
    controls["imersite"] = { richness = "very-good" }
    controls["mineral-water"] = { richness = "very-good" }
    controls["rare-metals"] = { richness = "very-good" }
  end
end

local rail_world = presets["rail-world"]
if rail_world then
  local controls = rail_world.basic_settings and rail_world.basic_settings.autoplace_controls
  if controls then
    controls["imersite"] = { frequency = 0.33333333333, size = 3 }
    controls["mineral-water"] = { frequency = 0.33333333333, size = 3 }
    controls["rare-metals"] = { frequency = 0.33333333333, size = 3 }
  end
end

local ribbon_world = presets["ribbon-world"]
if ribbon_world then
  local controls = ribbon_world.basic_settings and ribbon_world.basic_settings.autoplace_controls
  if controls then
    controls["imersite"] = { frequency = 3, size = 0.5, richness = 2 }
    controls["mineral-water"] = { frequency = 3, size = 0.5, richness = 2 }
    controls["rare-metals"] = { frequency = 3, size = 0.5, richness = 2 }
  end
end
