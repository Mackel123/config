-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 11
config.font = wezterm.font 'Maple Mono NF'
config.color_scheme = 'nord'

config.window_padding = {
  left = 15,
  right = 15,
  top = 15,
  bottom = 15,
}
-- tab-styling
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
--config.window_decorations = "RESIZE"
-- Finally, return the configuration to wezterm:
return config


