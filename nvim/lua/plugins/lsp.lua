--
-- -- Setup language servers.
-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup {
-- 	settings = {
-- 	    pyright = {
-- 	      -- Using Ruff's import organizer
-- 	      disableOrganizeImports = true,
-- 	    },
-- 	    python = {
-- 	      analysis = {
-- 	        -- Ignore all files for analysis to exclusively use Ruff for linting
-- 	        ignore = { '*' },
-- 	        },
-- 		},
-- 	},	
-- }
-- -- -- Настройка pylsp для Python (дополнительный сервер)
-- -- lspconfig.pylsp.setup {
-- --   settings = {
-- --     pylsp = {
-- --       plugins = {
-- --         pyflakes = { enabled = true },
-- --         pylint = { enabled = true },
-- --         pycodestyle = { enabled = true },
-- --         -- Другие настройки
-- --       }
-- --     }
-- --   }
-- -- }
--
-- lspconfig.tsserver.setup({})
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }
--
-- -- Setup Ruff Linter
-- lspconfig.ruff_lsp.setup {
--   init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {
-- 		"--select=E,F,UP,N,I,ASYNC,S,PTH",
-- 		"--line-length=79",
-- 		"--respect-gitignore",  -- Исключать из сканирования файлы в .gitignore
--       	"--target-version=py311"
--       },
--     }
--   }
-- }
--
-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--
-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'lD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'ld', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'lk', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'li', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     
--     -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     -- vim.keymap.set('n', '<space>wl', function()
--     --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     -- end, opts)
--     
--     -- TODO: Используется повторно, необходимо вырезать в след.версии
--     -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>r', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
	settings = {
	    pyright = {
	      -- Using Ruff's import organizer
	      disableOrganizeImports = true,
	    },
	    python = {
	      analysis = {
	        -- Ignore all files for analysis to exclusively use Ruff for linting
	        ignore = { '*' },
	        },
		},
	},	
}

lspconfig.tsserver.setup({})
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

-- Setup Ruff Linter
lspconfig.ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {
		"--select=E,F,UP,N,I,ASYNC,S,PTH",
		"--line-length=79",
		"--respect-gitignore",  -- Исключать из сканирования файлы в .gitignore
      	"--target-version=py311"
      },
    }
  }
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Enable mouse support for easy Ctrl+Click navigation
vim.opt.mouse = 'a'

-- Define a function to handle Ctrl+Click navigation
function _G.goto_definition()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, result)
    if not result or vim.tbl_isempty(result) then
      print("Definition not found")
      return
    end
    vim.lsp.util.jump_to_location(result[1])
  end)
end

-- Set up Ctrl+Click for normal mode
vim.api.nvim_set_keymap('n', '<C-LeftMouse>', '<cmd>lua goto_definition()<CR>', { noremap = true, silent = true })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'lD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'ld', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'lk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'li', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    
    -- TODO: Используется повторно, необходимо вырезать в след.версии
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>r', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
