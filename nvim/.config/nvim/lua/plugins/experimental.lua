return {
  {
    "dangooddd/pyrepl.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local pyrepl = require("pyrepl")

      -- Patch: avoid "Can't re-enter normal mode from terminal mode" in scroll_repl
      local core = require("pyrepl.core")
      core.scroll_repl = function()
        if core.state and core.state.win and vim.api.nvim_win_is_valid(core.state.win) then
          local buf = vim.api.nvim_win_get_buf(core.state.win)
          local last_line = vim.api.nvim_buf_line_count(buf)
          vim.api.nvim_win_set_cursor(core.state.win, { last_line, 0 })
        end
      end

      pyrepl.setup({
        split_horizontal = false,
        split_ratio = 0.5,
        image_provider = "placeholders",
        block_pattern = "^# %%%%.*$",
        jupytext_hook = true,
      })

      -- send commands
      vim.keymap.set("n", "<leader>jf", pyrepl.send_buffer)
      vim.keymap.set("n", "<leader>jb", pyrepl.send_cell)
      vim.keymap.set("v", "<leader>jv", pyrepl.send_visual)

      -- utility commands
      vim.keymap.set("n", "<leader>jp", pyrepl.step_cell_backward)
      vim.keymap.set("n", "<leader>jn", pyrepl.step_cell_forward)
    end,
  },
}
