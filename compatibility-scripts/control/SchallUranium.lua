local function addRadioactiveItems()
  if not global.krastorio.schall_uranium_processing_compatibility and script.active_mods["SchallUraniumProcessing"] then
    table.insert(global.krastorio.radioactive_items, "uranium-concentrate")
    table.insert(global.krastorio.radioactive_items, "uranium-low-enriched")
    global.krastorio.schall_uranium_processing_compatibility = true
  end
end

return 
{
  { addRadioactiveItems, "on_init" },
  { addRadioactiveItems, "on_configuration_changed" }
}