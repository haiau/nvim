local options = {
  -- Cài parser cần dùng
  ensure_installed = {
    "bash",
    "fish",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "lua",
    "luadoc",
    "markdown",
    "printf",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
  },

  -- Bật tô màu cú pháp
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  -- Bật auto-indent
  indent = { enable = true },

  -- Chọn code thông minh
  incremental_selection = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

