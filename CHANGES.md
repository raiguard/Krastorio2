# Prototype crashes

- Fix invalid prototype names.
- `circuit_connector_definitions.create` -> `create_single` & `create_vector`.
- Rolling stock light globals are no longer globals.
- `icon_size` is no longer required on items, inferred to be 64 if not present.
- Tile transitions system was entirely refactored.
- `energy-weapons-damage` -> `laser-weapons-damage`.
- Rocket launch products -> research rocket results.
- `logistic-chest-%s` -> `%s-chest`.
- `stack-inserter` -> `bulk-inserter`.
- Filter inserters removed.
- Mining drill `module_specification` removed and flattened.
- Vehicle `burner` -> `energy_source`.
- Rocket control units removed.
- `empty-barrel` -> `barrel`.
- `item-with-inventory` doesn't exist!? Causing crashes when iterating `defines.prototypes.item`. (TODO: Look into this)

# Prototype errors

- `filter_scroll_pane` -> `deep_slots_scroll_pane`.
- `hidden` flag on items is removed, replaced with `hidden` property on the prototype (along with all prototypes).
- Collision masks are entirely different (and less convenient to define).
- Remove normal/expensive modes.
- Disambiguation of `result` and `results`, standardized ingredient/result formats.
- `K` is not a valid SI prefix - use `k` instead.
- Add `base_flow_rate` to all fluids. (TODO: Make it default to 100)
- Tile transitions definitions layout change (variants.transition).
  - `picture` -> `spritesheet`.
- Emissions values are now a dictionary keyed by pollutant.
- Overhauled pipe connection definitions
  - Positions needs to be inside the entity
  - Direction
  - Connection type
- Pump has two fluid boxes now.
- Attack parameters gained ammo category, moved out of ammo type subtable.
- Mandatory graphics set on turrets.
  - Change `base_picture` to `graphics_set` and wrap contents in `base_visualisations.animation` subtables.
- `util.empty_sprite(frams)` -> `util.empty_animation(frames)`. Continue using `empty_sprite` when not an animation.
- SLOPED SPRITES FOR ROLLING STOCK.
- Selection tool selection mode un-flattening.
- Trigger techs don't have `unit`.
- `finish-the-game-achievement` -> `complete-objective-achievement` with `objective_condition` field.
- Achievement `until_second` -> `within`.
- `noise-layer` prototype removed. Haven't figured out the replacement yet.
- `advanced-electronics-2` -> `processing-unit`.
- `advanced-electronics` -> `advanced-circuit`.
- `optics` -> `lamp`.
- `rocket-shadow.png` no longer exists - use utility functions instead.
- `effectivity-module` -> `efficiency-module`
