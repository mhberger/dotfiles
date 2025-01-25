-- Import the wezterm module
local wezterm = require 'wezterm'
-- local cjson = require "cjson"

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- Spawn a bash shell in login mode
-- TODO not sure that the following works
config.default_prog = { '/opt/local/bin/bash', '-l' }

-- Pick a colour scheme. WezTerm ships with more than 1,000!
-- Find them here: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Solarized Light (Gogh)'

-- disable setting hyperlinks.
config.hyperlink_rules = {}

-- Do not close windows automatically as it messes the order - does not work
config.window_close_confirmation = 'AlwaysPrompt'
config.skip_close_confirmation_for_processes_named = {
  'sh',
  'zsh',
  'fish',
  'tmux',
  'nu',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
}

-- WIP trying to select the bit after a forward slash (/)
config.quick_select_patterns = {
  -- match things that look like sha1 hashes
  -- (this is actually one of the default patterns)
  '[0-9a-f]{7,40}',
  '([a-zA-Z0-9]{1,30})/',
}


config.font = wezterm.font 'PragmataPro Mono'
config.font_rules = {
  {
    font = wezterm.font {
      family = 'PragmataPro Mono',
      weight = 'DemiLight'
    },
  },
}

config.font_size = 16
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font =
--   wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })

-- tab bar
config.use_fancy_tab_bar = true
config.window_frame = {
  font_size = 18.0
}

-- Rather than emitting fancy composed characters when alt is pressed, treat the
-- input more like old school ascii with ALT held down
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

-- similarly, don't ask the macOS IME/text services to compose input
config.use_ime = false

wezterm.log_info("Hello World! My host name is " .. wezterm.hostname())

---------------------------------
-- FUNCTIONS
---------------------------------
wezterm.on('update-status', function(window)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen colour scheme
  -- including any overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. window:window_id() + 1 .. '… ' },
  }))
end)

wezterm.on('show-font-size', function(window, pane)
  wezterm.log_info("Font size is " .. window:effective_config().font_size)
end)

wezterm.on('show-wezterm-config', function(window, pane)
  -- wezterm.copy_to_clipboard(window:effective_config())
  -- wezterm.log_info(cjson.encode(window:effective_config()))
  wezterm.log_info(window:effective_config())
end)

---------------------------------
-- CONFIGURE KEYS
---------------------------------
local act = wezterm.action

config.keys = {
  {
    key = ',',
    mods = 'CMD',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { '/usr/local/bin/zed', wezterm.config_file },
    },
  },
  {
    key = 'e',
    mods = 'CMD',
    -- action = wezterm.action.EmitEvent 'show-font-size',
    action = wezterm.action.EmitEvent 'show-wezterm-config',
  },
  {
    key = 'd',
    mods = 'SHIFT|CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  }
}

for i = 1, 8 do
  -- CMD + number to activate that window
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD',
    action = act.ActivateWindow(i - 1),
  })
end

---------------------------------
-- FINIS
---------------------------------
-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
