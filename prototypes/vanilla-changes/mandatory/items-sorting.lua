-- -- -- Sorting changes to vanilla items

-- Logistic chests
local logistc_subgroup_1 = "kr-logistics-1"
data.raw.item["logistic-chest-active-provider"].subgroup  = logistc_subgroup_1
data.raw.item["logistic-chest-active-provider"].order     = "a[chest-active-provider]"
data.raw.item["logistic-chest-buffer"].subgroup           = logistc_subgroup_1
data.raw.item["logistic-chest-buffer"].order              = "b[chest-buffer]"
data.raw.item["logistic-chest-passive-provider"].subgroup = logistc_subgroup_1
data.raw.item["logistic-chest-passive-provider"].order    = "c[chest-passive-provider]"
data.raw.item["logistic-chest-requester"].subgroup        = logistc_subgroup_1
data.raw.item["logistic-chest-requester"].order           = "d[chest-requester]"
data.raw.item["logistic-chest-storage"].subgroup          = logistc_subgroup_1
data.raw.item["logistic-chest-storage"].order             = "e[chest-storage]"
