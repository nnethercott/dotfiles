return {
  -- blink.cmp
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- preset = "enter",
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ['<C-n>'] = { 'snippet_forward', 'fallback' },
        ['<C-o>'] = { 'snippet_backward', 'fallback' },
      },
    },
  },
}
