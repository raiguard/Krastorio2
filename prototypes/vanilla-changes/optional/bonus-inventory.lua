-- -- -- Bonus inventory
local inventory_bonus = krastorio.general.getSafeSettingValue("kr-bonus-inventory")

if inventory_bonus and inventory_bonus ~= 0 then
  data.raw["character"]["character"].inventory_size = data.raw["character"]["character"].inventory_size
    + inventory_bonus
end
