require('telescope').setup {
    defaults = {
        file_sorter = require'telescope.sorters'.get_fzy_sorter,
        mappings = {
            i = {
                ['<c-j>'] = 'move_selection_next',
                ['<c-k>'] = 'move_selection_previous',
            }
        }
    },
    extensions = {
        fzy_native = {
            override = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        },
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('aerial')

local M={}

local layout_bottom = {
    layout_strategy = 'bottom_pane',
    layout_config = {
        height = 0.3,
        preview_width = 0.4
    }
}

function M.find_acm_template()
    require('telescope.builtin').find_files {
        prompt_title = "Templates",
        search_dirs = { "~/github/algo/master/src" },
        cwd = "~/github/algo/master/src"
    }
end

function M.find_dot_files()
    require('telescope.builtin').find_files {
        prompt_title = "Dot Files",
        search_dirs={"~/.config"}
    }
end

function M.diagnostics()
    require"telescope.builtin".diagnostics(layout_bottom)
end

return M
