return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    -- merge fzf_opts
    opts.fzf_opts = vim.tbl_extend("force", opts.fzf_opts or {}, {
      ["--cycle"] = true,
    })

    -- LSP code actions config
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

    return opts
  end,
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.setup(opts)
    fzf.register_ui_select() -- 👈 this is the important part
  end,
  keys = {
    { "<leader>f", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>rg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<leader>gf", '<cmd>lua require("fzf-lua").grep({ search = "" })<cr>', desc = "Grep" },
    {
      "<leader>a",
      mode = { "n", "x" },
      function()
        require("fzf-lua").lsp_code_actions()
      end,
      desc = "Code action",
    },
  },
}
