return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "rust",
      "ron", -- used with serde ?
      "python",
      "dart",
      "typescript",
      "hurl",
      "yaml",
      "terraform",
      "hcl",
      "helm",
    },
  },
}
