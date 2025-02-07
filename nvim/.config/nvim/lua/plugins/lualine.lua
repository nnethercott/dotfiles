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
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },

        -- show buffers at top of screen
        tabline = {
          lualine_a = {'buffers'},
        }
      }
    end
  },
}
