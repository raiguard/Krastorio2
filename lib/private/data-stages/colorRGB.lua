local color = {}

function color.convert(red, green, blue, alpha)
  return { r = red / 255, g = green / 255, b = blue / 255, a = (alpha or 255) / 255 }
end

return color
