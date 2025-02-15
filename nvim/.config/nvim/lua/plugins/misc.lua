return {
  -- visualize colours
  {
    "norcalli/nvim-colorizer.lua",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require('colorizer').setup()
    end
  },
  --
  -- highlight word under cursor
  {
    "RRethy/vim-illuminate",
    enabled = true,
    event = { "BufEnter" },
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
  },
  -- leap nvim
  {
    "ggandor/leap.nvim",
    enabled = true,
    event = { "BufEnter" },
    config = function()
      require('leap').create_default_mappings()

      -- above should be equivalent to this
      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    end
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
}
