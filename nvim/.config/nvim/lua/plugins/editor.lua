return {
  -- illuminate
  { "RRethy/vim-illuminate", enabled = false },

  -- leap
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").create_default_mappings()
    end,
  },

  -- maximize split
  {
    "szw/vim-maximizer",
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "<leader>w", ":MaximizerToggle<CR>")
    end,
  },
}
