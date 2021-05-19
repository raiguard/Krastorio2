-- Compatibility provided by sonaxaton-02/08/2020-v1

if mods["Nuclear Fuel"] then
  ------------------------------------------------------------------------------------
  -- -- RECIPES

  local nuclear_fuel_cycle_type = settings.startup["nuclear-fuel-cycle-type"].value
  local nuclear_fuel_cycle_ingredient_multiplier
  local nuclear_fuel_cycle_product_multiplier
  if nuclear_fuel_cycle_type == "classic" then
    nuclear_fuel_cycle_ingredient_multiplier = 4
    nuclear_fuel_cycle_product_multiplier = 4
  else
    nuclear_fuel_cycle_ingredient_multiplier = 2
    nuclear_fuel_cycle_product_multiplier = 4 / 3
  end

  -- Multiply K2 nuclear fuel reprocessing recipe core products,
  -- keep Pu added by NF and energy already multiplied by NF,
  -- also don"t change the stone and tritium byproducts added by K2,
  -- the end result is the K2 recipe multiplied by NF"s multiplier with the Pu added by NF.
  krastorio.recipes.multiplyIngredient(
    "nuclear-fuel-reprocessing",
    "used-up-uranium-fuel-cell",
    nuclear_fuel_cycle_ingredient_multiplier
  )
  krastorio.recipes.multiplyProduct("nuclear-fuel-reprocessing", "uranium-238", nuclear_fuel_cycle_product_multiplier)
  data.raw.recipe["nuclear-fuel-reprocessing"].main_product = nil

  -- Update NF MOX fuel cell recipe to produce the same relative amount of fuel cells per Pu as it does when just used with vanilla,
  -- this is balanced because fuel cells are more energy-rich in K2,
  -- K2 reduces fuel cells in nuclear fuel reprocessing by a factor of 5,
  -- so we want to do the same with the fuel cells in MOX,
  -- also, K2 replaces the 1 iron plate per fuel cell in the fuel cell recipe with 1 steel plate, so we do the same here.
  krastorio.recipes.replaceIngredient("mox-fuel-cell", "iron-plate", { "steel-plate", 2 })
  krastorio.recipes.replaceProduct("mox-fuel-cell", "uranium-fuel-cell", { "uranium-fuel-cell", 2 })

  -- Update NF breeder fuel cell recipe, exact same logic as MOX fuel cell recipe.
  krastorio.recipes.replaceIngredient("breeder-fuel-cell", "iron-plate", { "steel-plate", 2 })
  krastorio.recipes.replaceProduct("breeder-fuel-cell", "breeder-fuel-cell", { "breeder-fuel-cell", 2 })

  -- Update NF breeder fuel reprocessing recipe to use 5x less cells for the same amount of Pu,
  -- also make it produce more U235,
  -- with vanilla, breeder reprocessing produces enough U235 to make the same number of fuel cells as breeder fuel cells that were reprocessed,
  -- so with K2 we want the same ratio: 4 U235 makes 2 fuel cells,
  -- if Schall"s Uranium Processing AND K2 are installed, this becomes 8 LEU (with just Schall it"s 4 but K2"s compat script multiplies it by 2) to make 2 fuel cells.
  krastorio.recipes.replaceIngredient(
    "breeder-fuel-reprocessing",
    "used-up-breeder-fuel-cell",
    { "used-up-breeder-fuel-cell", 2 }
  )
  local breeder_reprocessing_product = nil
  if mods["SchallUraniumProcessing"] then
    breeder_reprocessing_product = { "uranium-low-enriched", 8 }
  else
    breeder_reprocessing_product = { "uranium-235", 4 }
  end
  krastorio.recipes.replaceProduct("breeder-fuel-reprocessing", "uranium-235", breeder_reprocessing_product)

  -- Update NF nuclear fuel from Pu to produce more rocket fuel since Pu is harder to produce.
  krastorio.recipes.multiplyIngredient("nuclear-fuel-pu", "rocket-fuel", 4)
  krastorio.recipes.multiplyProduct("nuclear-fuel-pu", "nuclear-fuel", 4)

  -- Update atomic bomb from Pu recipe to include heavy rocket as K2 does for the normal recipe
  krastorio.recipes.addIngredient("atomic-bomb-pu", { "heavy-rocket", 1 })

  ------------------------------------------------------------------------------------
  -- -- STACK SIZES

  -- Update stack sizes of items added by NF that should have been modified by K2.
  local kr_stack_size_value = krastorio.general.getSafeSettingValue("kr-stack-size")
  if kr_stack_size_value and kr_stack_size_value ~= "No changes" then
    data.raw.item["plutonium"].stack_size = kr_stack_size_value
    data.raw.item["breeder-fuel-cell"].stack_size = 10
    data.raw.item["used-up-breeder-fuel-cell"].stack_size = 10
  end

  ------------------------------------------------------------------------------------
  -- -- FUEL VALUES

  -- Update breeder fuel cell value to keep the same ratio it had to vanilla fuel cells (half).
  data.raw.item["breeder-fuel-cell"].fuel_value = "25GJ"

  ------------------------------------------------------------------------------------
  -- -- TECHNOLOGY

  -- NF disables the Kovarex Enrichment Process technology completely,
  -- but some K2 techs depend on it,
  -- so remove those dependencies.
  for technology_name, _ in pairs(data.raw.technology) do
    if krastorio.technologies.removePrerequisite(technology_name, "kovarex-enrichment-process") then
      log("removed kovarex-enrichment-process prerequisite from " .. technology_name)
    end
  end
end
