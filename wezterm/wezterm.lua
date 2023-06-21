local wezterm = require 'wezterm'
local theme = require 'theme'
local act = wezterm.action

wezterm.on('window-config-reloaded', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    local target = theme.get_color()
    if overrides.colors ~= target.colors then
        overrides.colors = target.colors
        overrides.window_frame = target.window_frame
        window:set_config_overrides(overrides)
    end
end)

wezterm.on('augment-command-palette', function(window, pane)
    return {
        {
            brief = 'Rename tab',
            icon = 'mdi_rename_box',
            action = act.PromptInputLine {
                description = 'Enter new name for tab',
                action = wezterm.action_callback(function(window, pane, line)
                    if line then
                        window:active_tab():set_title(line)
                    end
                end),
            },
        },
    }
end)


local color = theme.get_color()

return {
    font = wezterm.font_with_fallback {
        "FiraCode Nerd Font Mono",
        "Noto Sans CJK SC"
    },
    font_size = 15,
    line_height = 1.1,
    colors = color.colors,
    window_frame = color.window_frame,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    default_cursor_style = 'SteadyBar',
    leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = {
        {
            key = 'm',
            mods = 'LEADER',
            action = act.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        {
            key = ';',
            mods = 'LEADER',
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'Tab',
            mods = 'CTRL|ALT|SHIFT',
            action = act.MoveTabRelative(-1),
        },
        {
            key = 'Tab',
            mods = 'CTRL|ALT',
            action = act.MoveTabRelative(1),
        },
        {
            key = 'h',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection('Left'),
        },
        {
            key = 'l',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection('Right'),
        },
        {
            key = 'k',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection('Up'),
        },
        {
            key = 'j',
            mods = 'CTRL|SHIFT',
            action = act.ActivatePaneDirection('Down'),
        },
        {
            key = 'm',
            mods = 'CTRL|SHIFT',
            action = act.PaneSelect {
                mode = 'SwapWithActive',
            },
        },
    }
}
