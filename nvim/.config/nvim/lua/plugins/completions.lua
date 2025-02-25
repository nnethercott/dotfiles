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
      completion = {
        trigger = { show_in_snippet = false },
        list = { selection = { preselect = function(ctx) return not require('blink.cmp').snippet_active({ direction = 1 }) end } },
      },
      cmdline = {enabled=false},
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { "sources.default" }
  }
}
