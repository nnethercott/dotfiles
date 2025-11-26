return {
  "ibhagwan/fzf-lua",
  config = function(_, opts)
    local fzf = require("fzf-lua")

    -- Merge custom fzf options
    opts.fzf_opts = vim.tbl_extend("force", opts.fzf_opts or {}, {
      ["--cycle"] = true,
    })

    -- Merge custom LSP code action window options
    opts.lsp = opts.lsp or {}
    opts.lsp.code_actions = vim.tbl_extend("force", opts.lsp.code_actions or {}, {
      winopts = {
        relative = "cursor",
        backdrop = 100,
        border = "rounded",
        width = 0.40,
        height = 0.15,
        row = 1,
        preview = { hidden = true },
      },
    })

    -- Apply config and register UI select
    fzf.setup(opts)
    fzf.register_ui_select()
  end,

  keys = {
    { "<leader>f", ":FzfLua<CR>", desc = "find files" },
    { "<leader>rg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    {
      "<leader>gf",
      '<cmd>lua require("fzf-lua").grep({ search = "" })<cr>',
      desc = "Grep",
    },
    {
      "<leader>a",
      function()
        require("fzf-lua").lsp_code_actions()
      end,
      mode = { "n", "x" },
      desc = "Code action",
    },
  },
}
