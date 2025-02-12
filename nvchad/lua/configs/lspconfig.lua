-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- Tự động thiết lập LSP với `mason-lspconfig`
require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Tích hợp với nvim-cmp
    })
  end,
})

-- Cấu hình riêng cho Lua LSP
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Không báo lỗi khi dùng `vim`
      },
    },
  },
})


-- EXAMPLE
-- local servers = {
--   "lua_ls",
--   "html",
--   "cssls",
--   "gopls",
--   "vtsls",
-- }
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
