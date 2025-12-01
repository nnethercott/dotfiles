return {
  -- copies ctx from your code in opencode-compatible format
  {
    "ahkohd/context.nvim",
    config = function()
      local context = require("context")
      context.setup({
        picker = context.pickers.snacks,
        prompts = {
          explain = "Explain {this}",
          fix = "Fix the issue at {this}",
          review = "Review {file} for issues",
        },
      })
    end,
    keys = {
      {
        "<leader>x",
        function()
          require("context").pick()
        end,
        desc = "Context",
        mode = { "n", "v" },
      },
    },
  },
}
