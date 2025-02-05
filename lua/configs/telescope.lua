local telescope = require "telescope"
local lga_actions = require "telescope-live-grep-args.actions"

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist, -- Gửi kết quả vào quickfix
      },
      n = {
        ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist, -- Gửi kết quả vào quickfix
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          -- freeze the current list and start a fuzzy search in the frozen list
          ["<C-space>"] = lga_actions.to_fuzzy_refine,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
  },
}

-- then load the extension
telescope.load_extension "live_grep_args"
