-- Adding to Vanila laboratory the new science pack
if data.raw.lab["lab"] then
	--table.insert(data.raw.lab["lab"].inputs, "basic-tech-card")
	data.raw.lab["lab"].inputs = 
			{
			"basic-tech-card",
			"automation-science-pack",
			"logistic-science-pack",
			"military-science-pack",
			"chemical-science-pack",
			}
end
