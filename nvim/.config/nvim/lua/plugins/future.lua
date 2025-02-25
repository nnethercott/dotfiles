return {
  -- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
  {
    "hedyhli/outline.nvim",
    enabled = true,
    dependencies = {
      "onsails/lspkind.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
        outline_window = {
          position = 'right',
          show_cursorline = false,
          auto_close = true,
          symbols = {
            -- icon_source = "lspkind", -- match with our nvim-cmp
          }
        },
        outline_items = {
          auto_set_cursor = true,
        },

        symbol_folding = {
          auto_unfold = {
            hovered = false,
          },
        },
      }
    end,
  },
  {
    'chipsenkbeil/distant.nvim',
    -- same or worse experience than using sshfs
    enabled = false,
    branch = 'v0.3',
    config = function()
      require('distant'):setup({
        ['network.unix_socket'] = '/tmp/distant.sock',
      })
    end
  }
}

-- kitty protocol for in terminal image viewing
-- https://github.com/edluffy/hologram.nvim
