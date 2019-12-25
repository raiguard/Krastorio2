-- Add radioactive resistance to armors
function addRadioactiveResistance(armor_name, decrease, percent)
	local armor = data.raw["armor"][armor_name]
	if armor then
		if not armor.resistances then
			armor.resistances = {}
		end
		table.insert(armor.resistances,
		{
			["type"]     = "radioactive",
			["decrease"] = decrease,
			["percent"]  = percent
		})
	end
end

addRadioactiveResistance("modular-armor", 2, 15)
addRadioactiveResistance("power-armor", 3, 30)
addRadioactiveResistance("power-armor-mk2", 4, 45)
