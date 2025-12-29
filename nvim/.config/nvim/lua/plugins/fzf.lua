return {
  "ibhagwan/fzf-lua",
  config = function(_, opts)
    local fzf = require("fzf-lua")
    opts = vim.tbl_deep_extend("force", require("fzf-lua.profiles.fzf-vim"), {
      -- main
      winopts = {
        width = 0.8,
        height = 0.7,
        backdrop=100,
        preview = {
          hidden = false,
          layout = "flex",
          flip_columns = 90,
          vertical = "down:65%",
        },
      },
      fzf_opts = {
        ["--cycle"] = true,
      },
    })

    -- code actions
    opts.lsp = vim.tbl_deep_extend("force", opts.lsp or {}, {
      code_actions = {
        winopts = {
          relative = "cursor",
          border = "rounded",
          backdrop = 100,
          width = 0.4,
          height = 0.15,
          row = 1,
          preview = { hidden = true },
        },
        fzf_opts = {
          ["--layout"] = "reverse",
        }
      },
    })
    fzf.setup(opts)
    fzf.register_ui_select()
  end,

  keys = {
    { "<leader>f", ":FzfLua files<CR>", desc = "find files" },
    { "<leader>rg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    {
      "<leader>gf",
      '<cmd>lua require("fzf-lua").grep({ search = "" })<cr>',
      desc = "Grep",
    },
    {
      "<leader>a",
      ":FzfLua lsp_code_actions silent=true<CR>",
      mode = { "n", "x" },
      desc = "Code action",
    },
  },
}
