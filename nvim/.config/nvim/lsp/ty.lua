vim.lsp.config('ty', {
  settings = {
    ty = {
      diagnosticMode = 'workspace',
      experimental = {
        rename = true,
      },
    },
  },
})
