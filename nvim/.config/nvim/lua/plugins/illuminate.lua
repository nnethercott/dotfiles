return {
  "RRethy/vim-illuminate",
  enabled = true,
  config = function()
    require('illuminate').configure({
      -- providers: provider used to get references in the buffer, ordered by priority
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      delay = 100,
      min_count_to_highlight = 2, -- 2 or more to highlight
      large_file_overrides = nil, -- disable vim-illuminate for large files
    })
  end
}
