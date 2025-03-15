-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",
  hl_override = {
    Keyword = { italic = true },      -- Đổi màu và kiểu chữ cho keywords
    ["@keyword"] = { italic = true }, -- Treesitter keywords
    ["@keyword.function"] = { italic = true },
    ["@keyword.return"] = { italic = true },
    -- ["@keyword.operator"] = { italic = true },
    Function = { italic = false },      -- Đổi màu và kiểu chữ cho functions
    ["@function"] = { italic = false }, -- Treesitter functions
    Conditional = { italic = true },    -- if else
    Repeat = { italic = true },         -- for loop

    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Type = { italic = true },
    ["@type"] = { italic = true },

    Method = { bold = true, italic = false },
    ["@method"] = { bold = true, italic = false },
    -- ["@property"] = { bold = true },
    -- ["@field"] = { bold = true },
    -- ["@variable.builtin"] = { bold = true },
    -- ["@variable"] = { bold = true },


  },


}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    enabled = false,
    -- lazyload = true,
    -- order = { "treeOffset", "buffers", "tabs", "btns" },
    -- modules = nil,
    -- bufwidth = 21,
    -- tabline = true,          -- Hiển thị tabline
    -- closable = true,         -- Cho phép đóng tab
    -- show_numbers = true,     -- Hiển thị số tab
    -- show_tabs_always = true, -- Luôn luôn hiển thị tabline, ngay cả khi chỉ có một tab
  }
}

M.cmp = {
  icons_left = false, -- only for non-atom styles!
  style = "default",  -- default/flat_light/flat_dark/atom/atom_colored
  abbr_maxwidth = 60,
  format_colors = {
    tailwind = false, -- will work for css lsp too
    icon = "󱓻",
  },
}
--
-- M.telescope = { style = "borderless" } -- borderless / bordered

return M
