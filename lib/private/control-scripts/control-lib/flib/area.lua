--- Functions for maniuplating areas.
-- **NOTE:** All functions assume that `BoundingBox` and `Position` objects contain named keys - `x` and `y` for
-- `Position`, and `left_top` and `right_bottom` for `BoundingBox`. Attempting to use these functions with the
-- shorthand forms of these objects will result in a crash.
-- @module area
-- @alias flib_area
-- @usage local area = require("__flib__.area")
local flib_area = {}

--- Expand an area to its outer tile edges.
-- @tparam Concepts.BoundingBox self The area to modify.
function flib_area.ceil(self)
  self.left_top = {
    x = math.floor(self.left_top.x),
    y = math.floor(self.left_top.y)
  }
  self.right_bottom = {
    x = math.ceil(self.right_bottom.x),
    y = math.ceil(self.right_bottom.y)
  }

  return self
end

--- Calculate the centerpoint of the area.
-- @tparam Concepts.BoundingBox self The area to check.
-- @treturn Concepts.Position The centerpoint of the area.
function flib_area.center(self)
  return {
    x = self.left_top.x + (flib_area.width(self) / 2),
    y = self.left_top.y + (flib_area.height(self) / 2)
  }
end

--- Re-center the area on the given position.
-- @tparam Concepts.BoundingBox self The area to modify.
-- @tparam Concepts.Position center_point The position to center the area on.
-- @treturn Concepts.BoundingBox The re-centered area.
function flib_area.center_on(self, center_point)
  local height = flib_area.height(self)
  local width = flib_area.width(self)

  self.left_top = {
    x = center_point.x - (width / 2),
    y = center_point.y - (height / 2)
  }
  self.right_bottom = {
    x = center_point.x + (width / 2),
    y = center_point.y + (height / 2)
  }

  return self
end

--- Check if the given area is within the area.
-- @tparam Concepts.BoundingBox self The area to check against.
-- @tparam Concepts.BoundingBox area The area to check if it is contained.
-- @treturn boolean Whether or not `area` is contained withing `self`.
function flib_area.contains_area(self, area)
  return (
    self.left_top.x <= area.left_top.x
    and self.left_top.y <= area.left_top.y
    and self.right_bottom.x >= area.right_bottom.x
    and self.right_bottom.y >= area.right_bottom.y
  )
end

--- Check if the given position is within the area.
-- @tparam Concepts.BoundingBox self The area to check against.
-- @tparam Concepts.Position position The position to check.
-- @treturn boolean Whether or not the position is contained within the area.
function flib_area.contains_position(self, position)
  return (
    self.left_top.x <= position.x
    and self.right_bottom.x >= position.x
    and self.left_top.y <= position.y
    and self.right_bottom.y >= position.y
  )
end

--- Add left-bottom and right-top corners to the area.
-- @tparam Concepts.BoundingBox self The area to modify.
-- @treturn Concepts.BoundingBox The area with added `left_bottom` and `right_top` subtables.
function flib_area.corners(self)
  self.left_bottom = {
    x = self.left_top.x,
    y = self.right_bottom.y
  }
  self.right_top = {
    x = self.right_bottom.x,
    y = self.left_top.y
  }

  return self
end

--- Find the distance between a point and the nearest edge of the given area.
-- @tparam Concepts.BoundingBox self The area to check against.
-- @treturn double The distance to the nearest edge of the area.
function flib_area.distance_to_nearest_edge(self, position)
  local x_distance = math.min(math.abs(self.left_top.x - position.x), math.abs(self.right_bottom.x - position.x))
  local y_distance = math.min(math.abs(self.left_top.y - position.y), math.abs(self.right_bottom.y - position.y))

  return math.min(x_distance, y_distance)
end

--- Expand the given area by the given amount.
-- @tparam Concepts.BoundingBox self The area to expand.
-- @tparam number delta How far to expand the edges of the area.
-- @treturn Concepts.BoundingBox The expanded area.
function flib_area.expand(self, delta)
  self.left_top.x = self.left_top.x - delta
  self.right_bottom.x = self.right_bottom.x + delta
  self.left_top.y = self.left_top.y - delta
  self.right_bottom.y = self.right_bottom.y + delta

  return self
end

--- Expand the given area to contain the other area.
-- @tparam Concepts.BoundingBox self The area to expand.
-- @tparam Concepts.BoundingBox area The area to be contained.
-- @treturn Concepts.BoundingBox The modified area, containing the second area.
function flib_area.expand_to_contain_area(self, area)
  self.left_top = {
    x = self.left_top.x < area.left_top.x and self.left_top.x or area.left_top.x,
    y = self.left_top.y < area.left_top.y and self.left_top.y or area.left_top.y
  }
  self.right_bottom = {
    x = self.right_bottom.x > area.right_bottom.x and self.right_bottom.x or area.right_bottom.x,
    y = self.right_bottom.y > area.right_bottom.y and self.right_bottom.y or area.right_bottom.y
  }

  return self
end

--- Expand the given area to contain the given position.
-- @tparam Concepts.BoundingBox self The area to expand.
-- @tparam Concepts.Position position The position to be contained.
-- @treturn Concepts.BoundingBox The modified area, containing the given position.
function flib_area.expand_to_contain_position(self, position)
  self.left_top = {
    x = self.left_top.x < position.x and self.left_top.x or position.x,
    y = self.left_top.y < position.y and self.left_top.y or position.y,
  }
  self.right_bottom = {
    x = self.right_bottom.x > position.x and self.right_bottom.x or position.x,
    y = self.right_bottom.y > position.y and self.right_bottom.y or position.y,
  }

  return self
end

--- Shrink an area to its inner tile edges.
-- @tparam Concepts.BoundingBox self The area to floor.
-- @treturn Concepts.BoundingBox The floored area.
function flib_area.floor(self)
  self.left_top = {
    x = math.ceil(self.left_top.x),
    y = math.ceil(self.left_top.y)
  }
  self.right_bottom = {
    x = math.floor(self.right_bottom.x),
    y = math.floor(self.right_bottom.y)
  }

  return self
end

--- Create a 1x1 tile area from the given position.
-- @tparam Concepts.Position position
function flib_area.from_position(position)
  return {
    left_top = {x = position.x, y = position.y},
    right_bottom = {x = position.x, y = position.y}
  }
end

--- Calculate the height of the area.
-- @tparam Concepts.BoundingBox self The area to measure.
-- @treturn number The height of the area.
function flib_area.height(self)
  return math.abs(self.right_bottom.y - self.left_top.y)
end

--- Create an iterator of positions in the area from the left-top to the right-bottom.
-- The iterator function, when called, will return a `Position` that is within the area.
-- @tparam Concepts.BoundingBox self The area to iterate.
-- @tparam[opt=1] number step The distance to move on each iteration.
-- @treturn function The iterator function.
-- @usage
-- -- standard area
-- for position in area.iterate(my_area) do
--   log(serpent.line(position))
-- end
-- -- area object
-- for position in MyArea:iterate() do
--   log(serpent.line(position))
-- end
function flib_area.iterate(self, step)
  step = step or 1

  local x = self.left_top.x
  local y = self.left_top.y
  local max_x = self.right_bottom.x
  local max_y = self.right_bottom.y
  local first = true

  local function iterator()
    if first then
      first = false
      return {x = x, y = y}
    end

    local new_x = x + step
    if x < max_x and new_x < max_x then
      x = new_x
    else
      local new_y = y + step
      if y < max_y and new_y < max_y then
        x = self.left_top.x
        y = new_y
      else
        return nil
      end
    end

    return {x = x, y = y}
  end

  return iterator
end

--- Create an area object from a plain area.
-- Doing this allows one to use area methods directly on an area "object" via the `:` operator. The area will be passed
-- in as `self` to each function automatically.
--
-- Metatables do not persist across save/load, so when using area objects, this function must be called on them whenever
-- they are retrieved from `global` or during `on_load`.
-- @tparam Concepts.BoundingBox area The plain area to convert.
-- @treturn Concepts.BoundingBox The converted area.
-- @usage
-- -- create the area object
-- local MyArea = area.load(event_data.area)
-- -- use module methods directly on the object
-- local center_position = MyArea:center()
-- for position in MyArea:iterate(0.5) do
--   log(serpent.line(position))
-- end
function flib_area.load(area)
  return setmetatable(area, {__index = flib_area})
end

--- Move the given area by the given delta.
-- @tparam Concepts.BoundingBox self The area to move.
-- @tparam Concepts.Position delta How far to move the area in each dimension.
-- @treturn Concepts.BoundingBox The moved area.
function flib_area.move(self, delta)
  self.left_top.x = self.left_top.x + delta.x
  self.left_top.y = self.left_top.y + delta.y
  self.right_bottom.x = self.right_bottom.x + delta.x
  self.right_bottom.y = self.right_bottom.y + delta.y

  return self
end

--- Rotate an area 90 degrees around its center.
-- @tparam Concepts.BoundingBox self The area to rotate.
-- @treturn Concepts.BoundingBox The rotated area.
function flib_area.rotate(self)
  -- save current properties
  local center = flib_area.center(self)
  local height = flib_area.height(self)
  local width = flib_area.width(self)

  local radius_x = height / 2
  local radius_y = width / 2

  self.left_top.x = center.x - radius_x
  self.right_bottom.x = center.x + radius_x

  self.left_top.y = center.y - radius_y
  self.right_bottom.y = center.y + radius_y

  return self
end

--- Create a new area table from the given area, removing any extra fields and metatables.
-- @tparam Concepts.BoundingBox self The area to strip.
-- @treturn Concepts.BoundingBox The stripped area.
function flib_area.strip(self)
  return {
    left_top = {
      x = self.left_top.x,
      y = self.left_top.y
    },
    right_bottom = {
      x = self.right_bottom.x,
      y = self.right_bottom.y
    }
  }
end

--- Calculate the width of an area.
-- @tparam Concepts.BoundingBox self The area to measure.
-- @treturn number The width of the area.
function flib_area.width(self)
  return math.abs(self.right_bottom.x - self.left_top.x)
end

return flib_area

