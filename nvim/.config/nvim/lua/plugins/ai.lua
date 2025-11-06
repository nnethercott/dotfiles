return {
  "yetone/avante.nvim",
  enabled=false,
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "mistral",
    providers = {
      mistral = {
        __inherited_from = "openai",
        endpoint = "https://api.mistral.ai/v1/",
        api_key_name = "AVANTE_MISTRAL_API_KEY",
        model = "devstral-medium-2507",
        disable_tools = false, -- disable tools!
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 4096,
        },
      },
    },
    behaviour = {
      auto_apply_diff_after_generation = false,
    },
    windows = {
      ask = {
        floating = false,
      }
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      -- rendered markdown but it looks gross
      "MeanderingProgrammer/render-markdown.nvim",
      enabled = false,
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
