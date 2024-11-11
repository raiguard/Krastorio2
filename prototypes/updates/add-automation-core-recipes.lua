local data_util = require("data-util")

-- TODO: Rewrite this
-- Convert all electronic-circuit of early game in automation-core
local function hasEarlyGameIngredients(ingredients)
  local basic, automation = false, false
  for _, ingredient in pairs(ingredients) do
    local ingredient_name = ingredient.name
    if ingredient_name == "basic-tech-card" then
      if #ingredients == 1 then
        return true
      else
        basic = true
      end
    end
    if ingredient_name == "automation-science-pack" then
      if #ingredients == 1 then
        return true
      else
        automation = true
      end
    end
  end
  if #ingredients == 2 and basic and automation then
    return true
  else
    return false
  end
end
for name, technology in pairs(data.raw.technology) do
  if technology.enabled == false or not technology.effects then -- nil is not the same as false in this case.
    goto continue
  end
  if not technology.unit or not hasEarlyGameIngredients(technology.unit.ingredients) then
    goto continue
  end
  for _, effect in pairs(technology.effects) do
    if effect.type == "unlock-recipe" then
      local recipe = data.raw.recipe[effect.recipe]
      if not recipe then
        error("Recipe " .. effect.recipe .. " does not exist.")
      end
      for _, ingredient in pairs(recipe.ingredients or {}) do
        if ingredient.name == "electronic-circuit" then
          log(recipe.name)
          ingredient.name = "automation-core"
          ingredient.amount = math.ceil(ingredient.amount / 2)
          break
        end
      end
    end
  end
  ::continue::
end
