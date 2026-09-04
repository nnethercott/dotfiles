vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")

-- profile 1: top-center compact, no preview (file search)
local compact = {
  winopts = {
    width = 35,
    height = 12,
    row = 0,
    col = 0.5,
    backdrop = 100,
    border = "border-horizontal",
    preview = { hidden = true },
  },
  fzf_opts = { ["--layout"] = "reverse" },
  cwd_prompt = false,
  -- path_shorten = 1,
}

-- profile 2: centered with preview (default for everything else)
local default_winopts = {
  winopts = {
    width = 0.7,
    height = 0.7,
    backdrop = 100,
    preview = {
      hidden = false,
      layout = "flex",
      flip_columns = 90,
      vertical = "down:65%",
    },
  },
}

-- profile 3: cursor-relative, minimal (code actions)
local cursor = {
  winopts = {
    relative = "cursor",
    border = "none",
    backdrop = 100,
    width = 0.4,
    height = 0.15,
    row = 1,
    preview = { hidden = true },
  },
  fzf_opts = { ["--layout"] = "reverse" },
}

local opts = vim.tbl_deep_extend("force", require("fzf-lua.profiles.fzf-vim"), default_winopts, {
  grep = {
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden",
  },
  fzf_opts = {
    ["--cycle"] = true,
  },
  previewers = {
    builtin = {
      extensions = {
        ["svg"] = { "chafa", "{file}" },
      },
    },
  },
  -- open all filtered results in quickfix
  keymap = {
    fzf = {
      ["ctrl-l"] = "select-all+accept",
    },
  },
  lsp = {
    code_actions = cursor,
  },
})

fzf.setup(opts)
fzf.register_ui_select()

vim.keymap.set("n", "f", function() fzf.files(compact) end, { desc = "Find files" })
vim.keymap.set("n", "<leader>rg", "<cmd>FzfLua live_grep<cr>", { desc = "Ripgrep" })
vim.keymap.set("n", "<leader>gf", function() fzf.grep({ search = "" }) end, { desc = "Grep Files" })
vim.keymap.set("n", "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>a", ":FzfLua lsp_code_actions silent=true<CR>", { desc = "Code action" })
