-- Disable crush site explosion
if script.active_mods["aai-industry"] then
  remote.add_interface("kr-to-aai-industry", { allow_aai_crash_sequence = function(data) return {allow = false, weight = 1} end})
end

return {}
