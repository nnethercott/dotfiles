return {
  "folke/trouble.nvim",
  -- TODO: modify outline-like behaviour
  keys = {
    {
      "<leader>tr",
      function()
        local opts = { mode = "lsp_references" }
        require("trouble").toggle(opts)
      end,
      desc = "Toggle lsp references",
    },
    {
      "<leader>cs",
      function(_, opts)
        local trouble = require("trouble")
        local local_opts = {
          mode = "lsp_document_symbols",
          focus = false,
          follow = true,
          auto_preview = false,
          win = {
            position = "right",
            size = 40,
          },
          filter = {
            -- remove Package since luals uses it for control flow structures
            ["not"] = { ft = "lua", kind = "Package" },
            any = {
              -- all symbol kinds for help / markdown files
              ft = { "help", "markdown" },
              -- default set of symbol kinds
              kind = {
                "Class",
                "Enum",
                "Field",
                "Function",
                "Interface",
                "Method",
                "Module",
                "Namespace",
                "Property",
                "Struct",
                "Trait",
              },
            },
          },
        }

        trouble.toggle(local_opts)
      end,
      desc = "Trouble symbols toggle",
    },
  },
}
