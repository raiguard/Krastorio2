-- -- -- Remove or keep infinite technologies

if krastorio.general.getSafeSettingValue("kr-infinite-technology") then
	krastorio.technologies.setMaxLevelInfinite("physical-projectile-damage-7")
	krastorio.technologies.setMaxLevelInfinite("stronger-explosives-7")
	krastorio.technologies.setMaxLevelInfinite("refined-flammables-7")
	krastorio.technologies.setMaxLevelInfinite("energy-weapons-damage-7")
	krastorio.technologies.setMaxLevelInfinite("energy-weapons-damage-7")
	krastorio.technologies.setMaxLevelInfinite("artillery-shell-range-1")
	krastorio.technologies.setMaxLevelInfinite("artillery-shell-speed-1")
	krastorio.technologies.setMaxLevelInfinite("mining-productivity-4")
	krastorio.technologies.setMaxLevelInfinite("follower-robot-count-7")
	krastorio.technologies.setMaxLevelInfinite("worker-robots-speed-6")
else
	data.raw.technology["physical-projectile-damage-7"].max_level = 18
	data.raw.technology["stronger-explosives-7"].max_level        = 18
	data.raw.technology["refined-flammables-7"].max_level         = 18
	data.raw.technology["energy-weapons-damage-7"].max_level      = 18
	data.raw.technology["energy-weapons-damage-7"].max_level      = 18
	data.raw.technology["artillery-shell-range-1"].max_level      = 10
	data.raw.technology["artillery-shell-speed-1"].max_level      = 5
	data.raw.technology["mining-productivity-4"].max_level        = 500
	data.raw.technology["follower-robot-count-7"].max_level       = 10
	data.raw.technology["worker-robots-speed-6"].max_level        = 9
end
