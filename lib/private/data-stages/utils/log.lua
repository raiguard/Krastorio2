krastorio_utils.log = {}
krastorio_utils.inspect = require("inspect")
krastorio_utils.log.enabled = true

--[[ Level number and type:
  INFO    <=1 -- information message (for dev)
  CONFIG    2 -- setted a configuration message (for dev)
  WARNING   3 -- message with a possible problem of mod, maybe nothing of important, maybe not
  ERROR     4 -- message with an error report, the game with start but with problems
  SEVERE  >=5 -- message with a fatal error, the mod can't work with this errors
]]
--

function krastorio_utils.log.disableLogs()
  krastorio_utils.log.enabled = false
end

function krastorio_utils.log.enableLogs()
  krastorio_utils.log.enabled = true
end

-- @ txt
function krastorio_utils.log.info(txt)
  if krastorio_utils.log.enabled then
    return krastorio_utils.log._(txt, "INFO")
  end
end

-- @ txt
function krastorio_utils.log.config(txt)
  if krastorio_utils.log.enabled then
    return krastorio_utils.log._(txt, "CONFIG")
  end
end

-- @ txt
function krastorio_utils.log.warning(txt)
  if krastorio_utils.log.enabled then
    return krastorio_utils.log._(txt, "WARNING")
  end
end

-- @ txt
function krastorio_utils.log.error(txt)
  if krastorio_utils.log.enabled then
    return krastorio_utils.log._(txt, "ERROR")
  end
end

-- @ txt
function krastorio_utils.log.severe(txt)
  return krastorio_utils.log._(txt, "SEVERE")
end

-- @ level
-- @ txt
function krastorio_utils.log.write(level, txt)
  if level then
    if type(level) == "string" then
      if string.lower(level) == "info" then
        return krastorio_utils.log.info(txt)
      elseif string.lower(level) == "config" then
        return krastorio_utils.log.config(txt)
      elseif string.lower(level) == "warning" then
        return krastorio_utils.log.warning(txt)
      elseif string.lower(level) == "error" then
        return krastorio_utils.log.error(txt)
      else
        return krastorio_utils.log.severe(txt)
      end
    end
    if type(level) == "number" then
      if level <= 1 then
        return krastorio_utils.log.info(txt)
      elseif level == 2 then
        return krastorio_utils.log.config(txt)
      elseif level == 3 then
        return krastorio_utils.log.warning(txt)
      elseif level == 4 then
        return krastorio_utils.log.error(txt)
      else
        return krastorio_utils.log.severe(txt)
      end
    end
  end
  return false
end

-- Private

function krastorio_utils.log._(txt, message_level)
  local base_level = 1
  if debug.getinfo(3) then
    base_level = 2
  end
  local out_file, out_function_name, out_line =
    debug.getinfo(base_level + 1).short_src,
    debug.getinfo(base_level + 1).name,
    debug.getinfo(base_level + 1).currentline
  local in_file, in_function_name, in_line =
    debug.getinfo(base_level).short_src, debug.getinfo(base_level).name, debug.getinfo(base_level).currentline

  log("Krastorio 2|LogLevel:" .. message_level)
  if in_function_name then
    log("From Krastorio 2->file:" .. in_file .. "->function:" .. in_function_name .. "->line:" .. in_line)
  else
    log("From Krastorio 2->file:" .. in_file .. "->line:" .. in_line)
  end
  if out_function_name then
    log("Called in->file:" .. out_file .. "->function:" .. out_function_name .. "->line:" .. out_line)
  else
    log("Called in->file:" .. out_file .. "->line:" .. out_line)
  end
  log("Message: " .. krastorio_utils.inspect(txt))

  return true
end
