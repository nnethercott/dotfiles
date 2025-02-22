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
          symbols = {
            icon_source = "lspkind", -- match with our nvim-cmp
          }
        }
      }
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
    enabled = false,
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = {
          enabled = true
        },
        sign = {enabled = true,},
        virtual_text = {enabled = false,},
        float = {enabled = false,},
      })
    end
  },
}

-- kitty protocol for in terminal image viewing
-- https://github.com/edluffy/hologram.nvim
