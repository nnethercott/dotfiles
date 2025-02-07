return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = { char = "│" },
      -- whitespace = {char = "..."},

      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {filetypes = {"lua"}} -- exclude langs here
    })

    local hooks = require('ibl.hooks')

    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  end
}
