local M = {}
local ls = require('luasnip')

M.map = vim.keymap.set

local map = M.map

-- Remove spaces at the end of lines
map('n', '<Space>cw', '<cmd>keeppatterns %s/\\s\\+$//e<CR>', {silent=true})

-- alt-; to exit insert mode in terminal
map('t', '<A-;>', '<C-\\><C-n>')

-- switch window
map({'t', 'i'}, '<A-h>', '<C-\\><C-N><C-w>h')
map({'t', 'i'}, '<A-j>', '<C-\\><C-N><C-w>j')
map({'t', 'i'}, '<A-k>', '<C-\\><C-N><C-w>k')
map({'t', 'i'}, '<A-l>', '<C-\\><C-N><C-w>l')
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')

-- Paste without overiding your register
map('x', '<leader>p', '"_dP')

-- Yank to system clipboard
map({'n', 'v'}, '<leader>y', '"+y')

-- nnn
map('n', '<Leader>n', '<cmd>NnnPicker<CR>')

--Hop
map('', 's', '<cmd>HopChar2<CR>')

-- barbar
map('n', '<Leader>bc', '<cmd>BufferCloseAllButCurrent<CR>', {silent=true})
map('n', '<A-w>', '<cmd>BufferClose<CR>', {silent=true})
map('i', '<A-w>', '<cmd>BufferClose<CR>', {silent=true})
map('n', '<A-q>', '<cmd>BufferClose!<CR>', {silent=true})
map('n', '<A-,>', '<cmd>BufferPrevious<CR>', {silent=true})
map('n', '<A-.>', '<cmd>BufferNext<CR>', {silent=true})
map('i', '<A-,>', '<cmd>BufferPrevious<CR>', {silent=true})
map('i', '<A-.>', '<cmd>BufferNext<CR>', {silent=true})

-- settings for resize splitted window
map('n', '<C-w>[', '<cmd>vertical resize -3<CR>')
map('n', '<C-w>]', '<cmd>vertical resize +3<CR>')

-- Ctrl-a to copy all
-- map('n',  '<C-A>', '<cmd>%y+<CR>')
map('n',  '<C-A>', require('my_functions').expand_cpp)

map('i', '<C-l>', function()
    if vim.o.spell then -- correct spell error if spell check is on
        vim.api.nvim_input('<c-g>u<Esc>[s1z=`]a<c-g>u')
    else -- otherwise do noh
        vim.cmd('noh')
    end
end, { silent = true })

-- telescope
map('n', '<Leader>ff', require"telescope.builtin".find_files)
map('n', '<Leader>ft', require"my_telescope".find_acm_template)
map('n', '<Leader>fd', require"my_telescope".find_dot_files)
map('n', '<Leader>fb', require"telescope.builtin".buffers)
map('n', '<C-p>', require"telescope.builtin".find_files)
map('n', 'gd', require"telescope.builtin".lsp_definitions)
map('n', 'gi', require"telescope.builtin".lsp_implementations)
map('n', 'gr', require"telescope.builtin".lsp_references)
map('n', 'gb', require"telescope.builtin".buffers)
map('n', '<Leader>s', require'telescope'.extensions.aerial.aerial)
map('n', '<Leader>e', require"my_telescope".diagnostics)

-- toggleterm
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = 'float',
    float_opts = {
        border = 'double'
    }
})
map('n', '<Leader>g', function() lazygit:toggle() end)

-- compile/run/test
map('n', '<Leader>r', function() require"my_functions".compileAndRun(false) end)
map('n', '<Leader>t', function() require"my_functions".compileAndRun(true) end)

-- dap
map('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
map('n', '<leader>ds', "<cmd>lua require'dap'.repl.open()<cr>")
map('n', '<C-c>', "<cmd>lua require'dap'.continue()<cr>")
map('n', '<C-s>', "<cmd>lua require'dap'.step_into()<cr>")

-- Spectre
map('n', '<leader>S', require('spectre').open)
map('n', '<leader>fw', function() require('spectre').open_visual({select_word=true}) end)

-- Harpoon
map('n', '<Leader>fm', require("harpoon.ui").toggle_quick_menu)
map('n', '<Leader>ma', require("harpoon.mark").add_file)

-- LuaSnip
map('i', '<c-j>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end)
map('n', '<Leader><Leader>s', function()
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})
end)
map({ 'i', 's' }, '<c-n>', function ()
    if ls.choice_active() then
        ls.change_choice(1)
    else
        vim.api.nvim_input('<c-n>')
    end
end)
map({ 'i', 's' }, '<c-p>', function ()
    if ls.choice_active() then
        ls.change_choice(-1)
    else
        vim.api.nvim_input('<c-p>')
    end
end)

return M
