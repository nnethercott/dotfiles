return {
  { "folke/trouble.nvim", enabled = false }, -- TODO: read docs
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
      },
    },
  },
}
