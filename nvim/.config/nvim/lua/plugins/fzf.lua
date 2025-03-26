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
    { "<leader>f", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>rg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    {
      "<leader>a",
      mode = { "n", "x" },
      function()
        local opts = {
          opts;
          winopts = {
            relative = "cursor",
            backdrop = 100,
            border = "rounded",
            width = 0.5,
            height = 0.2,
            row = 1,
            preview = { hidden = true },
          },
        }
        require("fzf-lua").lsp_code_actions(opts)
      end,
      desc = "Code action",
    },
  },
}
