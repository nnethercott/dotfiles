return {
  "ibhagwan/fzf-lua",
  config = function(_, opts)
    -- Register UI select once
    local fzf = require("fzf-lua")
    fzf.register_ui_select()

    -- Merge your custom fzf_opts
    opts.fzf_opts = vim.tbl_extend("force", opts.fzf_opts or {}, {
      ["--cycle"] = true,
    })

    -- Merge your custom LSP code actions config
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

    -- Apply the configuration
    fzf.setup(opts)
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
      function()
        require("fzf-lua").lsp_code_actions()
      end,
      mode = { "n", "x" },
      desc = "Code action",
    },
  },
}
