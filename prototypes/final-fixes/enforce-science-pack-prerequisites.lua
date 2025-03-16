local data_util = require("data-util")
local flib_table = require("__flib__.table")

for _, technology in pairs(data.raw.technology) do
  local unit = technology.unit
  if not unit then
    goto continue
  end

  local ingredients = unit.ingredients
  if not ingredients then
    goto continue
  end

  local highest_pack = ingredients[#ingredients]
  if not highest_pack then
    goto continue
  end

  local highest_pack_name = highest_pack[1]
  if not highest_pack_name then
    goto continue
  end

  -- This assumes that there will either be an exact matching technology or that the science pack has a recipe with its same name.
  local science_pack_tech = data.raw.technology[highest_pack_name]
    or data_util.get_technology_for_recipe(highest_pack_name)
  if not science_pack_tech or science_pack_tech.name == technology.name then
    goto continue
  end

  if not technology.prerequisites then
    technology.prerequisites = {}
  end
  if not flib_table.find(technology.prerequisites, science_pack_tech.name) then
    table.insert(technology.prerequisites, science_pack_tech.name)
  end

  ::continue::
end
