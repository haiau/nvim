-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "oxocarbon",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
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

-- M.cmp = {
--   icons_left = false, -- only for non-atom styles!
--   style = "default",  -- default/flat_light/flat_dark/atom/atom_colored
--   abbr_maxwidth = 60,
--   format_colors = {
--     tailwind = false, -- will work for css lsp too
--     icon = "󱓻",
--   },
-- }
--
-- M.telescope = { style = "borderless" } -- borderless / bordered

return M
