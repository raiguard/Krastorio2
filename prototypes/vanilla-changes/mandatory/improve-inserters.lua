-- Enabling custom vectors and burner leech (if possible) on all inserters
for _, inserter in pairs(data.raw.inserter) do
  inserter.allow_custom_vectors = true
  if not mods["bobinserters"] then
    if inserter.localized_description then
      inserter.localised_description = {
        "other.conservative-additional-inserter-description",
        inserter.localised_description,
        { "other.additional-inserter-description" },
      }
    else
      inserter.localised_description = { "other.additional-inserter-description" }
    end
  end
  if inserter.energy_source and inserter.energy_source.type == "burner" then
    inserter.allow_burner_leech = true
    if not mods["bobinserters"] then
      inserter.localised_description = {
        "other.additional-burner-inserter-description",
        inserter.localised_description,
      }
    end
  end
end

-- Fix filter inserters bug
for name, inserter in pairs(data.raw.inserter) do
  if inserter.filter_count ~= nil then
    inserter.filter_count = 4
  end
end
