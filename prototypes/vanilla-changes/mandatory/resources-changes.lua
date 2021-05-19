function increaseBaseDensity(resource, multiplier)
  if data.raw["resource"][resource] then
    if data.raw["resource"][resource].autoplace.base_density then
      data.raw["resource"][resource].autoplace.base_density = data.raw["resource"][resource].autoplace.base_density
        * multiplier
    else
      data.raw["resource"][resource].autoplace.base_density = multiplier
    end
  end
end

-----------------------------------------------------------------

-- Oil

data.raw.resource["crude-oil"].category = "oil"
data.raw.resource["crude-oil"].stages.sheet.filename = kr_resources_sprites_path .. "crude-oil.png"
data.raw.resource["crude-oil"].selection_box = { { -1, -1 }, { 1, 1 } }
data.raw.resource["crude-oil"].stages.sheet.width = 128
data.raw.resource["crude-oil"].stages.sheet.height = 128
data.raw.resource["crude-oil"].stages.sheet.frame_count = 4
data.raw.resource["crude-oil"].stages.sheet.scale = 0.75

data.raw.resource["crude-oil"].map_color = { 1, 0.6, 0 }

--------------

-- Pumpjack

data.raw["mining-drill"]["pumpjack"].resource_categories = { "oil" }

-----------------------------------------------------------------
-- Copper ore
increaseBaseDensity("copper-ore", 1.5)
-----------------------------------------------------------------
-- Coal
increaseBaseDensity("coal", 2)
-----------------------------------------------------------------
