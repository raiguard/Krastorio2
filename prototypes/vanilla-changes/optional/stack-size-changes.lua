-- -- Increase stacks size
if krastorio.general.getSafeSettingValue("kr-stack-size") then 

	data.raw["capsule"]["cliff-explosives"].stack_size = 100
	data.raw.item["processing-unit"].stack_size = 200
	data.raw.item["uranium-ore"].stack_size = 200
	data.raw.item["coal"].stack_size = 200
	data.raw.item["stone"].stack_size = 200
	data.raw.item["stone-brick"].stack_size = 200
	data.raw.item["iron-ore"].stack_size = 200
	data.raw.item["copper-ore"].stack_size = 200 
	data.raw.item["wood"].stack_size = 200
	data.raw.item["iron-plate"].stack_size = 200
	data.raw.item["copper-plate"].stack_size = 200
	data.raw.item["iron-stick"].stack_size = 200
	data.raw.item["stone-wall"].stack_size = 200
	data.raw.item["steel-plate"].stack_size = 200 
	data.raw.item["plastic-bar"].stack_size = 200
	data.raw.item["concrete"].stack_size = 200
	data.raw.item["sulfur"].stack_size = 200
	data.raw.item["refined-concrete"].stack_size = 200
	data.raw.item["hazard-concrete"].stack_size = 200
	data.raw.item["refined-hazard-concrete"].stack_size = 200
	data.raw.item["uranium-235"].stack_size = 200
	data.raw.item["uranium-238"].stack_size = 200
	data.raw.item["empty-barrel"].stack_size = 50
	data.raw.item["nuclear-fuel"].stack_size = 25
	data.raw.item["rocket-control-unit"].stack_size = 100
	data.raw.item["rocket-fuel"].stack_size = 100
	data.raw.item["low-density-structure"].stack_size = 100
	data.raw.ammo["artillery-shell"].stack_size = 25
	data.raw.item["uranium-fuel-cell"].stack_size = 10
	data.raw.item["used-up-uranium-fuel-cell"].stack_size = 10

end