return {
  -- Conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
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

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    --cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = function()
      --vim.g.nvim_tree_respect_buf_cwd = 1

      require "configs.nvim-tree"
    end,
  },
  -- Coc
  {
    "neoclide/coc.nvim",
    branch = "release",
  },
  -- Telescope
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
  -- FZF-lua
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Biểu tượng đẹp hơn
    config = function()
      require "configs.fzf-lua"
    end,
  },
  -- Spectre
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Cần thiết để plugin hoạt động
    config = function()
      require("spectre").setup() {}
    end,
  },
  --{
  --  "preservim/nerdtree",
  --  cmd = { "NERDTreeToggle", "NERDTreeFind" },
  --},
}
