-- compatibility for the mod nco-SpaceShuttle
-- The Space-Shuttle vehicle is near complete clone of the aircraft/cargo-plane just with a different sprite sheet and some magic to allow it in space, therfore this is a similiar extension as present for aircraft/cargo-plane.

if mods["nco-SpaceShuttle"] then
  -- Utils
  local function changePlaneGrid(plane_name, new_grid_name)
    if data.raw["car"][plane_name] then
      data.raw["car"][plane_name].equipment_grid = new_grid_name
    end
  end
  data:extend({
    -----------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------
    -- se-space-shuttle
    {
      type = "equipment-grid",
      name = "kr-space-shuttle-grid",
      width = 6,
      height = 6,
      equipment_categories = {
        "universal-equipment",
        "vehicle-equipment",
        "vehicle-robot-interaction-equipment",
        "vehicle-motor",
        "aircraft-equipment",
      },
    },
  })
  -- Modifing grids
  changePlaneGrid("se-space-shuttle", "kr-space-shuttle-grid")

  -- Inter/Cross compatibility with Aircraft Realism compatibility
  if mods["AircraftRealism"] then
    -- Modifing airborne grids
    changePlaneGrid("se-space-shuttle-airborne", "kr-space-shuttle-grid")
  end
end
