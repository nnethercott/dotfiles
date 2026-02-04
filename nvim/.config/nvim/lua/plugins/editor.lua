---@diagnostic disable: missing-fields
return {
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
  -- quickfix
  {
    "kevinhwang91/nvim-bqf",
    dependencies = { "junegunn/fzf", build = "./install --bin" },
    config = function()
      require("bqf").setup({
        preview = {
          auto_preview = false,
          -- win_vheight = 100,
          -- win_height = 100,
          -- winblend=0,
        }
      })
    end,
  },
  -- base64 encode/decode
  {
    "ovk/endec.nvim",
    lazy = true,
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
