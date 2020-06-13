-- -- -- Vanilla entity next upgrade to Krastorio superior entity

-- Inserters
-- data.raw.inserter["stack-inserter"].next_upgrade = "kr-superior-inserter"

-- data.raw.inserter["long-handed-inserter"].next_upgrade = "kr-superior-long-inserter"
-- data.raw.inserter["long-handed-inserter"].fast_replaceable_group = "inserter"

-- data.raw.inserter["stack-filter-inserter"].next_upgrade = "kr-superior-filter-inserter"

-- Belts
data.raw["transport-belt"]["express-transport-belt"].next_upgrade = "kr-advanced-transport-belt"
data.raw["splitter"]["express-splitter"].next_upgrade = "kr-advanced-splitter"
data.raw["underground-belt"]["express-underground-belt"].next_upgrade = "kr-advanced-underground-belt"

-- Pump
data.raw.pump["pump"].fast_replaceable_group = "pump"
data.raw.pump["pump"].next_upgrade = "kr-steel-pump"

-- Pipes
data.raw.pipe["pipe"].fast_replaceable_group = "pipe"
data.raw.pipe["pipe"].next_upgrade = "kr-steel-pipe"

-- Underground pipes
data.raw["pipe-to-ground"]["pipe-to-ground"].fast_replaceable_group = "pipe"
data.raw["pipe-to-ground"]["pipe-to-ground"].next_upgrade = "kr-steel-pipe-to-ground"

-- Speedy inserters
data.raw["inserter"]["fast-inserter"].next_upgrade = "stack-inserter"
data.raw["inserter"]["stack-inserter"].next_upgrade = "kr-superior-inserter"

-- Filter inserters
data.raw["inserter"]["filter-inserter"].next_upgrade = "stack-filter-inserter"
data.raw["inserter"]["stack-filter-inserter"].next_upgrade = "kr-superior-filter-inserter"

-- Long handed inserter
data.raw["inserter"]["long-handed-inserter"].fast_replaceable_group = "long-handed-inserter"
data.raw["inserter"]["long-handed-inserter"].next_upgrade = "kr-superior-long-inserter"

-- Electric mining drill (MK!)
data.raw["mining-drill"]["electric-mining-drill"].fast_replaceable_group = "electric-mining-drill"
data.raw["mining-drill"]["electric-mining-drill"].next_upgrade = "kr-electric-mining-drill-mk2"
