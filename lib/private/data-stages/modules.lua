krastorio.modules = {}

-- types of effects:
-- .consumption
-- .pollution
-- .productivity
-- .speed
-- ..bonus

-- @ module
function krastorio.modules.isLimited(module)
	if type(module) == "string" then
		module = data.raw.module[module] or false
	end
	
	if module and module.limitation and #module.limitation > 0 then
		return true
	end
	
	return false	
end

-- @ limitations
-- @ recipe_name
function krastorio.modules.hasLimitationRecipe(limitations, recipe_name)
	local has_it = false
	if limitations and #limitations > 0 then
		for i, name in pairs(limitations) do
			if name == recipe_name then
				has_it = true
				break
			end
		end
	end
	return has_it
end

-- @ module
function krastorio.modules.hasPositiveProductivity(module)
	local has_it = false	
	if module.effect then
		for effect_name, effect in pairs(module.effect) do
			if effect_name == "productivity" and effect.bonus > 0 then
				has_it = true
				break
			end
		end
	end
	return has_it
end

-- @ module
function krastorio.modules.hasPositiveSpeed(module)
	local has_it = false	
	if module.effect then
		for effect_name, effect in pairs(module.effect) do
			if effect_name == "speed" and effect.bonus > 0 then
				has_it = true
				break
			end
		end
	end
	return has_it
end

-- @ module
function krastorio.modules.hasPositiveEfficiency(module)
	local has_it = false	
	if module.effect then
		for effect_name, effect in pairs(module.effect) do
			if effect_name == "consumption" and effect.bonus < 0 then
				has_it = true
				break
			end
		end
	end
	return has_it
end

-- @ module
function krastorio.modules.hasPositiveLessPollution(module)
	local has_it = false	
	if module.effect then
		for effect_name, effect in pairs(module.effect) do
			if effect_name == "pollution" and effect.bonus < 0 then
				has_it = true
				break
			end
		end
	end
	return has_it
end

-- @ recipe_name
function krastorio.modules.addProductivityLimitation(recipe_name, only_if_limited)
	only_if_limited = only_if_limited or false
	local has_positive_productivity, is_limited = false, false
	for i, module in pairs(data.raw.module) do
		has_positive_productivity = krastorio.modules.hasPositiveProductivity(module)
		is_limited = krastorio.modules.isLimited(module)
		if has_positive_productivity and (is_limited or not only_if_limited) then
			
			local has_it = false
			if module.limitation then
				has_it = krastorio.modules.hasLimitationRecipe(module.limitation, recipe_name)
			else
				module.limitation = {}
			end
			
			if not has_it then
				table.insert(module.limitation, recipe_name)
				
				if not module.limitation_message_key then
					module.limitation_message_key = "production-module-limitation"
				end
			end
			
		end
	end
end

-- @ recipe_name
function krastorio.modules.removeProductivityLimitation(recipe_name)
	local found = false
	for i, module in pairs(data.raw.module) do
		if krastorio.modules.hasPositiveProductivity(module) then
			if module.limitation and next(module.limitation) ~= nil then
			
				for j, name in pairs(module.limitation) do
					if name == recipe_name then
						table.remove(module.limitation, j)
						found = true
					end
				end
				
				if next(module.limitation) == nil then
					module.limitation = nil
					module.limitation_message_key = nil
				end
				
			end		
		end
	end	
	return found
end

-- @ recipe_name
function krastorio.modules.addSpeedLimitation(recipe_name, only_if_limited)
	only_if_limited = only_if_limited or false
	local has_positive_productivity, is_limited = false, false
	for i, module in pairs(data.raw.module) do
		has_positive_speed = krastorio.modules.hasPositiveSpeed(module)
		is_limited = krastorio.modules.isLimited(module)
		if has_positive_speed and (is_limited or not only_if_limited) then
			
			local has_it = false
			if module.limitation then
				has_it = krastorio.modules.hasLimitationRecipe(module.limitation, recipe_name)
			else
				module.limitation = {}
			end
			
			if not has_it then
				table.insert(module.limitation, recipe_name)
				
				if not module.limitation_message_key then
					module.limitation_message_key = "speed-module-limitation"
				end
			end			

		end
	end
end

-- @ recipe_name
function krastorio.modules.removeSpeedLimitation(recipe_name)
	local found = false
	for i, module in pairs(data.raw.module) do
		if krastorio.modules.hasPositiveSpeed(module) then
			if module.limitation and next(module.limitation) ~= nil then
			
				for j, name in pairs(module.limitation) do
					if name == recipe_name then
						table.remove(module.limitation, j)
						found = true
					end
				end
				
				if next(module.limitation) == nil then
					module.limitation = nil
					module.limitation_message_key = nil
				end
				
			end		
		end
	end
	return found
end

-- @ recipe_name
function krastorio.modules.addEfficiencyLimitation(recipe_name, only_if_limited)
	only_if_limited = only_if_limited or false
	local has_positive_productivity, is_limited = false, false
	for i, module in pairs(data.raw.module) do	
		has_positive_efficiency = krastorio.modules.hasPositiveEfficiency(module)
		is_limited = krastorio.modules.isLimited(module)	
		if has_positive_efficiency and (is_limited or not only_if_limited) then
			
			local has_it = false
			if module.limitation then
				has_it = krastorio.modules.hasLimitationRecipe(module.limitation, recipe_name)
			else
				module.limitation = {}
			end
			
			if not has_it then
				table.insert(module.limitation, recipe_name)
				
				if not module.limitation_message_key then
					module.limitation_message_key = "efficiency-module-limitation"
				end
			end
			
		end
	end
end

-- @ recipe_name
function krastorio.modules.removeEfficiencyLimitation(recipe_name)
	local found = false
	for i, module in pairs(data.raw.module) do
		if krastorio.modules.hasPositiveEfficiency(module) then
			if module.limitation and next(module.limitation) ~= nil then
			
				for j, name in pairs(module.limitation) do
					if name == recipe_name then
						table.remove(module.limitation, j)
						found = true
					end
				end
				
				if next(module.limitation) == nil then
					module.limitation = nil
					module.limitation_message_key = nil
				end
				
			end		
		end
	end
	return found
end

-- @ recipe_name
function krastorio.modules.addLessPollutionLimitation(recipe_name, only_if_limited)
	only_if_limited = only_if_limited or false
	local has_positive_productivity, is_limited = false, false
	for i, module in pairs(data.raw.module) do
		has_positive_less_pollution = krastorio.modules.hasPositiveLessPollution(module)
		is_limited = krastorio.modules.isLimited(module)	
		if has_positive_less_pollution and (is_limited or not only_if_limited) then
		
			local has_it = false
			if module.limitation then
				has_it = krastorio.modules.hasLimitationRecipe(module.limitation, recipe_name)
			else
				module.limitation = {}
			end
			
			if not has_it then
				table.insert(module.limitation, recipe_name)
				
				if not module.limitation_message_key then
					module.limitation_message_key = "pollution-only-module-limitation"
				end
			end
			
		end
	end
end

-- @ recipe_name
function krastorio.modules.removeLessPollutionLimitation(recipe_name)
	local found = false
	for i, module in pairs(data.raw.module) do
		if krastorio.modules.hasPositiveLessPollution(module) then
			if module.limitation and next(module.limitation) ~= nil then
			
				for j, name in pairs(module.limitation) do
					if name == recipe_name then
						table.remove(module.limitation, j)
						found = true
					end
				end
				
				if next(module.limitation) == nil then
					module.limitation = nil
					module.limitation_message_key = nil
				end
				
			end		
		end
	end
	return found
end
