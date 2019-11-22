-- -- -- TO DO

krastorio.items = {}

krastorio.items.item_types = {"ammo", "armor", "capsule", "fluid", "gun", "item", "mining-tool", "module", "tool", "item-with-entity-data"}

function krastorio.items.exist(item_name)
	return krastorio.items.getItem(item_name) ~= nil
end

function krastorio.items.getItem(item_name)	
	if type(item_name) == "string" then
		for _, type_name in pairs(krastorio.items.item_types) do
			for name, item in pairs(data.raw[type_name]) do
				if name == item_name then 
					return item
				end
			end
		end
	end
	return nil
end

function krastorio.items.getAllItemsOfType(item_type)
	local exist = false
	local items = {}
	for _, _type in pairs(krastorio.items.item_types) do
		if _type == item_type then
			exist = true
			break
		end
	end
	if exist then
		for name, item in pairs(data.raw[item_type]) do
			table.insert(items, item)
		end
	end
	return items
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