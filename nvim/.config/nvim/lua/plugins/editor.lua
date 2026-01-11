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
  {
    {
      "abecodes/tabout.nvim",
      lazy = false,
      config = function()
        require("tabout").setup({
          tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        })
      end,
    },
  },

  -- base64 encode/decode
  {
    "ovk/endec.nvim",
    lazy=true,
    opts = {
      keymaps = {
        defaults = false,
      },
      popup = {
        enter = true,
        transparency = 10,
        close_on = { "<Esc>", "q", "<C-c>" },
      },
    },
    keys = {
      {
        "bid",
        function()
          require("endec").vdecode("base64", true)
        end,
        mode = "v",
        desc = "base64 encode",
      },
      {
        "bie",
        function()
          require("endec").vencode("base64")
        end,
        mode = "v",
        desc = "base64 encode",
      },
    },
  },
}
