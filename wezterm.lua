-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox dark, hard (base16)"
warn_about_missing_glyphs = true
-- Changing the font
config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
-- config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 16.5

config.font = wezterm.font_with_fallback {
  'IosevkaTerm',
  'JetBrainsMonoNerdFont',
  'font-logos',
  'NotoColorEmoji'
}
--   -- /usr/share/fonts/TTF/HackNerdFont-Bold.ttf, FontConfig
--   {family="Hack Nerd Font", weight="Bold"},

--   -- /usr/share/fonts/TTF/JetBrainsMonoNerdFont-SemiBold.ttf, FontConfig
--   -- AKA: "JetBrainsMono NF"
--   -- AKA: "JetBrainsMono NF SemiBold"
--   {family="JetBrainsMono Nerd Font", weight="DemiBold"},

--   -- /usr/share/fonts/TTF/JetBrainsMono-Regular.ttf, FontConfig
--   "JetBrains Mono",

--   -- /usr/share/fonts/noto/NotoColorEmoji.ttf, FontConfig
--   -- Assumed to have Emoji Presentation
--   -- Pixel sizes: [128]
--   "Noto Color Emoji",

-- })
-- and finally, return the configuration to wezterm
return config
