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
}
