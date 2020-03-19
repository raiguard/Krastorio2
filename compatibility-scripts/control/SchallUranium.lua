function addRadioactiveItems()
	if script.active_mods["SchallUraniumProcessing"] then
		table.insert(global.krastorio.radioactive_items, "uranium-concentrate")
		table.insert(global.krastorio.radioactive_items, "uranium-low-enriched")
	end
end

return 
{
	{ addRadioactiveItems, "on_init" },
	{ addRadioactiveItems, "on_configuration_changed" }
}