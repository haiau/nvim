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

local telescope = require "telescope.builtin"

-- Tìm kiếm và đưa vào Quickfix List
vim.keymap.set("n", "<leader>sg", function()
  telescope.live_grep {
    attach_mappings = function(_, tmap)
      tmap("i", "<C-q>", function(prompt_bufnr)
        require("telescope.actions").send_selected_to_qflist(prompt_bufnr)
        require("telescope.actions").open_qflist(prompt_bufnr)
      end)
      return true
    end,
  }
end, { desc = "Tìm kiếm với live_grep và gửi vào Quickfix" })

