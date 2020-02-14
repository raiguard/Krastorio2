-- -- -- Bonus inventory

if settings.startup["bonus-inventory"] and settings.startup["kr-bonus-inventory"].value then
   data.raw["character"]["character"].inventory_size = 120
end