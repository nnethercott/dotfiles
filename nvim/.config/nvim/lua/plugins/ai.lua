local export_env_file = function(file)
  for line in io.lines(vim.fn.expand(file)) do
    local key, value = line:match("^([^=]+)=(.*)$")
    if key then
      vim.env[key] = value
    end
  end
end

return {
  -- copies ctx from your code in opencode-compatible format
  {
    "ahkohd/context.nvim",
    keys = {
      {
        "<leader>x",
        function()
          local ctx = require("context.getters").this()
          if ctx then
            vim.fn.setreg("+", ctx)
          end
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "n", true)
        end,
        desc = "Context",
        mode = { "n", "v" },
      },
    },
  },
  -- codecompanion + claude via vertex ai
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local model = "claude-opus-4-5@20251101"

      export_env_file("~/.config/opencode/.env")

      require("codecompanion").setup({
        strategies = {
          agent = { adapter = "vertex_claude" },
          chat = { adapter = "vertex_claude" },
          inline = { adapter = "vertex_claude" },
        },
        adapters = {
          vertex_claude = function()
            local url = ("https://aiplatform.googleapis.com/v1/projects/%s/locations/global/publishers/anthropic/models/%s:streamRawPredict"):format(
              vim.env.GOOGLE_CLOUD_PROJECT,
              model
            )
            local adapter = require("codecompanion.adapters").extend("anthropic", {
              url = url,
              env = { access_token = "cmd:gcloud auth print-access-token" },
              handlers = {
                form_parameters = function(_, params)
                  params.anthropic_version = "vertex-2023-10-16"
                  params.model = nil
                  return params
                end,
              },
            })
            adapter.headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer ${access_token}",
            }
            return adapter
          end,
        },
      })
    end,
  },
  -- codecompanion + vibe acp
  -- {
  --   "olimorris/codecompanion.nvim",
  --   version = "v17.33.0",
  --   enabled = true,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --
  --     require("codecompanion").setup({
  --       strategies = {
  --         agent = { adapter = "vibe", model = "devstral-latest" },
  --         chat = { adapter = "vibe", model = "devstral-latest" },
  --         -- directly use api
  --         inline = {
  --           adapter = "mistral",
  --           model = "devstral-latest",
  --         },
  --       },
  --       adapters = {
  --         acp = {
  --           vibe = function()
  --             local helpers = require("codecompanion.adapters.acp.helpers")
  --             return {
  --               name = "vibe",
  --               formatted_name = "Vibe",
  --               type = "acp",
  --               roles = {
  --                 llm = "assistant",
  --                 user = "user",
  --               },
  --               opts = {
  --                 vision = true,
  --               },
  --               commands = {
  --                 default = {
  --                   "vibe-acp",
  --                 },
  --               },
  --               defaults = {
  --                 mcpServers = {},
  --                 timeout = 20000, -- 20 seconds
  --               },
  --               env = {
  --                 MISTRAL_API_KEY = "MISTRAL_API_KEY",
  --               },
  --               parameters = {
  --                 protocolVersion = 1,
  --                 clientCapabilities = {
  --                   terminal = true,
  --                   fs = { readTextFile = true, writeTextFile = true },
  --                 },
  --                 clientInfo = {
  --                   name = "CodeCompanion.nvim",
  --                   version = "1.0.0",
  --                 },
  --               },
  --               handlers = {
  --                 setup = function(self)
  --                   return true
  --                 end,
  --
  --                 form_messages = function(self, messages, capabilities)
  --                   return helpers.form_messages(self, messages, capabilities)
  --                 end,
  --
  --                 on_exit = function(self, code) end,
  --               },
  --             }
  --           end,
  --         },
  --       },
  --       display = { chat = { window = { position = "right" } } },
  --     })
  --   end,
  -- },
}
