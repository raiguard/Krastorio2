if mods["IndustrialRevolution"] then

	local ir_icon_path = "__IndustrialRevolution__/graphics/icons/"
	-- -- -- Icons
	-- Raw
	
	-- Sand
	krastorio.icons.setItemIcon("sand", ir_icon_path .. "64/sand.png")
	data.raw.item["sand"].pictures = nil

	-- Irons
	krastorio.icons.setItemIcon("iron-plate", ir_icon_path .. "64/iron-plate.png")
	data.raw.item["iron-plate"].pictures = nil
	krastorio.icons.setItemIcon("iron-beam", ir_icon_path .. "64/iron-beam.png")
	krastorio.icons.setItemIcon("iron-stick", ir_icon_path .. "64/iron-stick.png")
	krastorio.icons.setItemIcon("iron-gear-wheel", ir_icon_path .. "64/iron-gear-wheel.png")

	-- Coppers
	krastorio.icons.setItemIcon("copper-plate", ir_icon_path .. "64/copper-plate.png")
	data.raw.item["copper-plate"].pictures = nil
	krastorio.icons.setItemIcon("copper-cable", ir_icon_path .. "64/copper-cable.png")

	-- Steels	
	krastorio.icons.setItemIcon("steel-plate", ir_icon_path .. "64/steel-plate.png")
	data.raw.item["steel-plate"].pictures = nil
	krastorio.icons.setItemIcon("steel-gear-wheel", ir_icon_path .. "128/steel-gear-wheel.png", 128)

	-- ENTITIES/BUILDINGS
	-- Drills
	krastorio.icons.setItemIcon("electric-mining-drill", ir_icon_path .. "64/electric-mining-drill.png")
	krastorio.icons.setItemIcon("burner-mining-drill", ir_icon_path .. "64/burner-mining-drill.png")
	-- Assemblers
	krastorio.icons.setItemIcon("assembling-machine-1", ir_icon_path .. "64/assembler1.png")
	krastorio.icons.setItemIcon("assembling-machine-2", ir_icon_path .. "64/assembler2.png")
	krastorio.icons.setItemIcon("assembling-machine-3", ir_icon_path .. "64/assembler3.png")
	-- Chests
	krastorio.icons.setItemIcon("iron-chest", ir_icon_path .. "64/iron-chest.png")
	krastorio.icons.setItemIcon("gold-chest", ir_icon_path .. "64/gold-chest.png")
	krastorio.icons.setItemIcon("steel-chest", ir_icon_path .. "64/steel-chest.png")
	
end
