-- -- Improve power poles chaining
	
-- Small electric pole range rebalance
if data.raw["electric-pole"]["small-electric-pole"] then
	data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = 8.5
	data.raw["electric-pole"]["small-electric-pole"].supply_area_distance = 3.5
end

-- Medium electric pole range rebalance
if data.raw["electric-pole"]["medium-electric-pole"] then
	data.raw["electric-pole"]["medium-electric-pole"].maximum_wire_distance = 13.5
	data.raw["electric-pole"]["medium-electric-pole"].supply_area_distance = 6.5
end

-- Big electric pole range rebalance
if data.raw["electric-pole"]["big-electric-pole"] then
	data.raw["electric-pole"]["big-electric-pole"].maximum_wire_distance = 32
	data.raw["electric-pole"]["big-electric-pole"].supply_area_distance = 3
end

-- Substation range rebalance
if data.raw["electric-pole"]["substation"] then
	data.raw["electric-pole"]["substation"].maximum_wire_distance = 24.5
	data.raw["electric-pole"]["substation"].supply_area_distance = 12
end
