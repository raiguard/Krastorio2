-- -- -- TODO: Nuke all of this

krastorio.items = {}

function krastorio.items.exist(item_name)
  return krastorio.items.getItem(item_name) ~= nil
end

function krastorio.items.getItem(item_name)
  if type(item_name) == "string" then
    for type_name in pairs(defines.prototypes.item) do
      local item = data.raw[type_name] and data.raw[type_name][item_name]
      if item then
        return item
      end
    end
  end
  return nil
end

function krastorio.items.getItemType(item_name)
  local item = krastorio.items.getItem(item_name)
  if item and item.type then
    return item.type
  end
  return ""
end

function krastorio.items.isaType(item_name, type_name)
  if data.raw[type_name] and data.raw[type_name][item_name] then
    return true
  end
  return false
end

function krastorio.items.getItemName(item)
  return item.name or item[1]
end
