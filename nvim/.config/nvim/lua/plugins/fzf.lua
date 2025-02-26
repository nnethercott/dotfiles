return {
  "ibhagwan/fzf-lua",
  opts = {
    keymap = {
      builtin = {
        ["?"] = "toggle-preview",
      },
      fzf = {
        ["tab"] = "down",
        ["shift-tab"] = "up",
        ["ctrl-q"] = "select-all+accept",
      },
    },
    fzf_opts = {
      ["--cycle"] = true,
    },
  },
  keys = {
    -- minimal code actions
    {
      "<leader>a",
      mode = { "n", "x" },
      function()
        local opts = {
          winopts = {
            relative = "cursor",
            backdrop = 100,
            border = "rounded",
            width = 0.45,
            height = 0.15,
            row = 1,
            preview = { hidden = true },
          },
        }
        require("fzf-lua").lsp_code_actions(opts)
      end,
      desc = "Code action",
    }, -- TODO: maybe change to dedicated plugin
  },
}
