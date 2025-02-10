return {
  "lewis6991/hover.nvim",
  enabled = true,
  config = function()
    local hover = require("hover")
    hover.setup({
      init = function()
        require("hover.providers.lsp")
      end,
      preview_opts = { border = 'rounded' },
      preview_window = true,
      title = false,
    })

    -- Setup keymaps
    vim.keymap.set("n", "<leader>d", hover.hover)
  end
}
