local planetary_teleporter = util.table.deepcopy(data.raw["accumulator"]["accumulator"])
planetary_teleporter.name = "kr-planetary-teleporter"
planetary_teleporter.localised_name = {"entity-name.kr-planetary-teleporter"}
planetary_teleporter.localised_description = {"entity-description.kr-planetary-teleporter"}
data:extend({planetary_teleporter})