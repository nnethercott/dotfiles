return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
        -- todo
      }

      --
      vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>Trouble lsp_references<cr>", { noremap = true, silent = true })
    end
  }
