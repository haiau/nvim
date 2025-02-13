require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Spectre
map("n", "<leader>sr", "<cmd>lua require('spectre').open()<CR>", { desc = "Mở Spectre" })
map("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
  { desc = "Tìm từ đang chọn" })
map("v", "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", { desc = "Tìm trong vùng chọn" })
map("n", "<leader>sp", "<cmd>lua require('spectre').open_file_search()<CR>",
  { desc = "Tìm kiếm trong file hiện tại" })
map("n", "<leader>st", function()
  require("spectre").open { cwd = vim.fn.expand "%:p:h" }
end, { desc = "Mở Spectre trong thư mục của file hiện tại" })

-- fzf-lua
local fzf = require "fzf-lua"

map("n", "<leader>zz", fzf.files, { desc = "Tìm file" })
map("n", "<leader>zg", fzf.live_grep, { desc = "Tìm nội dung trong file" })
map("n", "<leader>zb", fzf.buffers, { desc = "Danh sách buffer" })
map("n", "<leader>zh", fzf.help_tags, { desc = "Tìm trong help" })
map("n", "<leader>zr", fzf.oldfiles, { desc = "Tìm file đã mở gần đây" })
vim.api.nvim_set_keymap("n", "<F3>", ':lua require("fzf-lua").files()<CR>', { noremap = true, silent = true })

-- telescope
map("n", "<leader>fs", require("telescope").extensions.live_grep_args.live_grep_args,
  { noremap = true, desc = "Tìm nội dung bằng live grep args" })

-- grug-far
map("n", "<leader>fr", require("muren.api").toggle_ui,
  { noremap = true, silent = true, desc = "Tìm & thay thế với muren" })

--- kulala
-- map(
--   "n",
--   "<leader>kr",
--   "<cmd>lua require('kulala').run()<cr>",
--   { noremap = true, silent = true, desc = "Execute the request" }
-- )
-- map(
--   "n",
--   "[",
--   "<cmd>lua require('kulala').jump_prev()<cr>",
--   { noremap = true, silent = true, desc = "Jump to the previous request" }
-- )
-- map(
--   "n",
--   "]",
--   "<cmd>lua require('kulala').jump_next()<cr>",
--   { noremap = true, silent = true, desc = "Jump to the next request" }
-- )
-- map(
--   "n",
--   "<leader>ki",
--   "<cmd>lua require('kulala').inspect()<cr>",
--   { noremap = true, silent = true, desc = "Inspect the current request" }
-- )
-- map(
--   "n",
--   "<leader>kt",
--   "<cmd>lua require('kulala').toggle_view()<cr>",
--   { noremap = true, silent = true, desc = "Toggle between body and headers" }
-- )
-- map(
--   "n",
--   "<leader>kc",
--   "<cmd>lua require('kulala').copy()<cr>",
--   { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
-- )
-- map(
--   "n",
--   "<leader>kp",
--   "<cmd>lua require('kulala').from_curl()<cr>",
--   { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
-- )


-- Go to definition & implementation
map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true, desc = "  Go to definition" })
map("n", "<leader>gg", "<cmd>lua vim.lsp.buf.implementation()<CR>",
  { noremap = true, silent = true, desc = "  Go to implementation" })
map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>",
  { noremap = true, silent = true, desc = "󰈞  Find references" })
map("n", "<leader>gb", "<C-o>", { noremap = true, silent = true, desc = "󰌍  Go back" })

-- local wk = require("which-key")
--
-- wk.register({
--     k = {
--       name = "Kulala - HTTP Request", -- Tiêu đề hiển thị khi nhấn <leader>k
--       r = { "<cmd>lua require('kulala').run()<cr>", "Execute the request" },
--       i = { "<cmd>lua require('kulala').inspect()<cr>", "Inspect the current request" },
--       t = { "<cmd>lua require('kulala').toggle_view()<cr>", "Toggle body/headers view" },
--       c = { "<cmd>lua require('kulala').copy()<cr>", "Copy as curl" },
--       p = { "<cmd>lua require('kulala').from_curl()<cr>", "Paste curl as request" },
--       ["["] = { "<cmd>lua require('kulala').jump_prev()<cr>", "Jump to previous request" },
--       ["]"] = { "<cmd>lua require('kulala').jump_next()<cr>", "Jump to next request" },
--     },
-- }, { prefix = "<leader>", mode = "n" })


local wk = require("which-key")
wk.register({
  k = {
    name = "Kulala - HTTP Request", -- Tiêu đề cho nhóm phím tắt này
    r = { "<cmd>lua require('kulala').run()<cr>", "Execute the request" },
    i = { "<cmd>lua require('kulala').inspect()<cr>", "Inspect the current request" },
    t = { "<cmd>lua require('kulala').toggle_view()<cr>", "Toggle body/headers view" },
    c = { "<cmd>lua require('kulala').copy()<cr>", "Copy as curl" },
    p = { "<cmd>lua require('kulala').from_curl()<cr>", "Paste curl as request" },
    ["["] = { "<cmd>lua require('kulala').jump_prev()<cr>", "Jump to previous request" },
    ["]"] = { "<cmd>lua require('kulala').jump_next()<cr>", "Jump to next request" },
  },
}, { prefix = "<leader>" }) -- Hiển thị mô tả khi nhấn <leader>k

