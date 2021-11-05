krastorio.technologies = {}

krastorio.technologies.research_types = {
  "inserter-stack-size-bonus",
  "stack-inserter-capacity-bonus",
  "laboratory-speed",
  "character-logistic-slots",
  "character-logistic-trash-slots",
  "maximum-following-robots-count",
  "worker-robot-speed",
  "worker-robot-storage",
  "ghost-time-to-live",
  "turret-attack",
  "ammo-damage",
  "give-item",
  "gun-speed",
  "unlock-recipe",
  "character-crafting-speed",
  "character-mining-speed",
  "character-running-speed",
  "character-build-distance",
  "character-item-drop-distance",
  "character-reach-distance",
  "character-resource-reach-distance",
  "character-item-pickup-distance",
  "character-loot-pickup-distance",
  "character-inventory-slots-bonus",
  "deconstruction-time-to-live",
  "character-health-bonus",
  "auto-character-logistic-trash-slots",
  "mining-drill-productivity-bonus",
  "train-braking-force-bonus",
  "zoom-to-world-enabled",
  "zoom-to-world-ghost-building-enabled",
  "zoom-to-world-blueprint-enabled",
  "zoom-to-world-deconstruction-planner-enabled",
  "zoom-to-world-selection-tool-enabled",
  "worker-robot-battery",
  "laboratory-productivity",
  "follower-robot-lifetime",
  "artillery-range",
  "nothing",
}

krastorio.technologies.science_pack_collections = {
  ["Vanilla"] = {
    "automation-science-pack",
    "logistic-science-pack",
    "military-science-pack",
    "chemical-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack",
  },
}

-- -- -- GETTING(READ) FUNCTIONS

-- -- PREREQUISITES

function krastorio.technologies.getPrerequisites(technology_name)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology and next(technology) ~= nil then
    if not technology.prerequisites then
      technology.prerequisites = {}
    end
    return technology.prerequisites
  end
  return {}
end

function krastorio.technologies.hasPrerequisite(technology_name, prerequisite_name)
  local prerequisites = krastorio.technologies.getPrerequisites(technology_name)
  if prerequisites and #prerequisites > 0 then
    for _, prerequisite in pairs(prerequisites) do
      if prerequisite == prerequisite_name then
        return true
      end
    end
  end
  return false
end

-- -- EFFECTS

function krastorio.technologies.getEffects(technology_name)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology and next(technology) ~= nil then
    if technology.effects then
      return technology.effects
    end
  end
  return {}
end

-- This function return the table, not the name of the technology!
function krastorio.technologies.getTechnologyThatUnlockRecipe(recipe_name)
  for name, technology in pairs(data.raw.technology) do
    if (technology.enabled == true or technology.enabled == nil) and technology.effects then
      for _, effect in pairs(technology.effects) do
        if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
          return technology
        end
      end
    end
  end
  return nil
end

-- -- RESEARCH UNIT INGREDIENTS(research_unit_ingredients)

-- @ ingredient
function krastorio.technologies.getIngredientName(ingredient)
  return ingredient.name or ingredient[1]
end

-- @ ingredient
function krastorio.technologies.getIngredientCount(ingredient)
  return ingredient.amount or ingredient[2]
end

-- @ technology_name
function krastorio.technologies.getResearchUnitIngredients(technology_name)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology and next(technology) ~= nil then
    if technology.unit then
      if technology.unit.ingredients then
        return technology.unit.ingredients
      end
    end
  end
  return {}
end

-- wrapper of getResearchUnitIngredients(technology_name)
-- @ technology_name
function krastorio.technologies.getIngredients(technology_name)
  return krastorio.technologies.getResearchUnitIngredients(technology_name)
end

-- @ technology_name
-- @ science_pack_name
-- return a boolean
function krastorio.technologies.hasIngredient(technology_name, science_pack_name)
  local ingredients = krastorio.technologies.getResearchUnitIngredients(technology_name)
  if ingredients and next(ingredients) ~= nil then
    for i = 1, #ingredients do
      local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
      if ingredient_name == science_pack_name then
        return true
      end
    end
  end
  return false
end

-- -- RESEARCH UNITS

function krastorio.technologies.getResearchUnitCount(technology_name)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology and next(technology) ~= nil then
    if technology.unit then
      if technology.unit.count then
        return technology.unit.count
      end
    end
  end
  return 1
end

-- -- OTHERS

-- @ technology_name
-- return a boolean
function krastorio.technologies.exist(technology_name)
  return krastorio.technologies.getTechnologyFromName(technology_name) ~= nil
end

-- wrapper
-- @ recipe_name
-- return a table or nil
function krastorio.technologies.getTechnologyFromName(technology_name)
  if type(technology_name) == "table" then
    return technology_name
  end
  if type(technology_name) == "string" then
    return data.raw.technology[technology_name]
  end
end

-- -- -- SETTING(WRITE) FUNCTIONS

-- -- PREREQUISITES

function krastorio.technologies.removePrerequisite(technology_name, prerequisite_name_to_remove)
  local prerequisites = krastorio.technologies.getPrerequisites(technology_name)
  if next(prerequisites) ~= nil then
    for i, prerequisite_name in pairs(prerequisites) do
      if prerequisite_name == prerequisite_name_to_remove then
        table.remove(prerequisites, i)
        return true
      end
    end
  end
  return false
end

function krastorio.technologies.removePrerequisites(technology_name, prerequisite_names_to_remove)
  local removed_all = true
  local removed = false
  for _, prerequisite_name in pairs(prerequisite_names_to_remove) do
    removed = krastorio.technologies.removePrerequisite(technology_name, prerequisite_name)
    removed_all = removed_all and removed
  end
  return removed_all
end

function krastorio.technologies.convertPrerequisite(
  technology_name,
  old_prerequisite_name,
  new_prerequisite_name,
  check_circular_dependency
)
  local prerequisites = krastorio.technologies.getPrerequisites(technology_name)
  if prerequisites and #prerequisites > 0 and krastorio.technologies.exist(new_prerequisite_name) then
    for i, prerequisite_name in pairs(prerequisites) do
      if prerequisite_name == old_prerequisite_name then
        table.remove(prerequisites, i)
        krastorio.technologies.addPrerequisite(technology_name, new_prerequisite_name, check_circular_dependency or nil)
        return true
      end
    end
  end
  return false
end

function krastorio.technologies.convertPrerequisiteFromAllTechnologies(
  old_prerequisite_name,
  new_prerequisite_name,
  check_circular_dependency
)
  local count = 0
  for technology_name, _ in pairs(data.raw.technology) do
    if
      krastorio.technologies.convertPrerequisite(
        technology_name,
        old_prerequisite_name,
        new_prerequisite_name,
        check_circular_dependency or nil
      )
    then
      count = count + 1
    end
  end
  return count
end

function krastorio.technologies.addPrerequisite(technology_name, prerequisite_name, check_circular_dependency)
  if krastorio.technologies.exist(prerequisite_name) then
    local prerequisites = nil
    if type(technology_name) == "table" then
      prerequisites = technology_name[2]
      technology_name = technology_name[1]
    else
      prerequisites = krastorio.technologies.getPrerequisites(technology_name)
    end
    if prerequisites and next(prerequisites) ~= nil then
      if not krastorio.technologies.hasPrerequisite(technology_name, prerequisite_name) then
        local circular_dependency = false
        if check_circular_dependency and check_circular_dependency == true then
          circular_depenency = isaCircularDependency(technology_name, prerequisite_name)
        end
        if not circular_dependency then
          table.insert(prerequisites, prerequisite_name)
          return true
        else
          krastorio_utils.log.write(
            3,
            string.format(
              "Finded a circular dependency on %s if depends on %s, the prerequisite will be not added.",
              technology_name,
              prerequisite_name
            )
          )
        end
      end
    else
      local technology = krastorio.technologies.getTechnologyFromName(technology_name)
      if technology and next(technology) ~= nil then
        local circular_dependency = false
        if check_circular_dependency and check_circular_dependency == true then
          circular_depenency = isaCircularDependency(technology_name, prerequisite_name)
        end
        if not circular_dependency then
          technology.prerequisites = { prerequisite_name }
          return true
        else
          krastorio_utils.log.write(
            3,
            string.format(
              "Finded a circular dependency on %s if depends on %s, will be not added.",
              technology_name,
              prerequisite_name
            )
          )
        end
      end
    end
  else
    if type(technology_name) == "table" then
      technology_name = technology_name[1]
    end
    krastorio_utils.log.write(
      4,
      string.format(
        "Can't add prerequisite %s, on technology %s, because technology %s don't exist.",
        prerequisite_name,
        technology_name,
        prerequisite_name
      )
    )
  end
  return false
end

function krastorio.technologies.addPrerequisites(technology_name, prerequisite_names, check_circular_dependency)
  local added_all = true
  local added = false
  for _, prerequisite_name in pairs(prerequisite_names) do
    added = krastorio.technologies.addPrerequisite(technology_name, prerequisite_name, check_circular_dependency)
    added_all = added_all and added
  end
  return added_all
end

-- -- EFFECTS

-- must be the complete effect
function krastorio.technologies.removeEffect(technology_name, to_remove_effect)
  local effects = krastorio.technologies.getEffects(technology_name)
  if next(effects) ~= nil then
    for i, effect in pairs(effects) do
      if effect.type == to_remove_effect.type then
        if effect.type == "gun-speed" then
          if
            effect.ammo_category == to_remove_effect.ammo_category
            and effect.modifier == to_remove_effect.modifier
          then
            table.remove(effects, i)
            return true
          end
        elseif effect.type == "ammo-damage" then
          if
            effect.ammo_category == to_remove_effect.ammo_category
            and effect.modifier == to_remove_effect.modifier
          then
            table.remove(effects, i)
            return true
          end
        elseif effect.type == "give-item" then
          if effect.item == to_remove_effect.item and effect.count == to_remove_effect.count then
            table.remove(effects, i)
            return true
          end
        elseif effect.type == "turret-attack" then
          if effect.turret_id == to_remove_effect.turret_id and effect.modifier == to_remove_effect.modifier then
            table.remove(effects, i)
            return true
          end
        elseif effect.type == "unlock-recipe" then
          if effect.recipe == to_remove_effect.recipe then
            table.remove(effects, i)
            return true
          end
        elseif effect.type == "nothing" then
          if effect.effect_description == to_remove_effect.effect_description then
            table.remove(effects, i)
            return true
          end
        else
          if effect.modifier == to_remove_effect.modifier then
            table.remove(effects, i)
            return true
          end
        end
      end
    end
  end
  return false
end

-- must be the complete effect
function krastorio.technologies.removeEffects(technology_name, to_remove_effects)
  local removed_all = true
  local removed = false
  for _, to_remove_effect in pairs(to_remove_effects) do
    removed = krastorio.technologies.removeEffect(technology_name, to_remove_effect)
    removed_all = removed_all and removed
  end
  return removed_all
end

function krastorio.technologies.removeEffectFromAllTechnologies(to_remove_effect)
  local count = 0
  for name, technology in pairs(data.raw.technology) do
    if krastorio.technologies.removeEffect(name, to_remove_effect) then
      count = count + 1
    end
  end
  return count
end

function krastorio.technologies.removeAllEffectType(technology_name, to_remove_effect_type)
  local effects = krastorio.technologies.getEffects(technology_name)
  if next(effects) ~= nil then
    local effect_is_present = false
    repeat
      effect_is_present = false
      for i, effect in pairs(effects) do
        if effect.type == to_remove_effect_type then
          table.remove(effects, i)
          effect_is_present = true
          break
        end
      end
    until effect_is_present
  end
end

function krastorio.technologies.addEffect(technology_name, new_effect)
  local effects = krastorio.technologies.getEffects(technology_name)
  if next(effects) ~= nil then
    -- looking if new_effect if not present
    local found = false
    for _, effect in pairs(effects) do
      if effect.type == new_effect.type then
        if effect.type == "gun-speed" then
          if effect.ammo_category == new_effect.ammo_category and effect.modifier == new_effect.modifier then
            found = true
            break
          end
        elseif effect.type == "ammo-damage" then
          if effect.ammo_category == new_effect.ammo_category and effect.modifier == new_effect.modifier then
            found = true
            break
          end
        elseif effect.type == "give-item" then
          if effect.item == new_effect.item and effect.count == new_effect.count then
            found = true
            break
          end
        elseif effect.type == "turret-attack" then
          if effect.turret_id == new_effect.turret_id and effect.modifier == new_effect.modifier then
            found = true
            break
          end
        elseif effect.type == "unlock-recipe" then
          if effect.recipe == new_effect.recipe then
            found = true
            break
          end
        elseif effect.type == "nothing" then
          if effect.effect_description == new_effect.effect_description then
            found = true
            break
          end
        else
          if effect.modifier == new_effect.modifier then
            found = true
            break
          end
        end
      end
    end
    -- add it if not present
    if not found then
      if new_effect.type == "unlock-recipe" then
        if krastorio.recipes.exist(new_effect.recipe) then
          table.insert(effects, new_effect)
          return true
        else
          krastorio_utils.log.write(
            4,
            string.format(
              "Can't add to %s, the effect of unlock recipe %s, because recipe %s don't exist!",
              technology_name,
              new_effect.recipe,
              new_effect.recipe
            )
          )
        end
      else
        table.insert(effects, new_effect)
        return true
      end
    end
  else
    local technology = krastorio.technologies.getTechnologyFromName(technology_name)
    if technology and next(technology) ~= nil then
      technology.effects = { new_effect }
    end
  end
  return false
end

function krastorio.technologies.addEffects(technology_name, new_effects)
  local added_all = true
  local added = false
  for _, new_effect in pairs(new_effects) do
    added = krastorio.technologies.addEffect(technology_name, krastorio_utils.tables.fullCopy(new_effect))
    added_all = added_all and added
  end
  return added_all
end

function krastorio.technologies.update_ammo_effects(tech, effects)
  if not tech.effects then
    tech.effects = {}
  end

  for _, updated_effect in pairs(effects) do
    local exists = false
    for _, effect in pairs(tech.effects) do
      if
        effect.type == updated_effect.type
        and (effect.ammo_category == updated_effect.ammo_category or effect.turret_id == updated_effect.turret_id)
      then
        effect.modifier = updated_effect.modifier
        exists = true
        break
      end
    end
    if not exists then
      table.insert(
        tech.effects,
        { type = updated_effect.type, ammo_category = updated_effect.ammo_category, modifier = updated_effect.modifier }
      )
    end
  end
end

function krastorio.technologies.removeUnlockRecipe(technology_name, recipe_name)
  return krastorio.technologies.removeEffect(technology_name, { type = "unlock-recipe", recipe = recipe_name })
end

function krastorio.technologies.removeUnlockRecipes(technology_name, recipe_names)
  recipes_to_effects = {}
  for _, name in pairs(recipe_names) do
    table.insert({ type = "unlock-recipe", recipe = name })
  end

  return krastorio.technologies.removeEffects(technology_name, recipes_to_effects)
end

function krastorio.technologies.removeUnlockRecipeFromAllTechnologies(recipe_name)
  return krastorio.technologies.removeEffectFromAllTechnologies({ type = "unlock-recipe", recipe = recipe_name })
end

function krastorio.technologies.addUnlockRecipe(technology_name, recipe_name)
  return krastorio.technologies.addEffect(technology_name, { type = "unlock-recipe", recipe = recipe_name })
end

function krastorio.technologies.addUnlockRecipes(technology_name, recipe_names)
  recipes_to_effects = {}
  for _, name in pairs(recipe_names) do
    table.insert({ type = "unlock-recipe", recipe = name })
  end

  return krastorio.technologies.addEffects(technology_name, recipes_to_effects)
end

function krastorio.technologies.moveUnlockRecipe(from_technology_name, to_technology_name, recipe_name, add_anyway)
  local removed = krastorio.technologies.removeUnlockRecipe(from_technology_name, recipe_name)
  if removed or add_anyway then
    krastorio.technologies.addUnlockRecipe(to_technology_name, recipe_name)
  end
end

-- -- RESEARCH UNIT INGREDIENTS(research_unit_ingredients)

function krastorio.technologies.removeResearchUnitIngredient(technology_name, science_pack_name)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology then
    local prerequisites = technology.prerequisites
    local ingredients = false
    if technology.unit and technology.unit.ingredients then
      ingredients = technology.unit.ingredients
    end

    if ingredients and #ingredients > 0 then
      -- prerequisites
      if prerequisites and #prerequisites > 0 then
        for i, prerequisite_name in pairs(prerequisites) do
          if prerequisite_name == science_pack_name then
            table.remove(prerequisites, i)
            break
          end
        end
      end
      -- ingredients
      for i = 1, #ingredients do
        local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
        if ingredient_name == science_pack_name then
          table.remove(ingredients, i)
          return true
        end
      end
    end
  end
  return false
end

function krastorio.technologies.addResearchUnitIngredient(
  technology_name,
  science_pack_name,
  count,
  check_circular_dependency
)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)

  if technology and next(technology) ~= nil then
    correct_count = count or 1
    -- add prerequisite
    local science_pack_tech = krastorio.technologies.getTechnologyFromName(science_pack_name)
      or krastorio.technologies.getTechnologyThatUnlockRecipe(science_pack_name)
    if science_pack_tech then
      local hold = false
      if technology.prerequisites and #technology.prerequisites > 0 then
        for _, prerequisite in pairs(technology.prerequisites) do
          if
            prerequisite == science_pack_name
            or krastorio.technologies.hasIngredient(prerequisite, science_pack_name)
            or krastorio.technologies.hasPrerequisite(prerequisite, science_pack_name)
          then
            hold = true
            break
          end
        end
      end
      if not hold then
        krastorio.technologies.addPrerequisite(
          { technology_name, technology.prerequisites },
          science_pack_tech.name,
          check_circular_dependency or false
        )
      end
    end
    -- add ingredient
    if not technology.unit then
      technology.unit = {}
    end
    if not technology.unit.ingredients then
      technology.unit.ingredients = {}
    end
    for _, ingredient in pairs(technology.unit.ingredients) do
      local ingredient_name = krastorio.technologies.getIngredientName(ingredient)
      if ingredient_name == science_pack_name then
        for _, value in pairs(ingredient) do
          if type(value) == "number" then
            value = value + correct_count
          end
        end
        return true
      end
    end
    table.insert(technology.unit.ingredients, { science_pack_name, correct_count })
    return true
  end
  return false
end

function krastorio.technologies.overrideResearchUnitIngredient(technology_name, ingredients, check_circular_dependency)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)

  if technology and next(technology) ~= nil then
    -- add prerequisites
    local hold = nil
    local science_pack_name = nil
    local science_pack_tech = nil
    for _, ingredient in pairs(ingredients) do
      local science_pack_name = krastorio.technologies.getIngredientName(ingredient)
      local science_pack_tech = krastorio.technologies.getTechnologyFromName(science_pack_name)
        or krastorio.technologies.getTechnologyThatUnlockRecipe(science_pack_name)
      if science_pack_tech then
        hold = false
        if technology.prerequisites and #technology.prerequisites > 0 then
          for _, prerequisite in pairs(technology.prerequisites) do
            if
              prerequisite == science_pack_name
              or krastorio.technologies.hasIngredient(prerequisite, science_pack_name)
              or krastorio.technologies.hasPrerequisite(prerequisite, science_pack_name)
            then
              hold = true
              break
            end
          end
        end
        if not hold then
          krastorio.technologies.addPrerequisite(
            { technology_name, technology.prerequisites },
            science_pack_tech.name,
            check_circular_dependency or false
          )
        end
      end
    end
    -- add ingredient
    if not technology.unit then
      technology.unit = {}
    end
    technology.unit.ingredients = ingredients
    return true
  end
  return false
end

function krastorio.technologies.convertResearchUnitIngredient(
  technology_name,
  old_science_pack_name,
  new_science_pack_name
)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  local prerequisites = (technology and technology.prerequisites) or false
  local ingredients = false
  if technology and technology.unit and technology.unit.ingredients then
    ingredients = technology.unit.ingredients
  end
  local converted = false

  if technology and next(technology) ~= nil and ingredients and next(ingredients) ~= nil then
    -- convert ingredient
    local ingredient_name = nil
    for i = 1, #ingredients do
      ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
      if ingredient_name == old_science_pack_name then
        ingredients[i] = { new_science_pack_name, krastorio.technologies.getIngredientCount(ingredients[i]) }
        converted = true
        break
      end
    end
    -- remove old, add new prerequisite
    if converted and krastorio.technologies.getTechnologyFromName(new_science_pack_name) then
      if prerequisites and next(prerequisites) ~= nil then
        local index_old, index_new = -1, -1
        for i, prerequisite in pairs(prerequisites) do
          if prerequisite == old_science_pack_name then
            index_old = i
          elseif prerequisite == new_science_pack_name then
            index_new = i
          end
          if index_old ~= -1 and index_new ~= -1 then
            break
          end
        end

        if index_old == -1 and index_new == -1 then
          table.insert(prerequisites, new_science_pack_name)
        elseif index_old ~= -1 and index_new ~= -1 then
          table.remove(prerequisites, index_old)
        elseif index_old ~= -1 and index_new == -1 then
          prerequisites[index_old] = new_science_pack_name
        end
      else
        prerequisites = { new_science_pack_name }
      end
    end
  end

  return converted
end

function krastorio.technologies.setMaxLevelInfinite(technology_name)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology and next(technology) ~= nil then
    technology.max_level = "infinite"
    technology.upgrade = true
    if not technology.unit then
      technology.unit = {}
    end
    if not technology.unit.count_formula then
      technology.unit.count_formula = "2^(L-6)*1000"
    end
  end
end

-- -- RESEARCH UNIT

function krastorio.technologies.setResearchUnitCount(technology_name, count)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology and next(technology) ~= nil then
    if not technology.unit then
      technology.unit = {}
    end
    technology.unit.count = count
  end
end

-- -- -- OTHERS

-- -- SPECIAL

-- if a technology has one or more prerequistes
-- for each prerequisites check if that technology will create a cycle if require "tech"
-- and do recusively this check for his prerequistes, until reach technologies that haven't prerequisites
function isaCircularDependency(tech, to_add_prerequisite, already_checked)
  -- if has dependecy to be checked
  if data.raw.technology[to_add_prerequisite] then
    local to_add_prerequisites = data.raw.technology[to_add_prerequisite].prerequisites
    if to_add_prerequisites and next(to_add_prerequisites) ~= nil then
      if already_checked == nil then
        -- inizialize memoization table
        already_checked = {}
        for name, technology in pairs(data.raw.technology) do
          already_checked[name] = false
        end
      elseif already_checked[to_add_prerequisite] == true then -- skip already done recurrence
        return false
      end

      already_checked[to_add_prerequisite] = true
      for _, prerequisite in pairs(to_add_prerequisites) do
        -- check each prerequisite
        if data.raw.technology[prerequisite] then
          local prerequisites = data.raw.technology[prerequisite].prerequisites
          if prerequisites and next(data.raw.technology[prerequisite].prerequisites) ~= nil then
            for _, child_prerequisite in pairs(data.raw.technology[prerequisite].prerequisites) do
              if child_prerequisite == tech then
                return true
              end
            end
          end

          -- if not found check his prerequisite paths
          if isaCircularDependency(tech, prerequisite, already_checked) then
            return true
          end
        else
          krastorio_utils.log.write(
            3,
            string.format(
              "The technology %s, have a prerequisite called %s, that doesn't exist!",
              to_add_prerequisite,
              prerequisite
            )
          )
        end
      end
    end
  end
  return false
end

-- Given a table that rappresent a collection of new science packs
-- belonging one mod, will add it to this library for be computed in future.
-- @ science_pack
function krastorio.technologies.addSciencePackCollection(science_pack_collection_name, science_pack_collection)
  if type(science_pack_collection_name) == "string" and next(science_pack_collection) ~= nil then
    krastorio.technologies.science_pack_collections[science_pack_collection_name] = science_pack_collection
  end
end

-- Given a string which represents a name of a collection of science packs of one mod,
-- previously added by the method addSciencePack(science_pack)
-- will looking for technologies that have science pack from this collection and another mixed,
-- and will remove from them all science pack that isn't in.
-- If other technologies have; other science packs, mixed science packs collection not related with
-- the one in function argument, that technologies will be leave untouched.
-- @ science_pack_name, a table of strings
-- @ if given science_pack is compatible with vanilla science_pack
function krastorio.technologies.sanitizeUnitsOfAllTechnologiesInPacks(science_pack_collection_name, with_vanilla)
  if type(science_pack_collection_name) == "string" then
    local main_science_pack_collection = krastorio.technologies.science_pack_collections[science_pack_collection_name]
    if main_science_pack_collection then
      local vanilla_science_pack_collections = krastorio.technologies.science_pack_collections["Vanilla"]
      for technology_name, technology in pairs(data.raw.technology) do
        if technology.check_science_packs_incompatibilities ~= false then
          local is_in = false
          local ingredients = false
          if technology.unit and technology.unit.ingredients then
            ingredients = technology.unit.ingredients
          end

          if ingredients and next(ingredients) ~= nil then
            for i = 1, #ingredients do
              local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
              for _, science_pack_name in pairs(main_science_pack_collection) do
                if science_pack_name == ingredient_name then
                  is_in = true
                  break
                end
              end
            end
            if is_in then
              local is_sanitized = false
              local wrong_one = nil
              local is_wrong = nil
              while not is_sanitized do
                wrong_one = -1
                for i = 1, #ingredients do
                  is_wrong = true
                  local ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
                  for _, science_pack_name in pairs(main_science_pack_collection) do
                    if science_pack_name == ingredient_name then
                      is_wrong = false
                      break
                    end
                  end
                  if with_vanilla == true and is_wrong == true then
                    for _, science_pack_name in pairs(vanilla_science_pack_collections) do
                      if science_pack_name == ingredient_name then
                        is_wrong = false
                        break
                      end
                    end
                  end
                  if is_wrong then
                    wrong_one = i
                    break
                  end
                end

                if wrong_one == -1 then
                  is_sanitized = true
                else
                  for j, prerequisite_name in pairs(technology.prerequisites or {}) do
                    for _, value in pairs(ingredients[wrong_one]) do
                      if prerequisite_name == value then
                        table.remove(technology.prerequisites, j)
                        break
                      end
                    end
                  end
                  table.remove(ingredients, wrong_one)
                end
              end
            end
          end
        end
      end
    end
  end
end

-- Given one science pack, and another set will remove,
-- if one technology have that science will remove from that technology all science pack
-- in the set science_pack_incompatibilities.
-- @ science_pack_name
-- @ science_pack_incompatibilities - a set
function krastorio.technologies.removeSciencePackIncompatibleWith(science_pack_name, science_pack_incompatibilities)
  if type(science_pack_name) == "string" and science_pack_incompatibilities and #science_pack_incompatibilities > 0 then
    local incompatibilities_dictionary = {}
    for _, science_pack_incompatible in pairs(science_pack_incompatibilities) do
      incompatibilities_dictionary[science_pack_incompatible] = true
    end

    for technology_name, technology in pairs(data.raw.technology) do
      if technology.check_science_packs_incompatibilities ~= false then
        local ingredients = false
        if technology.unit and technology.unit.ingredients then
          ingredients = technology.unit.ingredients
        end

        if ingredients and #ingredients > 1 then
          local is_in = false
          local ingredient_name = nil
          for i = 1, #ingredients do
            ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
            if science_pack_name == ingredient_name then
              is_in = true
              break
            end
          end
          if is_in then
            local wrong_one = 0
            while wrong_one ~= -1 do
              wrong_one = -1

              for i = 1, #ingredients do
                ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
                if incompatibilities_dictionary[ingredient_name] then
                  wrong_one = i
                  break
                end
              end

              if wrong_one ~= -1 then
                if technology.prerequisites and #technology.prerequisites > 0 then
                  for j, prerequisite_name in pairs(technology.prerequisites) do
                    for _, value in pairs(ingredients[wrong_one]) do
                      if prerequisite_name == value then
                        table.remove(technology.prerequisites, j)
                        break
                      end
                    end
                  end
                end
                table.remove(ingredients, wrong_one)
              end
            end
          end
        end
      end
    end
  end
end

function krastorio.technologies.enforceUsedSciencePacksInPrerequisites()
  -- calculate existance of science pack technologies
  local science_techs = {}
  for _, science_pack in pairs(krastorio.items.getAllItemsOfType("tool")) do
    local science_pack_tech = krastorio.technologies.getTechnologyFromName(science_pack.name)
      or krastorio.technologies.getTechnologyThatUnlockRecipe(science_pack.name)
    if science_pack_tech then
      science_techs[science_pack.name] = science_pack_tech.name
    end
  end

  -- enforce science packs in prerequisites (or in their prerequisites) for each technology
  for technology_name, technology in pairs(data.raw.technology) do
    if technology.enforce_used_science_packs_in_prerequisites ~= false then
      local prerequisites = technology.prerequisites
      local ingredients = false
      if technology.unit and technology.unit.ingredients then
        ingredients = technology.unit.ingredients
      end
      local science_pack_name = nil
      local hold = false
      if ingredients and #ingredients > 0 then
        for i = 1, #ingredients do
          science_pack_name = krastorio.technologies.getIngredientName(ingredients[i])
          if science_techs[science_pack_name] then
            hold = false
            if prerequisites and #prerequisites > 0 then
              for _, prerequisite in pairs(prerequisites) do
                if
                  prerequisite == science_pack_name
                  or krastorio.technologies.hasIngredient(prerequisite, science_pack_name)
                  or krastorio.technologies.hasPrerequisite(prerequisite, science_pack_name)
                then
                  hold = true
                  break
                end
              end
            end
            if not hold then
              krastorio.technologies.addPrerequisite(technology_name, science_techs[science_pack_name], true)
            end
          end
        end
      end
    end
  end
end

-- -- ENABLE/DISABLE

-- @ technology_name
function krastorio.technologies.enable(technology_name)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology then
    technology.enabled = true
    technology.hidden = false
  end
end

--

-- @ technology_name
-- @ remove_prerequisites(boolean)
function krastorio.technologies.disable(technology_name, remove_prerequisites)
  local technology = krastorio.technologies.getTechnologyFromName(technology_name)
  if technology then
    technology.enabled = false
    technology.hidden = true
    if remove_prerequisites and remove_prerequisites == true then
      for name, technology in pairs(data.raw.technology) do
        krastorio.technologies.removePrerequisite(name, technology_name)
      end
      technology.prerequisites = nil
    end
  end
end

--
