-- -- -- Sorting changes to vanilla items

-- Logistic chests
local logistc_subgroup_1 = "kr-logistics-1"
data.raw.item["logistic-chest-active-provider"].subgroup = logistc_subgroup_1
data.raw.item["logistic-chest-active-provider"].order = "a[chest-active-provider]"
data.raw.item["logistic-chest-buffer"].subgroup = logistc_subgroup_1
data.raw.item["logistic-chest-buffer"].order = "b[chest-buffer]"
data.raw.item["logistic-chest-passive-provider"].subgroup = logistc_subgroup_1
data.raw.item["logistic-chest-passive-provider"].order = "c[chest-passive-provider]"
data.raw.item["logistic-chest-requester"].subgroup = logistc_subgroup_1
data.raw.item["logistic-chest-requester"].order = "d[chest-requester]"
data.raw.item["logistic-chest-storage"].subgroup = logistc_subgroup_1
data.raw.item["logistic-chest-storage"].order = "e[chest-storage]"

-- Radar and rocket silo
data.raw.item["radar"].subgroup = "radars-and-rockets"
data.raw.item["radar"].order = "02[radar]"
data.raw.item["rocket-silo"].subgroup = "radars-and-rockets"
data.raw.item["rocket-silo"].order = "zzz[rocket-silo]"

-- Vanilla turrets
data.raw.item["gun-turret"].subgroup = "vanilla-turrets"
data.raw.item["gun-turret"].order = "01[gun-turret]"
data.raw.item["flamethrower-turret"].subgroup = "vanilla-turrets"
data.raw.item["flamethrower-turret"].order = "02[flamethrower-turret]"
data.raw.item["laser-turret"].subgroup = "vanilla-turrets"
data.raw.item["laser-turret"].order = "03a[laser-turret]"
data.raw.item["artillery-turret"].subgroup = "vanilla-turrets"
data.raw.item["artillery-turret"].order = "04[artillery-turret]"

-- Equipmnet
data.raw.item["personal-laser-defense-equipment"].order = "d[active-defense]-b1[personal-laser-defense-mk1-equipment]"

-- Gate and wall
data.raw.item["stone-wall"].subgroup = "vanilla-turrets"
data.raw.item["stone-wall"].order = "001[stone-wall]"
data.raw.item["gate"].subgroup = "vanilla-turrets"
data.raw.item["gate"].order = "002[gate]"

-- Assembling machine
data.raw.item["assembling-machine-3"].order = "c1[assembling-machine-3]"
