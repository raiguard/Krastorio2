if mods["Tral_robot_tree_farm"] then
  m_tral = {}

  -- reference to technology effects
  m_tral.deco_tech_effects = data.raw["technology"]["kr-decorations"].effects

  -- base recipes to copy properties from
  m_tral.base_recipes = {}
  m_tral.base_recipes.seed = table.deepcopy(data.raw["recipe"]["tree-01"])
  m_tral.base_recipes.crushing = table.deepcopy(data.raw["recipe"]["kr-vc-tree-01"])

  -- cycle through all effects of the technology
  for i, element in pairs(m_tral.deco_tech_effects) do
    -- if it's a tree recipe
    if string.sub(element.recipe, 0, 4) == "tree" then
      -- remove the recipe from the technology
      m_tral.deco_tech_effects[i] = nil
      -- remove the recipe from the game
      data.raw["recipe"][element.recipe] = nil
      -- remove the tree item from the game
      data.raw["item"][element.recipe] = nil
      -- remove the crushing recipe from the game
      data.raw["recipe"]["kr-vc-" .. element.recipe] = nil
    end
  end
end
