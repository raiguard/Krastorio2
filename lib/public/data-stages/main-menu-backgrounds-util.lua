if not krastorio.backgrounds then
  krastorio.backgrounds = {}
end
if not krastorio.backgrounds_utils then
  krastorio.backgrounds_utils = {}
end

function krastorio.backgrounds_utils.addBackgroundImage(name, path)
  if name then
    krastorio.backgrounds[name] = path
  end
end

function krastorio.backgrounds_utils.getBackgroundPath(name)
  if krastorio.backgrounds[name] then
    return krastorio.backgrounds[name]
  end
  return "__core__/graphics/background-image.jpg"
end

return krastorio.backgrounds_utils
