return {
  "ggandor/leap.nvim",
  enabled = true,
  config = function()
    require('leap').create_default_mappings()

    -- above should be equivalent to this
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
  end
}
