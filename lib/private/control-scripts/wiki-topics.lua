local patreons_list = require("__Krastorio2__/lib/private/control-scripts/control-lib/patreon-names")
local text_patreons_list = ""
local line_counter = 0
for _, supporter_name in pairs(patreons_list.getOverallSupportersList()) do
  line_counter = line_counter + 1
  if line_counter == 5 then
    text_patreons_list = text_patreons_list .. supporter_name .. ",\n"
    line_counter = 0
  else
    text_patreons_list = text_patreons_list .. supporter_name .. ", "
  end
end
text_patreons_list = text_patreons_list:sub(1, -2) .. "."

-- Topic format
-- (localized_string_name is only the text name, not the complelty string, so if localized_string is {"iron"}, the name is "iron")
--[[
{
  name  = localized_string,
  topic =
  {
    {type = "title", title = localized_string_name },
    {type = "image", spritename = image_name},
    {type = "text", text = localized_string_name}
  }
}
]]

return {
  {
    name = "tips-and-tricks-item-name.kr-about-k2",
    topic = {
      { type = "image", spritename = "about-k2-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-about-k2" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-shelter",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-shelter" },
      { type = "image", spritename = "kr-shelter-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-shelter" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-new-gun-play",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-new-gun-play" },
      { type = "image", spritename = "kr-new-gun-play-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-new-gun-play" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-new-metals",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-new-metals" },
      { type = "image", spritename = "new-metals-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-new-metals" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-creep",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-creep" },
      { type = "image", spritename = "kr-creep-preview-1" },
      { type = "image", spritename = "kr-creep-preview-2" },
      { type = "text", text = "tips-and-tricks-item-description.kr-creep" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-fuels",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-fuels" },
      { type = "image", spritename = "kr-fuels-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-fuels" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-air-purifier",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-air-purifier" },
      { type = "image", spritename = "air-purifier-preview-1" },
      { type = "image", spritename = "air-purifier-preview-2" },
      { type = "text", text = "tips-and-tricks-item-description.kr-air-purifier" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-inserters-krastorio-hotkey",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-inserters-krastorio-hotkey" },
      { type = "image", spritename = "kr-inserters-hotkey-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-inserters-krastorio-hotkey" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-roboports-hotkey",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-roboports-hotkey" },
      { type = "image", spritename = "roboports-hotkey-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-roboports-hotkey" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-fusion-reactor",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-fusion-reactor" },
      { type = "image", spritename = "kr-fusion-reactor-preview" },
      { type = "image", spritename = "kr-advanced-steam-turbine-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-fusion-reactor" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-matter-of-matter",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-matter-of-matter" },
      { type = "image", spritename = "kr-matter-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-matter-of-matter" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-intergalactic-transceiver",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-intergalactic-transceiver" },
      { type = "image", spritename = "kr-intergalactic-transceiver-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-intergalactic-transceiver" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-radiation",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-radiation" },
      { type = "text", text = "tips-and-tricks-item-description.kr-radiation" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-crusher",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-crusher" },
      { type = "image", spritename = "kr-crusher-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-crusher" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-wireless-charger",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-crusher" },
      { type = "image", spritename = "kr-tesla-coil-preview" },
      { type = "image", spritename = "kr-energy-absorber-preview" },
      { type = "text", text = "tips-and-tricks-item-description.kr-crusher" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-planetary-teleporter",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-planetary-teleporter" },
      { type = "image", spritename = "planetary-teleporter-preview-1" },
      { type = "image", spritename = "planetary-teleporter-preview-2" },
      { type = "text", text = "tips-and-tricks-item-description.kr-planetary-teleporter" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-commands",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-commands" },
      { type = "text", text = "tips-and-tricks-item-description.kr-commands" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-achievements",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-achievements" },
      { type = "text", text = "tips-and-tricks-item-description.kr-achievements" },
    },
  },
  {
    name = "tips-and-tricks-item-name.kr-faq",
    topic = {
      { type = "title", title = "tips-and-tricks-item-name.kr-faq" },
      { type = "text", text = "tips-and-tricks-item-description.kr-faq" },
    },
  },
}
