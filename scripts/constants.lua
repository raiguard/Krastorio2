local constants = {}

constants.tesla_coil = {
  charging_rate = 3000000, -- 3 MW
  input_flow_limit = 15000000, -- 8 MW
  loss_multiplier = 1.5,
  required_energy = 10000000, -- 10 MW
  simultaneous_allowed = 4,
}

return constants
