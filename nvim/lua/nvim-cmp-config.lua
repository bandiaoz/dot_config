-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
    expand = function(args)
        -- For `luasnip` user.
        require'luasnip'.lsp_expand(args.body)
    end,
},
mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] =  function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
    ['<C-p>'] =  function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end
},
sources = {
    { name = 'nvim_lsp' },

    -- For ultisnips user.
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' }
}
})
