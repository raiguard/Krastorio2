if mods["Flow Control"] then
  -- Changing the recipes unlocking in Krastorio way
  krastorio.recipes.disable("pipe-elbow")
  krastorio.recipes.disable("pipe-junction")
  krastorio.recipes.disable("pipe-straight")

  krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "pipe-elbow")
  krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "pipe-junction")
  krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "pipe-straight")
end
