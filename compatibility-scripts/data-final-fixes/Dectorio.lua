if mods["Dectorio"] then
	DECT = require("__Dectorio__/config")
	local tile_filters = data.raw["selection-tool"]["kr-jackhammer"].tile_filters
	local alt_tile_filters = data.raw["selection-tool"]["kr-jackhammer"].alt_tile_filters
	
	if DECT.ENABLED["painted-concrete"] then
		local directions = 
		{
			"left",
			"right"
		}
		for _, variant in pairs(DECT.CONFIG.PAINT_VARIANTS) do
			for _, direction in pairs(directions) do
				if data.raw.tile["dect-paint-"..variant.name.."-"..direction] then
					table.insert(tile_filters, "dect-paint-"..variant.name.."-"..direction)
					table.insert(alt_tile_filters, "dect-paint-"..variant.name.."-"..direction)
				end
				if data.raw.tile["dect-paint-refined-"..variant.name.."-"..direction] then
					table.insert(tile_filters, "dect-paint-refined-"..variant.name.."-"..direction)
					table.insert(alt_tile_filters, "dect-paint-refined-"..variant.name.."-"..direction)
				end
			end
		end
	end
	if DECT.ENABLED["concrete"] then
		if data.raw.tile["dect-concrete-grid"] then
			table.insert(tile_filters, "dect-concrete-grid")
			table.insert(alt_tile_filters, "dect-concrete-grid")
		end
	end
end