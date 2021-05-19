local DECT = require("compatibility-scripts/data-final-fixes/Dectorio/config")

if mods["Dectorio"] then
  local tile_filters = data.raw["selection-tool"]["kr-jackhammer"].tile_filters
  local alt_tile_filters = data.raw["selection-tool"]["kr-jackhammer"].alt_tile_filters

  -- WOOD TILE
  if DECT.ENABLED["wood-floor"] then
    if data.raw.tile["dect-wood-floor"] then
      table.insert(tile_filters, "dect-wood-floor")
      table.insert(alt_tile_filters, "dect-wood-floor")
    end
  end

  -- NORMAL CONCRETES
  if DECT.ENABLED["concrete"] then
    if data.raw.tile["dect-concrete-grid"] then
      table.insert(tile_filters, "dect-concrete-grid")
      table.insert(alt_tile_filters, "dect-concrete-grid")
    end
  end

  -- GRAVELS
  if DECT.ENABLED["gravel"] then
    for _, variant in pairs(DECT.CONFIG.GRAVEL_VARIANTS) do
      if data.raw.tile["dect-" .. variant.name .. "-gravel"] then
        table.insert(tile_filters, "dect-" .. variant.name .. "-gravel")
        table.insert(alt_tile_filters, "dect-" .. variant.name .. "-gravel")
      end
    end
  end

  -- PAINTED CONCRETES
  if DECT.ENABLED["painted-concrete"] then
    local directions = {
      "left",
      "right",
    }
    for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
      for _, direction in pairs(directions) do
        if data.raw.tile["dect-paint-" .. variant.name .. "-" .. direction] then
          table.insert(tile_filters, "dect-paint-" .. variant.name .. "-" .. direction)
          table.insert(alt_tile_filters, "dect-paint-" .. variant.name .. "-" .. direction)
        end
        if data.raw.tile["dect-paint-refined-" .. variant.name .. "-" .. direction] then
          table.insert(tile_filters, "dect-paint-refined-" .. variant.name .. "-" .. direction)
          table.insert(alt_tile_filters, "dect-paint-refined-" .. variant.name .. "-" .. direction)
        end
      end
    end
  end

  -- BASE COLORED CONCRETES
  for _, color in pairs(DECT.CONFIG.BASE_COLORS) do
    table.insert(tile_filters, color.name .. "-refined-concrete")
    table.insert(alt_tile_filters, color.name .. "-refined-concrete")
  end

  local d_stack_size = krastorio.general.getSafeSettingValue("dectorio-flooring-stack-size")

  data.raw.item["landfill"].stack_size = d_stack_size
  data.raw.item["stone-brick"].stack_size = d_stack_size
  data.raw.item["concrete"].stack_size = d_stack_size
  data.raw.item["refined-concrete"].stack_size = d_stack_size
  data.raw.item["hazard-concrete"].stack_size = d_stack_size
  data.raw.item["refined-hazard-concrete"].stack_size = d_stack_size
  data.raw.item["kr-white-reinforced-plate"].stack_size = d_stack_size
  data.raw.item["kr-black-reinforced-plate"].stack_size = d_stack_size
  data.raw.item["kr-creep"].stack_size = d_stack_size
end
