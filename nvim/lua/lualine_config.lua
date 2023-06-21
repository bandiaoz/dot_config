local function line_number()
    local cur_line=vim.fn.line('.')
    local total_line=vim.fn.line('$')
    local column=vim.fn.col('.')
    return cur_line .. '/' .. total_line .. ':' .. column
end

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
                        'branch', 'diff',
                        { 'diagnostics', sources={ 'nvim_diagnostic', 'coc' } }
                    },
        lualine_c = {'filename', 'aerial'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {},
        lualine_z = {line_number}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'aerial' }
}
