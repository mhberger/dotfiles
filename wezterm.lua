-- Import the wezterm module
local wezterm = require 'wezterm'

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- Spawn a bash shell in login mode
-- TODO not sure that the following works
config.default_prog = { '/opt/local/bin/bash', '-l' }

-- Pick a colour scheme. WezTerm ships with more than 1,000!
-- Find them here: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Solarized Light (Gogh)'

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
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
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
    }
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
