vim.o.spell = true
vim.o.spelllang = "en_us,cjk"
local map = require'key_maps'.map;
map('n', '<Leader>e', '<cmd>VimtexErrors<CR><C-W>k')
