return {
  "ibhagwan/fzf-lua",
  enabled = true,
  config = function(_, opts)
    local fzf = require("fzf-lua")
    opts = vim.tbl_deep_extend("force", require("fzf-lua.profiles.fzf-vim"), {
      -- main
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden",
      },
      winopts = {
        width = 0.7,
        height = 0.7,
        backdrop = 100,
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
      previewers = {
        builtin = {
          extensions = {
            ["svg"] = { "chafa", "{file}" },
          },
        },
      },
    })

    -- code actions
    opts.lsp = vim.tbl_deep_extend("force", opts.lsp or {}, {
      code_actions = {
        -- prompt = "",
        winopts = {
          relative = "cursor",
          border = "none",
          backdrop = 100,
          width = 0.4,
          height = 0.15,
          row = 1,
          preview = { hidden = true },
        },
        fzf_opts = {
          ["--layout"] = "reverse",
        },
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
