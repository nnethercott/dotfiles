vim.lsp.config["kakehashi"] = {
  cmd = { "kakehashi" },
  init_options = {
    autoInstall = true,
    languageServers = {
      ["rust-analyzer"] = {
        cmd = { "rust-analyzer" },
        languages = { "rust" },
      },
      ["ty"] = {
        cmd = { "ty", "server" },
        languages = { "python" },
      },
    },
    languages = {
      markdown = {
        bridge = {
          rust = { enabled = true },
          python = { enabled = true },
        },
      },
    },
  },
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider.range = false
  end,
}
-- Disable built-in treesitter highlighting to avoid conflicts
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.treesitter.stop()
  end,
})
vim.lsp.enable("kakehashi")
