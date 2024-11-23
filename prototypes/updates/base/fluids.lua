local data_util = require("data-util")

data.raw.fluid["petroleum-gas"].emissions_multiplier = 1.25
data.raw.fluid["petroleum-gas"].fuel_value = "900kJ"

data.raw.fluid["steam"].heat_capacity = "0.5kJ"

data.raw.fluid["sulfuric-acid"].heat_capacity = "0.25kJ"

data.raw.fluid["water"].heat_capacity = "0.5kJ"

-- TODO: Do we want these custom oil icons?
-- data_util.set_icon(data.raw.fluid["heavy-oil"], "__Krastorio2Assets__/icons/fluids/heavy-oil.png")
-- data_util.set_icon(data.raw.fluid["light-oil"], "__Krastorio2Assets__/icons/fluids/light-oil.png")
