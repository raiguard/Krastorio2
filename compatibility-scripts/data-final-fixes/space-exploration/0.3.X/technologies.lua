if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Add prerequisites to platform scaffold
  ---------------------------------------------------------------------------------------------------------------
  krastorio.technologies.addPrerequisite("se-space-platform-scaffold", "logistics-2")
  krastorio.technologies.addPrerequisite("se-space-platform-scaffold", "kr-steel-fluid-handling")
  ---------------------------------------------------------------------------------------------------------------

  -- Avoid overprequisites with the personal batteries
  ---------------------------------------------------------------------------------------------------------------
  krastorio.technologies.addResearchUnitIngredient("battery-mk2-equipment", "automation-science-pack")
  krastorio.technologies.addResearchUnitIngredient("battery-mk2-equipment", "logistic-science-pack")
  krastorio.technologies.addResearchUnitIngredient("battery-mk2-equipment", "chemical-science-pack")
  krastorio.technologies.removeResearchUnitIngredient("battery-mk2-equipment", "utility-science-pack")
  krastorio.technologies.removeResearchUnitIngredient("battery-mk2-equipment", "space-science-pack")

  krastorio.technologies.addResearchUnitIngredient("kr-battery-mk3-equipment", "automation-science-pack")
  krastorio.technologies.addResearchUnitIngredient("kr-battery-mk3-equipment", "logistic-science-pack")
  krastorio.technologies.addResearchUnitIngredient("kr-battery-mk3-equipment", "chemical-science-pack")
  krastorio.technologies.removeResearchUnitIngredient("kr-battery-mk3-equipment", "space-science-pack")

  krastorio.technologies.removeResearchUnitIngredient("personal-roboport-equipment", "utility-science-pack")
  ---------------------------------------------------------------------------------------------------------------

  -- Repeting Krastorio 2 science coherence for the basic tech card in the upper tiers
  ---------------------------------------------------------------------------------------------------------------
  for technology_name, technology in pairs(data.raw.technology) do
    local ingredients = technology.unit.ingredients
    if ingredients and #ingredients > 1 then
      local is_in = false
      for i = 1, #ingredients do
        local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
        if ingredient_name == "production-science-pack" or ingredient_name == "utility-science-pack" then
          is_in = true
          break
        end
      end
      if is_in then
        for i = 1, #ingredients do
          local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
          if ingredient_name == "basic-tech-card" then
            for j, prerequisite_name in pairs(technology.prerequisites) do
              if prerequisite_name == ingredient_name then
                table.remove(technology.prerequisites, j)
                break
              end
            end
            table.remove(ingredients, i)
            break
          end
        end
      end
    end
  end
  ---------------------------------------------------------------------------------------------------------------

  -- Armor requirments
  ---------------------------------------------------------------------------------------------------------------
  krastorio.technologies.removeResearchUnitIngredient("power-armor", "utility-science-pack")
  ---------------------------------------------------------------------------------------------------------------

  -- Fix that portable fusion reactor is unlockable when is not anymore usefull
  ---------------------------------------------------------------------------------------------------------------
  krastorio.technologies.removePrerequisite("fusion-reactor-equipment", "se-rtg-equipment-2")
  krastorio.technologies.removePrerequisite("fusion-reactor-equipment", "se-deep-space-science-pack")
  ---------------------------------------------------------------------------------------------------------------

  data.raw.technology["se-rocket-fuel-from-water"] = nil
end
