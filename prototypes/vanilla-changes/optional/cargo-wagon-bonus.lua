---------------------
-- -- Cargo wagon capacity bonus

local cargo_wagon_bonus = krastorio.general.getSafeSettingValue("kr-cargo-wagon-bonus")
if cargo_wagon_bonus and cargo_wagon_bonus ~= 0 then
  data.raw["cargo-wagon"]["cargo-wagon"].inventory_size = data.raw["cargo-wagon"]["cargo-wagon"].inventory_size
    + cargo_wagon_bonus
end

---------------------
