return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
        side = "left",
        number = false,
        relativenumber = false,
      },
      renderer = {
        highlight_opened_files = "name",
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
        indent_markers = {
          enable = true, -- Hiển thị dấu thụt lề (│)
        },
      },
      update_focused_file = {
        enable = true, -- Bật chế độ focus
        update_root = true,
        ignore_list = {},
      },
    })
  end,
}
