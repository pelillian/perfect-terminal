-- Pull in the wezterm API
local wezterm = require 'wezterm'

wezterm.font("UbuntuMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 160
config.initial_rows = 40

config.max_fps = 120
config.prefer_egl = true

config.font = wezterm.font('UbuntuMono Nerd Font')
config.font_size = 16
config.line_height = 1.4
config.window_decorations = 'RESIZE'
config.use_fancy_tab_bar = false
config.tab_max_width = 48
config.show_new_tab_button_in_tab_bar = false
config.use_resize_increments = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on('format-tab-title', function(tab)
  local title = tab.active_pane.title
  if #title > 42 then
    title = title:sub(1, 42) .. '…'
  end
  return '  ' .. title .. '  '
end)

config.window_frame = {
  font = wezterm.font('UbuntuMono Nerd Font'),
  font_size = 16,
  inactive_titlebar_bg = '#13071E',
  active_titlebar_bg = '#13071E',
  inactive_titlebar_fg = '#686868',
  active_titlebar_fg = '#EFF1F1',
  inactive_titlebar_border_bottom = '#13071E',
  active_titlebar_border_bottom = '#13071E',
  button_fg = '#B2B1A4',
  button_bg = '#13071E',
  button_hover_fg = '#EFF1F1',
  button_hover_bg = '#1E0F30',
}

config.enable_csi_u_key_encoding = true
config.keys = {
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendKey { key = 'Enter', mods = 'SHIFT' },
  },
}

config.colors = {
  tab_bar = {
    background = '#13071E',
    active_tab = {
      bg_color = '#1E0F30',
      fg_color = '#EFF1F1',
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = '#13071E',
      fg_color = '#686868',
    },
    inactive_tab_hover = {
      bg_color = '#1E0F30',
      fg_color = '#958391',
      italic = true,
    },
    new_tab = {
      bg_color = '#13071E',
      fg_color = '#686868',
    },
    new_tab_hover = {
      bg_color = '#1E0F30',
      fg_color = '#958391',
      italic = true,
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

