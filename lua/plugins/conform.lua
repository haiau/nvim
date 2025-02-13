return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "BufWritePre", -- uncomment for format on save
    opts = require "config.conform",
}
