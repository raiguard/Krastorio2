-- -- -- Remove or keep infinite technologies

if krastorio.general.getSafeSettingValue("kr-infinite-technology") then
  krastorio.technologies.setMaxLevelInfinite("physical-projectile-damage-16")
  krastorio.technologies.setMaxLevelInfinite("stronger-explosives-16")
  krastorio.technologies.setMaxLevelInfinite("refined-flammables-16")
  krastorio.technologies.setMaxLevelInfinite("energy-weapons-damage-16")
  krastorio.technologies.setMaxLevelInfinite("artillery-shell-range-5")
  krastorio.technologies.setMaxLevelInfinite("artillery-shell-speed-5")
  krastorio.technologies.setMaxLevelInfinite("mining-productivity-16")
  krastorio.technologies.setMaxLevelInfinite("follower-robot-count-9")
  krastorio.technologies.setMaxLevelInfinite("worker-robots-speed-9")
end
