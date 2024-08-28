
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	
	{ 'nvim-treesitter/nvim-treesitter',
        -- optional = true,
        -- opts = { ensure_installed = { "sql" } },
    },
	{ 'neovim/nvim-lspconfig' },



    -- {
    --   'stevearc/conform.nvim',
    --   opts = {},
    -- },




	-- Autocomplete support
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'williamboman/mason.nvim', 
    -- opts = { ensure_installed = { "sqlfluff" } },
    },
	-- { 'williamboman/mason-lspconfig.nvim' },

    {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
	  'nvimdev/dashboard-nvim',
	  event = 'VimEnter',
	  config = function()
	    require('dashboard').setup {
	      -- config
	    }
	  end,
	  dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

	{ 'Eandrju/cellular-automaton.nvim' },
	{ 'norcalli/nvim-colorizer.lua' },

	{
	    'nvim-lualine/lualine.nvim',
	    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  }
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{
	  "max397574/better-escape.nvim",
	  config = function()
  	    require("better_escape").setup({
  	    	-- mapping = {"jk"},
  	    	-- timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    	   --  clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    	   --  keys = "<Esc>",
  	    })
  	  end
	},
	{
	    'numToStr/Comment.nvim',
	    opts = {
	        -- add any options here
	    },
	    lazy = false,
	},

	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    require("nvim-tree").setup {}
	  end,
	},

	{
	    'dense-analysis/ale',
	    config = function()
	        -- Configuration goes here.
	        local g = vim.g
	
	        g.ale_linters = {
	        	python = {'mypy'},
	            lua = {'lua_language_server'}
	        }
	    end
	},

	{ 'RRethy/vim-illuminate' },

	-- {
	--     "vhyrro/luarocks.nvim",
	--     priority = 1001, -- this plugin needs to run before anything else
	--     opts = {
	--         rocks = { "magick" },
	--     },
	-- },

	{
	 "folke/trouble.nvim",
	 dependencies = { "nvim-tree/nvim-web-devicons" },
	 opts = {
	  -- your configuration comes here
	  -- or leave it empty to use the default settings
	  -- refer to the configuration section below
	 },
	},

	{'akinsho/toggleterm.nvim', version = "*", config = true},
	--
	-- {
	--   "folke/which-key.nvim",
	--   event = "VeryLazy",
	--   init = function()
	--     vim.o.timeout = true
	--     vim.o.timeoutlen = 300
	--   end,
	--   opts = {
	--     -- your configuration comes here
	--     -- or leave it empty to use the default settings
	--     -- refer to the configuration section below
	--   }
	-- },
    
     {
        "folke/which-key.nvim",
        enabled = true,
        opts = {
          preset = "helix",
          debug = false,
          win = {
            -- padding = { 0, 1 },
            -- border = "single",
            -- height = { max = 5 },
          },
          spec = {},
        },
      },

	-- {
	--       "folke/which-key.nvim",
	--       event = "VeryLazy",
	--       opts = {
	-- 	-- your configuration comes here
	-- 	-- or leave it empty to use the default settings
	-- 	-- refer to the configuration section below
	--       },
	-- },
	-- Выравнивание и перемещение текста
	-- Автоматическое открытие фигурных скобок, кавычек и т.д
	{ 'echasnovski/mini.nvim', version = false },
	{ 'echasnovski/mini.move', version = false },
	{ 'echasnovski/mini.pairs', version = false },
	{ 'echasnovski/mini.diff', version = false },

 --    -- Плагины для Markdown
	-- {
	--   'preservim/vim-markdown',
	--   dependencies = {
	--     'godlygeek/tabular'
	--   },
	--   ft = 'markdown'
	-- },

    -- { 'mhartington/sqlformatter.nvim' },
    -- Установка плагина ALE
    -- {
    --     'dense-analysis/ale',
    --     config = function()
    --         vim.g.ale_linters = {
    --             sql = {'sqlfluff'},
    --         }
    --         vim.g.ale_fixers = {
    --             sql = {'sqlfluff'},
    --         }
    --         vim.g.ale_sql_sqlfluff_executable = 'sqlfluff'
    --         vim.g.ale_sql_sqlfluff_options = '--dialect bigquery' -- Замените 'postgres' на ваш диалект SQL
    --     end,
    -- },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = {text = '│'},
                    change       = {text = '│'},
                    delete       = {text = '_'},
                    topdelete    = {text = '‾'},
                    changedelete = {text = '~'},
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Навигация по изменениям
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Предварительный просмотр диффов
                    map('n', '<leader>hp', gs.preview_hunk)
                end
            }

            -- Установите подсветку
            vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
            vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitGutterAddNr' })
            vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitGutterAddLn' })
            vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
            vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitGutterChangeNr' })
            vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitGutterChangeLn' })
            vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChange' })
            vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitGutterChangeNr' })
            vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitGutterChangeLn' })
            vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitGutterDeleteNr' })
            vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitGutterDeleteLn' })
            vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitGutterDeleteNr' })
            vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitGutterDeleteLn' })
        end
    },

})
