--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font_size = 18

-- config.enable_tab_bar = false
-- config.tab_and_split_indicies_are_zero_based = false
-- config.hide_tab_bar_if_only_one_tab = false
-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.color_scheme = "Tokyo Night Storm"

config.colors = {
  split = "orange",
}

config.window_background_opacity = 0.9
config.macos_window_background_blur = 50

config.keys = {
  {
    key = "P",
    mods = "CMD|SHIFT",
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = "e",
    mods = "CMD",
    action = wezterm.action.SplitVertical ({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "e",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitHorizontal ({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "Backspace",
    mods = "CMD",
    action = wezterm.action.CloseCurrentTab({ confirm = false }),
  },
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },
  {
    key = "z",
    mods = "CMD",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "DownArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "UpArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
}

return config
