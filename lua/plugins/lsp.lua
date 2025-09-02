-- LSP Setup
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.pyright.setup {}
lspconfig.clangd.setup {}
lspconfig.cmake.setup {}
lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}
lspconfig.digestif.setup {}
lspconfig.bashls.setup {}
lspconfig.marksman.setup {}
lspconfig.ts_ls.setup {}

vim.diagnostic.config({
  virtual_text = true, -- Оставляет короткий текст рядом с ошибкой
  signs = true,        -- Показывает значки в gutter
  update_in_insert = false, -- Не обновлять диагностики в режиме вставки
  float = {
    focusable = false,
    style = "minimal",
    border = "single",
    source = true,
    header = "",
    prefix = "",
  },
})

-- Mappings
local opts = { noremap=true, silent=true }

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, opts)



-- Убедитесь, что у вас есть это для отображения при наведении:
-- Если у вас нет маппинга для 'K' (или другой клавиши) для показа документации/диагностики
-- Добавьте что-то вроде этого в вашем конфиге:
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
-- Или для более специфичного отображения диагностики:
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

