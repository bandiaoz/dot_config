-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()
--
function Get_color_mode()
  local res = vim.fn.system([[defaults read -g AppleInterfaceStyle 2>/dev/null]])
  if res == 'Dark\n' then return 'dark' end
  return 'light'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim' -- optimize loading time using cache
  -- Apperance {{{
  use {
    'folke/tokyonight.nvim',
    config = function()
        require'tokyonight'.setup({
            style = 'storm',
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
            },
        })
        if Get_color_mode() == 'dark' then
          vim.o.background='dark'
          vim.cmd[[colorscheme tokyonight]]
        else
          vim.o.background='light'
          vim.cmd[[colorscheme tokyonight]]
        end
    end
  }
  use {
    'thallium/nordic.nvim',
    -- '~/programming/nordic.nvim',
    branch = 'thallium',
    config = function()
        vim.g.nord_underline_option = 'underline'
        vim.g.nord_italic = false
        vim.g.nord_italic_comments = false
        vim.g.nord_minimal_mode = false
        vim.g.nord_alternate_backgrounds = false
    end
  }
  use {
    'Th3Whit3Wolf/one-nvim',
  }
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require 'icons' end
  }
  use {
    'cormacrelf/dark-notify',
    config = function ()
        require('dark_notify').run()
    end
  }
  --}}}

  -- Program{{{
  use {
    'nvim-lua/popup.nvim',
  }
  use {
    'mcchrish/nnn.vim',
    cmd = 'NnnPicker',
    config=function()
      vim.g['nnn#layout']={left='~35%'}
      vim.g['nnn#command']='nnn -e'
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = function() require'my_telescope' end
  }
  use {
    'mfussenegger/nvim-dap',
    config = function() require'dap-config' end
  }
  --}}}
  -- Enhance{{{
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
    cmd = {'HopChar2'}
  }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
        require('nvim-autopairs').setup{}
        require('my_autopairs')
    end
  }

  use {
      "akinsho/toggleterm.nvim",
      tag = 'v2.*',
      config = function () require'toggleterm_config' end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  }
  use {
      "L3MON4D3/LuaSnip",
      tag = "v1.*",
      config = function()
        require("luasnip").setup({
            enable_autosnippets = true,
        })
        require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})
      end
  }
  use {
      'norcalli/nvim-colorizer.lua',
      config = function ()
          require'colorizer'.setup({
              yaml = { names=false },
              javascript = { names=false },
              conf = { names=false },
              kitty = { hsl_fn = true, names = false }
          })
      end

  }
  use {
    'romgrk/barbar.nvim',
    config = function () require 'barbar_config' end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function () require'lualine_config' end
  }
  use {
    'windwp/nvim-spectre',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  use {
    'ThePrimeagen/harpoon',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  use {
      'f-person/git-blame.nvim'
  }
  use {
      'RRethy/vim-illuminate', -- highlight word under cursor
      config = function()
          require('illuminate').configure({
            -- providers: provider used to get references in the buffer, ordered by priority
            providers = {
                'treesitter',
                'lsp',
                'regex',
            },
            filetypes_denylist = {
                'toggleterm',
            }
        })
      end
  }
  --}}}

    -- nvim-cmp{{{
    use {
        'hrsh7th/nvim-cmp',
        config = function() require'nvim-cmp-config' end
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-omni',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip'
    }
    --}}}
  -- Language {{{
  use { 'cespare/vim-toml', ft = 'toml' }
  use { 'bfrg/vim-cpp-modern', ft = { 'c','cpp' } }
  use { 'arzg/vim-sh', ft= { 'sh','zsh' } }
  use { 'fatih/vim-go', ft = {'go','gomod'} }
  use {
    'lervag/vimtex',
    ft = {'tex'},
    setup = function ()
      vim.g.vimtex_view_method='skim'
    end,
  }
  use {
    'iamcco/markdown-preview.nvim',
    ft={'markdown', 'md'},
    run = "cd app && yarn install",
    cmd = 'MarkdownPreview',
    setup = function () vim.g.mkdp_auto_close = false end
  }
  use {
      'imsnif/kdl.vim'
  }
  --}}}

  -- LSP/treesitter {{{
  use {
      'neovim/nvim-lspconfig',
      config = function() require 'lsp' end
  }
  use { 'ray-x/lsp_signature.nvim' }
  use {
    'glepnir/lspsaga.nvim',
    disable = true,
    config = function ()
      require'lspsaga'.init_lsp_saga({
        use_saga_diagnostic_sign = false
      })
    end
  }

  -- use {
  --   'ray-x/navigator.lua',
  --   requires = {
  --     'ray-x/guihua.lua',
  --     run = 'cd lua/fzy && make'
  --   },
  --   config = function ()
  --     require'navigator'.setup({
  --       icons = {
  --         icons = false
  --       }
  --     })
  --   end
  -- }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require'treesitter' end
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
  }
  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup({
        on_attach = function(bufnr)
            -- Toggle the aerial window with <leader>a
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
            -- Jump forwards/backwards with '{' and '}'
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
            -- Jump up the tree with '[[' or ']]'
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
        end
    }) end
  }
  --}}}
  -- Project {{{
  use {
    'windwp/nvim-projectconfig',
    config = function()
        if vim.fn.filereadable(vim.fn.expand('~/.config/nvim/lua/custom.lua')) ~= 0 then
            require('nvim-projectconfig').setup({
                project_config = require'custom'.project_config
            })
        end
    end
  }
  --}}}
end)
