return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  main = "ibl",
  config = function ()
    require("ibl").setup({
      indent = { char = "▏" },
      -- whitespace = {char = "..."},
      -- exclude = { filetypes = {'rust'} }
      -- scope = {}, -- not sure what this is
    })
  end
}
