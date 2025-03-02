return {
  "folke/noice.nvim",
  opts = {
    cmdline = { enabled = false, view = "cmdline" },
    messages = { enabled = false },
    popupmenu = { enabled = false, backend = "cmp" },
    notify = { enabled = false },
    lsp = {
      progress = { enabled = false },
      hover = {
        enabled = true,
        silent = false,
        opts = {
          size = {
            max_width = 60, -- max documentation width
          }
        }
      },
      signature = { enabled = true, opts = {} },
      documentation = {
        enabled = true,
        opts = {
          size = {
            max_width = 60, -- max documentation width
          }
        }
      },
    },
    presets = {
      lsp_doc_border = true, -- bordered hover
    },
  },
}
