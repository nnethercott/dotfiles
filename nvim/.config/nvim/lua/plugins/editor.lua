return {
  -- illuminate
  { "RRethy/vim-illuminate", enabled = false },
  -- leap
  {
    "ggandor/leap.nvim",
    enabled = true,
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
    end,
  },
  -- maximize split
  {
    "szw/vim-maximizer",
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "<leader>w", ":MaximizerToggle<CR>")
    end,
  },

  -- autopairs
  -- {
  --   "windwp/nvim-autopairs",
  --   -- event = "InsertEnter",
  --   config = function()
  --     local npairs = require("nvim-autopairs")
  --     npairs.setup({})
  --     npairs.remove_rule("'")
  --   end,
  -- },

  -- Lua
  {
    {
      "abecodes/tabout.nvim",
      lazy = false,
      config = function()
        require("tabout").setup({
          tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
          enable_backwards = true, -- well ...
          tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
          },
          ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
          exclude = {}, -- tabout will ignore these filetypes
        })
      end,
    },
  },
}
