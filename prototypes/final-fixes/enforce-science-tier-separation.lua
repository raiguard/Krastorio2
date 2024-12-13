--- For every technology with `base_pack`, removes all occurrences of `incompatible_packs`.
--- @param base_pack data.ItemID
--- @param incompatible_packs table<data.ItemID, boolean>
local function remove_incompatible_packs(base_pack, incompatible_packs)
  for _, technology in pairs(data.raw.technology) do
    if not technology.unit then
      goto continue
    end

    local ingredients = technology.unit.ingredients
    if not ingredients then
      error("Technology " .. technology.name .. " unit ingredients are nil")
    end

    local has_base = false
    for i = 1, #ingredients do
      if ingredients[i][1] == base_pack then
        has_base = true
        break
      end
    end
    if not has_base then
      goto continue
    end

    for i = #ingredients, 1, -1 do
      local ingredient = ingredients[i]
      if incompatible_packs[ingredient[1]] then
        table.remove(ingredients, i)
      end
    end

    ::continue::
  end
end

local tier_2_incompatibilities = {
  ["basic-tech-card"] = true,
  ["automation-science-pack"] = true,
  ["logistic-science-pack"] = true,
  ["military-science-pack"] = true,
  ["chemical-science-pack"] = true,
}

remove_incompatible_packs("advanced-tech-card", tier_2_incompatibilities)
remove_incompatible_packs(kr_optimization_tech_card_name, tier_2_incompatibilities)
remove_incompatible_packs("matter-tech-card", tier_2_incompatibilities)
remove_incompatible_packs("singularity-tech-card", tier_2_incompatibilities)

remove_incompatible_packs("production-science-pack", { ["basic-tech-card"] = true })
remove_incompatible_packs("utility-science-pack", { ["basic-tech-card"] = true })
