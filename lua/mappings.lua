require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Spectre
vim.keymap.set("n", "<leader>sr", "<cmd>lua require('spectre').open()<CR>", { desc = "Mở Spectre" })
vim.keymap.set(
  "n",
  "<leader>sw",
  "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
  { desc = "Tìm từ đang chọn" }
)
vim.keymap.set("v", "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", { desc = "Tìm trong vùng chọn" })
vim.keymap.set(
  "n",
  "<leader>sp",
  "<cmd>lua require('spectre').open_file_search()<CR>",
  { desc = "Tìm kiếm trong file hiện tại" }
)
vim.keymap.set("n", "<leader>st", function()
  require("spectre").open { cwd = vim.fn.expand "%:p:h" }
end, { desc = "Mở Spectre trong thư mục của file hiện tại" })

-- fzf-lua
local fzf = require "fzf-lua"

vim.keymap.set("n", "<leader>zz", fzf.files, { desc = "Tìm file" })
vim.keymap.set("n", "<leader>zg", fzf.live_grep, { desc = "Tìm nội dung trong file" })
vim.keymap.set("n", "<leader>zb", fzf.buffers, { desc = "Danh sách buffer" })
vim.keymap.set("n", "<leader>zh", fzf.help_tags, { desc = "Tìm trong help" })
vim.keymap.set("n", "<leader>zr", fzf.oldfiles, { desc = "Tìm file đã mở gần đây" })
vim.api.nvim_set_keymap("n", "<F3>", ':lua require("fzf-lua").files()<CR>', { noremap = true, silent = true })

-- telescope
vim.keymap.set(
  "n",
  "<leader>fs",
  require("telescope").extensions.live_grep_args.live_grep_args,
  { noremap = true, desc = "Tìm nội dung bằng live grep args" }
)

-- grug-far
--
vim.keymap.set(
  "n",
  "<leader>fr",
  require("muren.api").toggle_ui,
  { noremap = true, silent = true, desc = "Tìm & thay thế với muren" }
)

-- vim-rest-console
vim.keymap.set("n", "<leader>rr", ":call VrcQuery()<CR>", { desc = "Send HTTP request" })
vim.keymap.set("n", "<leader>rh", ":call VrcQuery('HEAD')<CR>", { desc = "Send HEAD request" })
vim.keymap.set("n", "<leader>rp", ":call VrcQuery('POST')<CR>", { desc = "Send POST request" })

--- kulala
vim.keymap.set(
  "n",
  "<leader>kr",
  "<cmd>lua require('kulala').run()<cr>",
  { noremap = true, silent = true, desc = "Execute the request" }
)
vim.keymap.set(
  "n",
  "[",
  "<cmd>lua require('kulala').jump_prev()<cr>",
  { noremap = true, silent = true, desc = "Jump to the previous request" }
)
vim.keymap.set(
  "n",
  "]",
  "<cmd>lua require('kulala').jump_next()<cr>",
  { noremap = true, silent = true, desc = "Jump to the next request" }
)
vim.keymap.set(
  "n",
  "<leader>ki",
  "<cmd>lua require('kulala').inspect()<cr>",
  { noremap = true, silent = true, desc = "Inspect the current request" }
)
vim.keymap.set(
  "n",
  "<leader>kt",
  "<cmd>lua require('kulala').toggle_view()<cr>",
  { noremap = true, silent = true, desc = "Toggle between body and headers" }
)
vim.keymap.set(
  "n",
  "<leader>kc",
  "<cmd>lua require('kulala').copy()<cr>",
  { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
)
vim.keymap.set(
  "n",
  "<leader>kp",
  "<cmd>lua require('kulala').from_curl()<cr>",
  { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
)
