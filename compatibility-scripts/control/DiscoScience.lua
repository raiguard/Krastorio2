function addBasicTechCardColor()
  if game.active_mods["DiscoScience"] and remote.interfaces["DiscoScience"] and remote.interfaces["DiscoScience"]["setIngredientColor"] then
    remote.call("DiscoScience", "setIngredientColor", "basic-tech-card", {r = 0.823, g = 0.411, b = 0.117})
  end
end

return
{
  { addBasicTechCardColor, "on_init" },
  { addBasicTechCardColor, "on_configuration_changed" }
}
