if not mods["Aircraft"] then
  return
end

-- Remove obsolete items
data.raw.recipe["aircraft-energy-shield"] = nil
data.raw.technology["aircraft-energy-shield"] = nil
