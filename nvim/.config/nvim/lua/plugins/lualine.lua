return {
  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('lualine').setup {
        options = {
          theme = 'auto', -- uses colorscheme
          icons_enabled = true,
          section_separators = { left = '', right = ''},
          component_separators = { left = '', right = ''}, -- │
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = { {
            'filename',
            path = 1,
            shorting_target = 40,
          }},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },

        -- show buffers at top of screen
        -- tabline = {
        --   lualine_a = {'buffers'},
        -- }
      }
    end
  },
  {
    'romgrk/barbar.nvim',
    enabled = true,
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
      require("barbar").setup({
        animation = true,
        insert_at_end = true,
        icons = {
          pinned = {button = '󰐃', filename = true},
        }
      })
      vim.keymap.set('n', '<S-l>', ':bnext<CR>', { noremap = true })     -- remap :bnext
      vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { noremap = true }) -- remap :bprev
    end
  },
}
