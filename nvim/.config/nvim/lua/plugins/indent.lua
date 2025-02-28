return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  event = { "BufEnter" },
  main = "ibl",
  opts = {
    indent = { char = "│", highlight = "IblIndent" },
    scope = {
      char = "│",
      highlight = "IblScope",
      enabled = true,
      show_start = false,
      show_end = false,
    },
    exclude = { filetypes = { "lua", "yaml" } }, -- exclude langs here
  },
  config = function(_, opts)
    require("ibl").setup(opts)
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  end,
}
