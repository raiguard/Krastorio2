-- -- Inter/Cross compatibility with deadlock beltboxes loaders with IndustrialRevolution
-- -- And Krastorio renaming
if mods["deadlock-beltboxes-loaders"] and not mods["IndustrialRevolution"] then
  local function krCreateStacks(_stackable_krastorio_items)
    for i, items in pairs(_stackable_krastorio_items) do
      for _, item_name in pairs(items) do
        ---@diagnostic disable-next-line
        deadlock.destroy_stack(item_name)
        ---@diagnostic disable-next-line
        deadlock.add_stack(item_name, nil, "deadlock-stacking-" .. i)
      end
    end
  end

  stackable_krastorio_items = {
    [1] = {
      "iron-plate",
      "copper-plate",
      "iron-gear-wheel",
    },
    [2] = { -- Tier 2
      "steel-plate",
    },
  }

  krCreateStacks(stackable_krastorio_items)
end
