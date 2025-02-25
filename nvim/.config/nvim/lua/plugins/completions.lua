return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "enter",
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
      },
      -- disable completions for command line
      cmdline = { enabled = false },
      completion = {
        ghost_text = {enabled = false},
      },
      signature = {enabled = false},
    },
    opts_extend = { "sources.default" }
  }
}
