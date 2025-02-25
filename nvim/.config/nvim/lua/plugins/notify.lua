return {
  -- stuff like cargo build prog
  {
    "j-hui/fidget.nvim",
    enabled = true,
    config = function()
      require("fidget").setup({
        notification = {
          window = {
            winblend = 0, -- transparent
          },
        },
      })
    end
  },
  {
    "rcarriga/nvim-notify",
    enabled = true,
    config = function()
      local notify = require("notify")
      vim.notify = notify
      notify.setup({
        render = "compact",
        stages = "static",
        timeout = 3000,
      })
    end
  }
}
