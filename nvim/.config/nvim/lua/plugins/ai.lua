return {
  "yetone/avante.nvim",
  enabled = false,
  event = "VeryLazy",
  version = "*",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20241022",
      temperature = 0,
      max_tokens = 4096,
    },
    behaviour = {
      auto_suggestions = false,
    },
    mappings = {
      suggestion = {
        accept = "<M-a>",
        dismiss = "<M-d>",
        next = "<C-]>",
        prev = "<C-[>",
      },
    },
  },
  -- NOTE: completions with blink may not work ...
  -- https://github.com/yetone/avante.nvim?tab=readme-ov-file#blinkcmp-users
  -- file_selector = {
  --   provider = "fzf",
  --   provider_opts = {},
  -- },
}
