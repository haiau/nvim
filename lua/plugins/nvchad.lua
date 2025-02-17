return {
  "nvim-lua/plenary.nvim",

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },

  {
    "nvchad/base46",
    lazy = false, -- Load ngay khi khởi động
    -- priority = 1000, -- Load trước các plugin khác
    config = function()
      require("base46").load_all_highlights()
    end,
  },

  "nvchad/volt", -- optional, needed for theme switcher
}
