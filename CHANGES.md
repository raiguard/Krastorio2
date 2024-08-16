Fix invalid prototype names.
`circuit_connector_definitions.create` -> `create_single` & `create_vector`.
Rolling stock light globals are no longer globals.
Collision masks are entirely different (and less convenient to define).
`icon_size` is no longer required on items, inferred to be 64 if not present.
Tile transitions system was entirely refactored.
`energy-weapons-damage` -> `laser-weapons-damage`.
Rocket launch products -> research rocket results.
`logistic-chest-%s` -> `%s-chest`.
`stack-inserter` -> `bulk-inserter`.
Filter inserters removed.
Mining drill `module_specification` removed and flattened.
Vehicle `burner` -> `energy_source`.
Rocket control units removed.
`empty-barrel` -> `barrel`.
`item-with-inventory` doesn't exist!? Causing crashes when iterating `defines.prototypes.item`. (TODO: Look into this)
