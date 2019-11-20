-- Changes to Vanila laboratory with the new science system
if data.raw.lab["lab"] then

	local function removeFromLab(name)
		for key, pack in pairs(data.raw.lab["lab"].inputs) do
			if pack == name then
				table.remove(data.raw.lab["lab"].inputs, key)
				break
			end
		end
	end
	
	-- Remove only (for compatibility) the vanilla know science pack that should not be here
	removeFromLab("production-science-pack")
	removeFromLab("utility-science-pack")
	removeFromLab("space-science-pack")
		
	-- Adding new science pack
	for key = #data.raw.lab["lab"].inputs, 1, -1  do -- make space at the begin for the new pack
		data.raw.lab["lab"].inputs[key+1] = data.raw.lab["lab"].inputs[key]
	end
	
	data.raw.lab["lab"].inputs[1] = "basic-tech-card"
	
end
