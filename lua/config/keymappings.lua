local keymap = vim.keymap.set
local nomap = vim.keymap.del
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 compatibility

-- Fix moving forward in jumplist via <C-i>
keymap("n", "<C-I>", "<C-I>", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":lua Snacks.bufdelete()<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd([[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]])

-- Quickfix
keymap("n", "<Leader>,", ":cp<CR>", silent)
keymap("n", "<Leader>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
  silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", silent)
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>cf", "<cmd>lua require('config.lsp.functions').format()<CR>", silent)
keymap("v", "<leader>cf", function()
  local start_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, ">"))

  vim.lsp.buf.format({
    range = {
      ["start"] = { start_row, 0 },
      ["end"] = { end_row, 0 },
    },
    async = true,
  })
end, silent)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

-- Adjust font size
keymap("n", "<M-=>", function() require('utils').adjust_font_size(1) end, silent)
keymap("n", "<M-->", function() require('utils').adjust_font_size(-1) end, silent)

-- LazyGit
keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", silent)
vim.keymap.set("n", "<leader>glc", function()
  local file = vim.fn.expand("%:p") -- Lấy đường dẫn tuyệt đối của file hiện tại
  vim.cmd("tabnew")                 -- Mở tab mới (có thể bỏ nếu không cần)
  vim.cmd("term lazygit log -- " .. file)
end, { noremap = true, silent = true, desc = "Lazygit current file history" })

-- Kulala
keymap(
  "n",
  "<leader>kr",
  "<cmd>lua require('kulala').run()<cr>",
  { noremap = true, silent = true, desc = "Execute the request" }
)
keymap(
  "n",
  "[",
  "<cmd>lua require('kulala').jump_prev()<cr>",
  { noremap = true, silent = true, desc = "Jump to the previous request" }
)
keymap(
  "n",
  "]",
  "<cmd>lua require('kulala').jump_next()<cr>",
  { noremap = true, silent = true, desc = "Jump to the next request" }
)
keymap(
  "n",
  "<leader>ki",
  "<cmd>lua require('kulala').inspect()<cr>",
  { noremap = true, silent = true, desc = "Inspect the current request" }
)
keymap(
  "n",
  "<leader>kt",
  "<cmd>lua require('kulala').toggle_view()<cr>",
  { noremap = true, silent = true, desc = "Toggle between body and headers" }
)
keymap(
  "n",
  "<leader>kc",
  "<cmd>lua require('kulala').copy()<cr>",
  { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
)
keymap(
  "n",
  "<leader>kp",
  "<cmd>lua require('kulala').from_curl()<cr>",
  { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
)

-- TERMINAL
-- 🚀 ToggleTerm (Dễ quản lý terminal)
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Mở terminal popup" })
keymap("n", "<leader>tn", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Mở terminal ngang" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Mở terminal dọc" })
-- 🌟 Terminal Mode của Neovim
keymap("n", "<leader>tt", ":45vs | term<CR>", { desc = "Mở terminal (cửa sổ dọc)" })
keymap("n", "<leader>th", ":split | term<CR>", { desc = "Mở terminal (cửa sổ ngang)" })


-- 🏃 Thoát nhanh khỏi Terminal Mode
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Thoát chế độ terminal" })

-- Go to definition & implementation
keymap("n", "<leader>wd", "<cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true, desc = "  Go to definition" })
keymap("n", "<leader>ww", "<cmd>lua vim.lsp.buf.implementation()<CR>",
  { noremap = true, silent = true, desc = "  Go to implementation" })
keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.references()<CR>",
  { noremap = true, silent = true, desc = "󰈞  Find references" })

-- Theme
keymap("n", "<leader>ts", function()
  require("nvchad.themes").open()
end, { desc = "Select themes" })

-- Telescope
keymap("n", "<leader>sa", require("telescope").extensions.live_grep_args.live_grep_args,
  { noremap = true, desc = "Tìm nội dung bằng live grep args" })
