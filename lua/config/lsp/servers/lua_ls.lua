local M = {}

M.settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim', 'bit', 'packer_plugins' }
    },
    hint = { enable = false},
  }
}

return M
