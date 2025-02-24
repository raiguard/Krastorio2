do
  local incompatible_with_space_age = mods["space-age"] and data.raw["bool-setting"]["kr-incompatible-with-space-age"].forced_value
  local incompatible_with_quality   = mods["quality"  ] and data.raw["bool-setting"]["kr-incompatible-with-quality"  ].forced_value

  if incompatible_with_space_age or incompatible_with_quality then
    local message = "\n\n[space-age] [font=default-bold]Krastorio 2[/font] is not compatible with "

    local incompatibilities = {}
    if incompatible_with_space_age then
      table.insert(incompatibilities, "[font=default-bold]Space Age[/font]")
    end
    if incompatible_with_quality then
      table.insert(incompatibilities, "[font=default-bold]Quality[/font]")
    end
    message = message .. table.concat(incompatibilities, " nor ") .. ","
    message = message .. " resolve the conflict by clicking the [font=default-bold][Manage mods][/font] button below.\n"
    -- message = message .. " please click the [font=default-bold][Manage mods][/font] button to resolve it.\n"
    -- message = message .. "\nPlease click the [font=default-bold][Manage mods][/font] button and disable either [font=default-bold]Krastorio 2[/font] or " .. table.concat(incompatibilities, " and ") .. "."

    error(message)
  end
end

-- if mods["space-age"] and data.raw["bool-setting"]["kr-incompatible-with-space-age"].forced_value then
--   message = "\n[space-age] [font=default-bold]Krastorio 2[/font] is not compatible with [font=default-bold]Space Age[/font]."
--   error("\n[space-age] [font=default-bold]Krastorio 2[/font] is not compatible with [font=default-bold]Space Age[/font].")
-- end

-- if mods["quality"] and data.raw["bool-setting"]["kr-incompatible-with-quality"].forced_value then
--   error("Krastorio 2 is not compatible with Quality.")
-- end
