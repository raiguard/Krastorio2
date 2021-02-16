--- Extends the [Lua 5.2 math library](https://www.lua.org/manual/5.2/manual.html#6.6), adding more capabilities and
-- functions.
-- @module math
-- @alias flib_math
-- @usage local math = require("__flib__.math")
local flib_math = {}

-- import lua math functions
for name, func in pairs(math) do
  flib_math[name] = func
end

--- Constants
-- @section

--- Multiply by degrees to convert to radians.
-- @usage
-- local deg = 1
-- local rad = deg x flib_math.deg_to_rad -- 0.0174533
flib_math.deg_to_rad = flib_math.pi / 180
--- Multiply by radians to convert to degrees.
-- @usage
-- local rad = 1
-- local deg = rad x flib_math.rad_to_deg -- 57.2958
flib_math.rad_to_deg = 180 / flib_math.pi

--- Max double
flib_math.max_double = 0X1.FFFFFFFFFFFFFP+1023
--- Min double
flib_math.min_double = -0X1.FFFFFFFFFFFFFP+1023

--- 127
flib_math.max_int8 = 127
--- -128
flib_math.min_int8 = -128
--- 255
flib_math.max_uint8 = 255

--- 32,767
flib_math.max_int16 = 32767
--- -32,768
flib_math.min_int16 = -32768
--- 65,535
flib_math.max_uint16 = 65535

--- 2,147,483,647
flib_math.max_int = 2147483647
--- -2,147,483,648
flib_math.min_int = -2147483648
--- 4,294,967,295
flib_math.max_uint = 4294967295

--- 9,007,199,254,740,991
flib_math.max_int53 = 0x1FFFFFFFFFFFFF
--- -9,007,199,254,740,992
flib_math.min_int53 = -0x20000000000000

--- Functions
-- @section

--- Round a number to the nearest integer.
-- This function is measurably faster than @{math.round_to} and should be used in place of it where applicable.
--
-- From [lua-users.org](http://lua-users.org/wiki/SimpleRound).
-- @tparam number num
-- @tparam[opt=1] number divisor `num` will be rounded to the nearest multiple of `divisor`.
-- @treturn number
function flib_math.round(num, divisor)
  divisor = divisor or 1
  if num >= 0 then
    return flib_math.floor((num / divisor) + 0.5) * divisor
  else
    return flib_math.ceil((num / divisor) + 0.5) * divisor
  end
end

--- Round a number to the nearest N decimal places.
-- Use @{math.round} if no decimals are needed.
-- From [lua-users.org](http://lua-users.org/wiki/SimpleRound).
-- @tparam number num
-- @tparam number num_decimals
-- @treturn number
function flib_math.round_to(num, num_decimals)
  local mult = 10^(num_decimals)
  return flib_math.floor(num * mult + 0.5) / mult
end

--- Ceil a number to N decimal places.
-- Use `math.ceil` directly if no decimals are needed.
-- @tparam number num
-- @tparam number num_decimals
-- @treturn number
function flib_math.ceil_to(num, num_decimals)
  local mult = 10^(num_decimals)
  return flib_math.ceil(num * mult) / mult
end

--- Floor a number to N decimal places.
-- Use `math.floor` directly if no decimals are needed.
-- @tparam number num
-- @tparam number num_decimals
-- @treturn number
function flib_math.floor_to(num, num_decimals)
  local mult = 10^(num_decimals)
  return flib_math.floor(num * mult) / mult
end

--- Calculate the mean (average) of a set of numbers.
-- @tparam array set An array of numbers to find the average of.
-- @treturn number The mean of the set.
function flib_math.mean(set)
  local len = #set
  local sum = set[1]
  for i = 2, len do
    sum = sum + set[i]
  end
  return sum / len
end

--- Clamp a number between minimum and maximum values.
-- @tparam number x
-- @tparam number min
-- @tparam number max
-- @treturn number
function flib_math.clamp(x, min, max)
  return x < min and min or (x > max and max or x)
end

--- Linearly interpolate between `num1` and `num2` by `amount`.
--
-- The parameter `amount` is clamped between `0` and `1`.
--
-- When `amount = 0` returns `num1`.
--
-- When `amount = 1` returns `num2`.
--
-- When `amount = 0.5` returns the midpoint of `num1` and `num2`.
-- @tparam number num1 The start value.
-- @tparam number num2 The end value.
-- @tparam number amount The interpolation value between the two numbers.
-- @treturn number The interpolated result between the two numbers.
function flib_math.lerp(num1, num2, amount)
  return num1 + (num2 - num1) * flib_math.clamp(amount, 0, 1)
end

return flib_math
