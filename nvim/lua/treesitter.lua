require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "java", "c", "cpp", "rust", "bash", "css", "latex", "html", "toml", "yaml", "markdown", "help" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "javascript" }
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ["<leader>a"] = "@parameter.inner",
    --   },
    --   swap_previous = {
    --     ["<leader>A"] = "@parameter.inner",
    --   },
    -- },
  },
}

