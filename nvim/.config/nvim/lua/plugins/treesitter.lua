return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "rust",
      "ron", -- used with serde ?
      "python",
      "dart",
      "angular",
      "typescript",
      "hurl",
      "yaml",
    },
  },
}
