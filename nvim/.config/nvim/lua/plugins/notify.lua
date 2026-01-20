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
    end,
  },
  {
    "rcarriga/nvim-notify",
    enabled = true,
    opts = function()
      local notify = require("notify")

      vim.notify = function(msg, level, opts)
        -- Ignore notifications from bento.nvim
        if opts and opts.title and opts.title:match("Buffer Manager") then
          return
        end
        notify(msg, level, opts)
      end

      notify.setup({
        render = "compact",
        stages = "static",
        timeout = 3000,
        merge_duplicates = true,
      })
    end,
  },
}
