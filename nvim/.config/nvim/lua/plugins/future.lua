return {
  -- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
  {
    "hedyhli/outline.nvim",
    enabled = false,
    dependencies = {
      "onsails/lspkind.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
        outline_window = {
          position = 'right',
          symbols = {
            -- icon_source = "lspkind", -- match with our nvim-cmp
          }
        }
      }
    end,
  },
}

-- kitty protocol for in terminal image viewing
-- https://github.com/edluffy/hologram.nvim
