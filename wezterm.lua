-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 160
config.initial_rows = 40

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_padding = {
  left = 80,
  right = 80,
  top = 80,
  bottom = 80,
}

config.colors = {
  tab_bar = {
    background = '#13071E',
    active_tab = {
      bg_color = '#1E0F30',
      fg_color = '#B2B1A4',
    },
    inactive_tab = {
      bg_color = '#13071E',
      fg_color = '#686868',
    },
    inactive_tab_hover = {
      bg_color = '#1E0F30',
      fg_color = '#958391',
    },
    new_tab = {
      bg_color = '#13071E',
      fg_color = '#686868',
    },
    new_tab_hover = {
      bg_color = '#1E0F30',
      fg_color = '#958391',
    },
  },
  foreground = '#EFF1F1',
  background = '#13071E',
  cursor_bg = '#F6EFB8',
  cursor_fg = '#393939',
  cursor_border = '#F6EFB8',
  selection_bg = '#3F355C',
  selection_fg = '#EFF0EF',
  ansi = {
    '#374141',
    '#E77197',
    '#BAEFB7',
    '#EBC792',
    '#B2B1A4',
    '#958391',
    '#D5D5D9',
    '#FAFBF0',
  },
  brights = {
    '#686868',
    '#F0776D',
    '#8DF77A',
    '#FEFC7F',
    '#6A71F7',
    '#0D24BF',
    '#8EFAFD',
    '#FFFFFF',
  },
}

return config

