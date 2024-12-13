if mods["SchallUraniumProcessing"] then
  krastorio.recipes.removeProduct("uranium-processing", "uranium-235")
  krastorio.recipes.removeProduct("uranium-processing", "uranium-238")
  krastorio.recipes.multiplyIngredient("uranium-fuel-cell", "uranium-low-enriched", 2)
end
