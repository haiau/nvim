-- put this in your main init.lua file ( before lazy setup )
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = true },
  -- install = { colorscheme = { "tokyonight" } },
  install = { colorscheme = { "nvchad" } },
  checker = { enabled = true },
  concurrency = 10,
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tutor",
        -- "zipPlugin",

        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
  debug = false,
  ui = {
    border = EcoVim.ui.float.border,
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  }
})

vim.keymap.set("n", "<leader>/l", "<cmd>:Lazy<cr>")

-- put this after lazy setup

-- (method 1, For heavy lazyloaders)
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
