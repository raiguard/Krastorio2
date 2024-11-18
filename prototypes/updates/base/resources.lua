--- @param resource_name data.ResourceID
--- @param multiplier double
local function increase_base_density(resource_name, multiplier)
  local resource = data.raw.resource[resource_name]
  if not resource then
    error("Resource " .. resource_name .. " does not exist.")
  end
  resource.autoplace.base_density = (resource.autoplace.base_density or 1) * multiplier
end

data.raw.resource["crude-oil"].category = "oil"
data.raw.resource["crude-oil"].stages.sheet.filename = "__Krastorio2Assets__/resources/crude-oil.png"
data.raw.resource["crude-oil"].selection_box = { { -1, -1 }, { 1, 1 } }
data.raw.resource["crude-oil"].stages.sheet.width = 128
data.raw.resource["crude-oil"].stages.sheet.height = 128
data.raw.resource["crude-oil"].stages.sheet.frame_count = 4
data.raw.resource["crude-oil"].stages.sheet.scale = 0.75
data.raw.resource["crude-oil"].map_color = { 1, 0.6, 0 }

data.raw["mining-drill"]["pumpjack"].resource_categories = { "oil" }

increase_base_density("coal", 2)
increase_base_density("copper-ore", 1.5)
