return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async'
  },
  -- TODO: add stuff here to stylize collapsed view
  config = function()
    vim.o.foldcolumn = '0'  -- no symbols in column
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99 -- start with no folds
    vim.o.foldenable = true
    vim.o.foldtext = ""

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    -- Option 3: treesitter as a main provider instead
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    })
  end
}
