-- disable vim distribution plugins{{{
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1

vim.g.loaded_matchit = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1--}}}

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.o.secure = true

-- General settings{{{
vim.o.autochdir = true
vim.o.cursorline = true
vim.o.foldmethod = 'marker'
vim.o.mouse = 'a'
vim.o.swapfile = false
vim.o.synmaxcol = 2500           -- Don't syntax highlight long lines
vim.o.undofile = true
vim.o.updatetime = 100
vim.o.virtualedit = 'block'        -- Position cursor anywhere in visual block
vim.o.visualbell = true               -- Use visual bell instead of beeping
vim.o.writebackup = false
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.fileencodings:append('chinese')
vim.opt.formatoptions:append('m')        -- break a line at multibyte character, useful for Chinese
vim.opt.shortmess:append('c')
-- }}}
-- Tabs and Indents {{{
vim.o.cindent = true
vim.o.expandtab = true       -- expand tabs to spaces
vim.o.shiftround = true      -- Round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 4    -- Number of spaces to use in auto(indent)
vim.o.smartindent = true     -- Smart autoindenting on new lines
vim.o.softtabstop = -1  -- Automatically keeps in sync with shiftwidth
vim.o.tabstop = 4       -- The number of spaces a tab is
-- }}}
-- Searching & replace {{{
vim.o.ignorecase = true    -- Search ignoring case
vim.o.infercase = true     -- Adjust case in insert completion mode
vim.o.smartcase = true     -- Keep case when searching with *
vim.opt.complete = { '.', 'w', 'b', 'k' }  -- C-n completion: Scan buffers, windows and dictionary
-- }}}

-- Behavior {{{
vim.o.breakat = ' 	;:,!?'           -- Long lines break chars
vim.o.linebreak = true                   -- Break long lines at 'breakat'
vim.o.splitbelow = true
vim.o.splitright = true       -- Splits open bottom right
vim.opt.whichwrap:append('<,>,[,],~')    -- Move to following line on certain keys
-- }}}
-- Editor UI {{{
if vim.fn.has("termguicolors") then
    vim.o.termguicolors = true       -- Enable true color
end
vim.o.fcs = 'eob: '           -- hide ~ tilde
vim.o.laststatus = 3      -- only show one status line
vim.o.list = true
vim.o.number = true             -- Show number
vim.o.pumheight  =  12 -- max popup menu height
vim.o.scrolloff = 5         -- Keep at least 2 lines above/below
vim.o.showmode = false         -- Don't show mode on bottom
vim.o.title = true
vim.o.titlelen = 95 -- Title length.
vim.o.titlestring = '%t'
vim.opt.listchars = {tab='┆ ',nbsp='+',trail='·',extends='→',precedes='←',eol=''}
vim.o.signcolumn = 'yes:1'
-- }}}
