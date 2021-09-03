if mods["Tral_robot_tree_farm"] then
  local function add_seed_stuff(seed)
    -- create its recipe
    local recipe = table.deepcopy(m_tral.base_recipes.seed)
    recipe.name = "kr2" .. seed.name
    recipe.result = seed.name
    recipe.enabled = true

    -- change subgroup of seed (they get placed in the place of the krastorio tree)
    seed.subgroup = "kr-decorations-1"
    -- change order of seed (they stay the same but get the krastorio order id)
    seed.order = "a[" .. seed.name .. "]"

    -- add recipe to game
    data:extend({ recipe })
    -- add recipe to technology
    table.insert(data.raw["technology"]["kr-decorations"].effects, { type = "unlock-recipe", recipe = recipe.name })

    -- create the crushing recipe
    local crushing_recipe = table.deepcopy(m_tral.base_recipes.crushing)
    crushing_recipe.name = "kr-vc-" .. seed.name
    crushing_recipe.ingredients = { { seed.name, 1 } }

    -- add it to the game
    data:extend({ crushing_recipe })
  end

  -- if uniseed is active
  if krastorio.general.getSafeSettingValue("rtf-uniseed") then
    local seed = data.raw["item"]["rtf-uniseed-seed"]

    add_seed_stuff(seed)
  else
    -- cycle through all the trees
    for id, tree in pairs(data.raw["tree"]) do
      local seed_name = "rtf-" .. tree.name .. "-seed"
      local seed = data.raw["item"][seed_name]

      -- if there is a seed for that tree
      if seed then
        add_seed_stuff(seed)
      end
    end
  end
end
