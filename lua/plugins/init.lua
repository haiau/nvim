return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "preservim/nerdtree",
    cmd = { "NERDTreeToggle", "NERDTreeFind" },
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },
  {

    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require "telescope"
      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<C-q>"] = require("telescope.actions").send_selected_to_qflist
                + require("telescope.actions").open_qflist,
            },
            n = {
              ["<C-q>"] = require("telescope.actions").send_selected_to_qflist
                + require("telescope.actions").open_qflist,
            },
          },
        },
      }
    end,
  },
  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },
  -- Codeium
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = "BufEnter",
    config = function()
      require "configs.codeium"
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Biểu tượng đẹp hơn
    config = function()
      require "configs.fzf-lua"
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Cần thiết để plugin hoạt động
    config = function()
      require("spectre").setup() {}
    end,
  },
}
