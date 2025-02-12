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
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        -- Cài đặt LSP tự động:
        ensure_installed = {
          "biome",
          "lua_ls",
          "jsonls",
          "html",
          "cssls",
          "vtsls"
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- NvimTree
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   --cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  --   config = function()
  --     --vim.g.nvim_tree_respect_buf_cwd = 1
  --
  --     require "configs.nvim-tree"
  --   end,
  -- },
  -- Coc
  -- {
  --   "neoclide/coc.nvim",
  --   branch = "release",
  -- },
  -- Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },
  {

    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = function()
      require "configs.telescope"
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
  -- Find And Replace plugin for neovim
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup {
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
        -- engine = "astgrep",
      }
    end,
  },
  {
    "AckslD/muren.nvim",
    config = function()
      require "configs.muren"
    end,
  },
  {
    "diepm/vim-rest-console",
    config = function()
      vim.g.vrc_set_default_mapping = 0              -- Tắt keymap mặc định để tránh xung đột
      vim.g.vrc_curl_opts = "--connect-timeout 10"   -- Thêm tùy chọn cho cURL
      vim.g.vrc_output_buffer_name = "REST Response" -- Đặt tên buffer output
    end,
    event = "VeryLazy",
  },

  {
    "mistweaverco/kulala.nvim",
    opts = require "configs.kulala-config",
    event = "VeryLazy",
  },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    },
    event = "VeryLazy",
  },
  --[[
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
        require("rest-nvim").setup()
      end,
    },
  },

  {
    "preservim/nerdtree",
    cmd = { "NERDTreeToggle", "NERDTreeFind" },
  },
  ]]
  --
}
