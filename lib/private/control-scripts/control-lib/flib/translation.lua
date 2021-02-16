--- Localised string translation and dictionary organization.
-- @module translation
-- @alias flib_translation
-- @usage local translation = require("__flib__.translation")
-- @see translation.lua
local flib_translation = {}

local table = require("__flib__.table")

local math = math
local next = next
local pairs = pairs
local string = string
local type = type

--- Functions
-- @section

--- Initial setup.
-- Must be called at the **beginning** of `on_init`, and during `on_configuration_changed` **before** any translations
-- are started.
--
-- This function will effectively cancel all running translations, so if that functionality is desired, this function is
-- a good fit for it.
function flib_translation.init()
  if not global.__flib then
    global.__flib = {}
  end
  global.__flib.translation = {
    players = {},
    translating_players_count = 0
  }
end

-- TODO Nexela Link OnTickEventData to https://lua-api.factorio.com/latest/events.html#on_tick

--- Perform translation operations.
-- Must be called during an `on_tick` event.
-- @tparam OnTickEventData event_data
function flib_translation.iterate_batch(event_data)
  local __translation = global.__flib.translation
  if __translation.translating_players_count == 0 then return end
  local translations_per_tick = settings.global["flib-translations-per-tick"].value
  local iterations = math.ceil(translations_per_tick / __translation.translating_players_count)
  if iterations < 1 then iterations = 1 end
  local current_tick = event_data.tick

  for player_index, player_table in pairs(__translation.players) do
    local player = game.get_player(player_index)
    if player.connected then
      local request_translation = player.request_translation
      local i = 0
      local sort_data = player_table.sort
      local sort_strings = sort_data and sort_data.strings
      local translate_data = player_table.translate
      local translate_strings = translate_data.strings
      while i < iterations do
        if player_table.state == "sort" then
          local string_index = sort_data.next_index
          local string_data = sort_strings[string_index]
          if string_data then
            i = i + 1
            local serialised = flib_translation.serialise_localised_string(string_data.localised)
            local translation_data = translate_strings[serialised]
            if translation_data then
              local dictionary_names = translation_data.names[string_data.dictionary]
              if dictionary_names then
                dictionary_names[#dictionary_names+1] = string_data.internal
              else
                translation_data.names[string_data.dictionary] = {string_data.internal}
              end
            else
              translate_strings[serialised] = {
                string = string_data.localised,
                names = {[string_data.dictionary]={string_data.internal}}
              }
              translate_strings.__size = translate_strings.__size + 1
            end
            sort_data.next_index = string_index + 1
            sort_strings[string_index] = nil
          else
            player_table.state = "translate"
            player_table.sort = nil
            player_table.translate.next_key = next(player_table.translate.strings, "__size")
          end
        elseif player_table.state == "translate" then
          local current_key = translate_data.next_key
          local translation_data = translate_strings[current_key]
          if translation_data then
            i = i + 1
            request_translation(translation_data.string)
            translate_data.next_key = next(translate_strings, current_key)
          else
            player_table.state = "wait"
            player_table.translate.current_key = nil
          end
        elseif player_table.state == "wait" then
          local wait_tick = player_table.wait_tick
          if wait_tick then
            if wait_tick <= current_tick then
              -- if this player is still being iterated at this point, there are some unreceived translations
              -- see https://forums.factorio.com/84570
              player_table.state = "translate"
              player_table.translate.next_key = next(translate_strings, "__size")
            end
          else
            player_table.wait_tick = current_tick + 20
          end
          break -- only needs to run once per player per tick
        end
      end
    else
      flib_translation.cancel(player_index)
    end
  end
end

-- TODO Nexela Link OnStringTranslatedEventData to https://lua-api.factorio.com/latest/events.html#on_string_translated

--- Process a received translation.
-- Must be called during an `on_string_translated` event.
-- @tparam OnStringTranslatedEventData event_data
-- @treturn ResultSortData
-- @treturn boolean If all of the player's translations are complete.
function flib_translation.process_result(event_data)
  local __translation = global.__flib.translation
  if __translation.translating_players_count == 0 then return end
  local player_table = __translation.players[event_data.player_index]
  if not player_table then return end
  if player_table.state == "sort" then return end

  local serialised = flib_translation.serialise_localised_string(event_data.localised_string)
  local translate_strings = player_table.translate.strings

  local translation_data = translate_strings[serialised]
  if translation_data then
    local names = translation_data.names
    translate_strings[serialised] = nil
    translate_strings.__size = translate_strings.__size - 1
    local finished = false
    if translate_strings.__size == 0 then
      flib_translation.cancel(event_data.player_index)
      finished = true
    end
    return names, finished
  end
  return nil, false
end

--- Add translation requests for the given player, to be performed over the next several ticks.
-- @tparam number player_index
-- @tparam StringData[] strings
function flib_translation.add_requests(player_index, strings)
  local __translation = global.__flib.translation
  local player_table = __translation.players[player_index]
  if player_table then
    player_table.state = "sort"
    if player_table.sort then
      local strings_to_sort = player_table.sort.strings
      for i = 1, #strings do
        strings_to_sort[#strings_to_sort+1] = strings[i]
      end
      player_table.sort.next_index = 1
    else
      player_table.sort = {
        strings = table.shallow_copy(strings),
        next_index = 1
      }
    end
    player_table.translate.next_key = nil
  else
    __translation.players[player_index] = {
      state = "sort",
      -- sort
      sort = {
        strings = table.shallow_copy(strings),
        next_index = 1
      },
      -- translate
      translate = {
        strings = {__size = 0},
        next_key = nil
      },
      -- wait
      wait_tick = nil
    }
    __translation.translating_players_count = __translation.translating_players_count + 1
  end
end

--- Cancel a player's translations.
-- @tparam number player_index
function flib_translation.cancel(player_index)
  local __translation = global.__flib.translation
  local player_table = __translation.players[player_index]
  if not player_table then
    log("Tried to cancel translations for player ["..player_index.."] when no translations were running!")
    return
  end
  __translation.players[player_index] = nil
  __translation.translating_players_count = __translation.translating_players_count - 1
end

--- Check whether a player is actively translating.
-- @tparam number player_index
-- @treturn boolean
function flib_translation.is_translating(player_index)
  return global.__flib.translation.players[player_index] and true or false
end

--- Check the number of players currently translating.
-- @treturn number
function flib_translation.translating_players_count()
  return global.__flib.translation.translating_players_count
end

--- Serialise a localised string into a form readable by the API.
-- Gives a similar result to serpent.line(), but is much faster.
-- @tparam Concepts.LocalisedString localised_string
-- @treturn string The serialised @{Concepts.LocalisedString}.
function flib_translation.serialise_localised_string(localised_string)
  if type(localised_string) == "string" then return localised_string end
  local output = "{"
  local first = true
  for _, v in pairs(localised_string) do
    if not first then
      output = output..","
    end
    if type(v) == "table" then
      output = output..flib_translation.serialise_localised_string(v)
    else
      output = output.."\""..tostring(v).."\""
    end
    first = false
  end
  output = output.."}"
  return output
end

return flib_translation

--- Concepts
-- @section

--- A mapping of a translated string's dictionaries and internal names.
-- Dictionary @{string} -> array of @{string}. Each key is a dictionary name, each value is an array of internal names
-- that the translation matches. Use this data to sort the translation into its appropriate locations.
-- @usage
-- {
--   entities = {"crude-oil"},
--   fluids = {"crude-oil"}
-- }
-- @usage
-- {
--   entities = {"iron-ore"},
--   items = {"iron-ore"},
--   recipes = {"iron-ore"}
-- }
-- @Concept ResultSortData

--- Dictioanry data for a localised string.
-- @tfield string dictionary The "dictionary" (subtable) that this string belongs to.
-- @tfield string internal The internal name that will be used to reference this string.
-- @tfield Concepts.LocalisedString localised The localised string to translate.
-- @usage
-- {
--   {dictionary="fluids", internal="crude-oil", localised={"fluid-name.crude-oil"}},
--   {dictionary="items", internal="iron-ore", localised={"item-name.iron-ore"}},
--   {dictionary="gui", internal="search-ellipses", localised={"demo-gui.search-ellipses"}}
-- }
-- @Concept StringData
