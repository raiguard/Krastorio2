if mods["aai-industry"] then
  return
end

data.raw["offshore-pump"]["offshore-pump"].energy_source = {
  type = "electric",
  usage_priority = "secondary-input",
  drain = "1kW",
}

data.raw["offshore-pump"]["offshore-pump"].energy_usage = "19kW"
