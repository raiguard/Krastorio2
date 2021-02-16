--- Functions for working with orientations.
-- @module orientation
-- @alias flib_orientation
-- @usage local orientation = require('__flib__.orientation')

local flib_orientation = {}

--- north orientation
flib_orientation.north = defines.direction.north / 8
--- east orientation
flib_orientation.east = defines.direction.east / 8
--- west orientation
flib_orientation.west = defines.direction.west / 8
--- south orientation
flib_orientation.south = defines.direction.south / 8
--- northeast orientation
flib_orientation.northeast = defines.direction.northeast / 8
--- northwest orientation
flib_orientation.northwest = defines.direction.northwest / 8
--- southeast orientation
flib_orientation.southeast = defines.direction.southeast / 8
--- southwest orientation
flib_orientation.southwest = defines.direction.southwest / 8

local floor = math.floor

--- Returns a 4way or 8way direction from an orientation.
-- @tparam number orientation
-- @tparam[opt=false] boolean eight_way
-- @treturn defines.direction
function flib_orientation.to_direction(orientation, eight_way)
  local ways = eight_way and 8 or 4
  local mod = eight_way and 1 or 2
  return floor(orientation * ways + 0.5) % ways * mod
end

--- Returns the opposite orientation.
-- @tparam number orientation
-- @treturn number the opposite orientation
function flib_orientation.opposite(orientation)
  return (orientation + 0.5) % 1
end

--- Add two orientations together.
-- @tparam number orientation1
-- @tparam number orientation2
-- @treturn number the orientations added together
function flib_orientation.add(orientation1, orientation2)
  return (orientation1 + orientation2) % 1
end

return flib_orientation