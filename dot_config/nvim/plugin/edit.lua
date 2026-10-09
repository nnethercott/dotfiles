vim.pack.add({
  "https://codeberg.org/andyg/leap.nvim",
  "https://github.com/kevinhwang91/nvim-bqf",
  "https://github.com/ovk/endec.nvim",
  "https://github.com/szw/vim-maximizer",
  "https://github.com/serhez/bento.nvim",
})

-- leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")

-- quickfix
require("bqf").setup({
  ---@diagnostic disable-next-line: missing-fields
  preview = {
    auto_preview = false,
  },
})

-- split maximizer
vim.keymap.set("n", "<leader>w", ":MaximizerToggle<CR>", { desc = "maximize current split" })

-- base64
require("endec").setup({
  keymaps = {
    defaults = false,
  },
  popup = {
    enter = true,
    transparency = 10,
    close_on = { "<Esc>", "q", "<C-c>" },
  },
})
vim.keymap.set("v", "bie", function()
  require("endec").vencode("base64")
end, { desc = "base64 encode" })
vim.keymap.set("v", "bid", function()
  require("endec").vdecode("base64", true)
end, { desc = "base64 encode" })

-- buffers
require("bento").setup({
  max_open_buffers = 8,
  lock_char = "*",
  buffer_deletion_metric = "frecency_access",
  buffer_notify_on_delete = false,
  ordering_metric = "access",
  ui = {
    mode = "floating",
    floating = {
      minimal_menu = nil,
      position = "top-right",
      -- offset_y = -4,
      border = "none",
    },
  },
})

local bento_api = require("bento.api")
bento_api.register_expand_key(";")
bento_api.register_last_buffer_key(";")
bento_api.register_action("open", { key = "<CR>", action = bento_api.actions.open })
bento_api.set_default_action("open")

vim.keymap.set("n", "<leader>ba", function()
  bento_api.close_all_buffers({ locked = false, current = false })
end, { desc = "Close other unlocked buffers" })
