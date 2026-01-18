return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>cs",
      function(_, opts)
        local trouble = require("trouble")
        local local_opts = {
          mode = "lsp_document_symbols",
          format = "{kind_icon} {symbol.name}",
          focus = true,
          follow = true,
          auto_preview = false,
          preview = { type = "none" },
          auto_fold = true,
          win = {
            position = "right",
            size = 40,
          },
          filter = {
            ["not"] = { ft = "lua", kind = "Package" },
            any = {
              ft = { "help", "markdown" },
              kind = {
                "Class",
                "Constructor",
                "Namespace",
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
