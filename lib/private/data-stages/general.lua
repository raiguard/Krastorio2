require(kr_path .. "lib/private/data-stages/utils/split")

krastorio.general = {}

-- VERSION FUNCTIONS
--------------------

function krastorio.general.isVersionGreaterThan(_mod_version, _version)
	local mod_version = split(_mod_version, ".")	
	local version     = split(_version, ".")	
	for i = 1, #mod_version do
		if mod_version[i] ~= version[i] and mod_version[i] > version[i] then
			return true
		else
			return false
		end
	end	
	return false
end

function krastorio.general.isVersionGreaterEqualThan(_mod_version, _version)
	if _mod_version == _version then
		return true
	end
	return krastorio.general.isVersionGreaterThan(_mod_version, _version)
end

function krastorio.general.isVersionLesserThan(_mod_version, _version)
	local mod_version = split(_mod_version, '.')	
	local version     = split(_version, '.')	
	for i = 1, #mod_version do
		if mod_version[i] ~= version[i] and mod_version[i] < version[i] then
			return true
		else
			return false
		end
	end	
	return false
end

function krastorio.general.isVersionLesserEqualThan(_mod_version, _version)
	if _mod_version == _version then
		return true
	end
	return krastorio.general.isVersionLesserThan(_mod_version, _version)
end

--------------------

-- Will remove one prototypes from each category types:
--	data.raw --> each entities
--	data.raw.item	
--	data.raw.recipe
--	data.raw.technology
-- @name, name of prototype
function krastorio.general.removePrototypeEntryFromTheGame(name)
	for _, prototypes in pairs(data.raw) do
		if prototypes[name] then
			prototypes[name] = nil
		end
	end
end

-- Disable an item completely
-- @name, name of prototype
function krastorio.general.disablePrototypeEntryFromTheGame(name)	
	krastorio.recipes.disable(name)
	krastorio.technologies.disable(name, true)
end

-- Block the game loading to show an error to the user
-- @title
-- @message
-- @log_message, optional, only if want write more info in log file
function krastorio.general.printWarningMessage(title, message, log_message)
	if log_message then
		krastorio_utils.log.write(5, log_message)
	end
	local composed_message =                     "\n\n[font=default-large-bold][color=255, 0, 0]" .. string.upper(title) .. "[/color][/font]\n"
	composed_message       = composed_message .. "[font=default-bold][color=230, 46, 0]" .. message .. "[/color][/font]\n\n"
	error(composed_message)
end
