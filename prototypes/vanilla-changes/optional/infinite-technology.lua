-- -- -- Remove or keep infinite technologies

if krastorio.general.getSafeSettingValue("kr-infinite-technology") then

	data.raw.technology["physical-projectile-damage-7"].max_level = "infinite"
	data.raw.technology["stronger-explosives-7"].max_level        = "infinite"
	data.raw.technology["refined-flammables-7"].max_level         = "infinite"
	data.raw.technology["energy-weapons-damage-7"].max_level      = "infinite"
	data.raw.technology["energy-weapons-damage-7"].max_level      = "infinite"
	data.raw.technology["artillery-shell-range-1"].max_level      = "infinite"
	data.raw.technology["artillery-shell-speed-1"].max_level      = "infinite"
	data.raw.technology["mining-productivity-4"].max_level        = "infinite"
	data.raw.technology["follower-robot-count-7"].max_level       = "infinite"
	data.raw.technology["worker-robots-speed-6"].max_level        = "infinite"
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
