return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      require('fzf-lua').setup({
        'hide'
      })

      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>f", ":FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<leader>fr", ":FzfLua oldfiles<cr>", { desc = "Fuzzy find old files" })
      keymap.set("n", "<leader>rg", ":FzfLua live_grep<cr>", { desc = "live grep" })

      -- lsp commands
      -- keymap.set({ "n" }, "gr", function()
      --   require('fzf-lua').lsp_references({
      --     previewer = false,
      --     -- preview = {},
      --     winopts = {
      --       height = 0.2, -- Set height (30% of screen)
      --       width = 1.0, -- Full width
      --       row = 1.0, -- Push to the bottom
      --       border = "none",
      --       backdrop = 100,
      --     }
      --   })
      -- end, { desc = "LSP references at bottom without preview" })
    end
  }
}
