local wezterm = require 'wezterm'

local M = {}

M.tokyonight_day = {
    colors = {
        foreground = "#3760bf",
        background = "#e1e2e7",
        cursor_bg = "#3760bf",
        cursor_border = "#3760bf",
        cursor_fg = "#e1e2e7",
        selection_bg = "#99a7df",
        selection_fg = "#3760bf",
        ansi = {"#e9e9ed", "#f52a65", "#587539", "#8c6c3e", "#2e7de9", "#9854f1", "#007197", "#6172b0"},
        brights = {"#a1a6c5", "#f52a65", "#587539", "#8c6c3e", "#2e7de9", "#9854f1", "#007197", "#3760bf"},
        tab_bar = {
            active_tab = {
                fg_color = "#3760bf",
                bg_color = "#a8aecb",
            },
            inactive_tab = {
                fg_color = "#68709a",
                bg_color = "#e1e2e7",
            },
            inactive_tab_hover = {
                fg_color = "#68709a",
                bg_color = "#c0caf5",
            },
            new_tab = {
                fg_color = "#68709a",
                bg_color = "#e1e2e7",
            },
            new_tab_hover = {
                fg_color = "#68709a",
                bg_color = "#c0caf5",
            },
            inactive_tab_edge = "#a9b1d6",
        }
    },
    window_frame = {
        active_titlebar_bg = "#e1e2e7",
        inactive_titlebar_bg = "#e1e2e7",
    },
}

M.tokyonight_storm = {
    colors = {
        foreground = "#c0caf5",
        background = "#24283b",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#24283b",
        selection_bg = "#364a82",
        selection_fg = "#c0caf5",
        ansi = {"#1d202f", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6"},
        brights = {"#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5"},
        tab_bar = {
            active_tab = {
                fg_color = "#c0caf5",
                bg_color = "#414868",
            },
            inactive_tab = {
                fg_color = "#a9b1d6",
                bg_color = "#24283b",
            },
            inactive_tab_hover = {
                fg_color = "#a9b1d6",
                bg_color = "#1f2335",
            },
            new_tab = {
                fg_color = "#c0caf5",
                bg_color = "#24283b",
            },
            new_tab_hover = {
                fg_color = "#c0caf5",
                bg_color = "#1f2335",
            },
            inactive_tab_edge = "#a9b1d6",
        }
    },
    window_frame = {
        active_titlebar_bg = "#24283b",
        inactive_titlebar_bg = "#24283b",
    }
}

function M.get_color()
    local appearance = wezterm.gui.get_appearance()
    if appearance:find 'Dark' then
        return M.tokyonight_storm
    else
        return M.tokyonight_day
    end
end

return M
