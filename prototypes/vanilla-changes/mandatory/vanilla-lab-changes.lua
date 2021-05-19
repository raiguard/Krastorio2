-- Changes to Vanila laboratory with the new science system
local function removeFromLab(name, inputs)
  for key, pack in pairs(inputs) do
    if pack == name then
      table.remove(inputs, key)
      break
    end
  end
end

if data.raw.lab["lab"] then
  data.raw.lab["lab"].fast_replaceable_group = "lab"

  local vanilla_lab_inputs = data.raw.lab["lab"].inputs

  -- Remove only (for compatibility) the vanilla know science pack that should not be here
  removeFromLab("production-science-pack", vanilla_lab_inputs)
  removeFromLab("utility-science-pack", vanilla_lab_inputs)
  removeFromLab("space-science-pack", vanilla_lab_inputs)

  -- Adding new science pack
  for key = #vanilla_lab_inputs, 1, -1 do -- make space at the begin for the new pack
    vanilla_lab_inputs[key + 1] = vanilla_lab_inputs[key]
  end

  vanilla_lab_inputs[1] = "basic-tech-card"

  -- -- Adapt Krastorio 2 tier 2 laboratory (BiusArt lab)
  if data.raw.lab["biusart-lab"] then
    local biusart_lab_inputs = data.raw.lab["biusart-lab"].inputs

    -- -- Copy progressively packs in Tier 2 lab (BiusArt lab)
    for i = 1, #vanilla_lab_inputs do
      biusart_lab_inputs[i] = vanilla_lab_inputs[i]
    end
    removeFromLab("basic-tech-card", biusart_lab_inputs)
    table.insert(biusart_lab_inputs, "production-science-pack")
    table.insert(biusart_lab_inputs, "utility-science-pack")

    -- -- Adapt Krastorio 2 tier 3 laboratory
    if data.raw.lab["biusart-lab"] then
      local singularity_lab_inputs = data.raw.lab["kr-singularity-lab"].inputs

      -- -- Copy progressively packs in Tier 3 lab
      for i = 1, #biusart_lab_inputs do
        singularity_lab_inputs[i] = biusart_lab_inputs[i]
      end
      removeFromLab("automation-science-pack", singularity_lab_inputs)
      removeFromLab("logistic-science-pack", singularity_lab_inputs)
      removeFromLab("military-science-pack", singularity_lab_inputs)
      removeFromLab("chemical-science-pack", singularity_lab_inputs)
      table.insert(singularity_lab_inputs, "space-science-pack")
      table.insert(singularity_lab_inputs, "matter-tech-card")
      table.insert(singularity_lab_inputs, "advanced-tech-card")
      table.insert(singularity_lab_inputs, "singularity-tech-card")
    end
  end
end
