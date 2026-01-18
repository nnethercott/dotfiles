return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "rust",
      "ron", -- used with serde ?
      "python",
      "typescript",
      "hurl",
      "yaml",
      "terraform",
      "hcl",
      "helm",
      "c", -- included by default
      "go",
    },
  },
}
