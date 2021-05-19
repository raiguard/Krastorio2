--[[
Copyright © 2019 Ben Tasker | Sitemap | Privacy Policy
Available at snippets.bentasker.co.uk, yr4pnhounvdybotb.onion and snippets.6zdgh5a5e6zpchdz.onion
--]]
function split(str, pat)
  local t = {}

  for substr in string.gmatch(str, "[^" .. pat .. "]*") do
    if substr ~= nil and string.len(substr) > 0 then
      table.insert(t, substr)
    end
  end

  return t
end
