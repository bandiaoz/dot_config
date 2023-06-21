vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank({higroup="IncSearch", timeout=250})
    end
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost key_maps.lua source <afile>
  augroup end
]])
