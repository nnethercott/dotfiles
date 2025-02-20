return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  event = "VeryLazy",
  priority = 2,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",     -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      open_on_setup = false,

      window = {
        position = "left",
        width = 32,
        mappings = {
          ["v"] = "open_vsplit",
          ["s"] = "open_split",
        }
      },
      use_popups_for_input = false,
    })


    vim.keymap.set({ "n", "x" }, "<leader>e", ":Neotree toggle<CR>")
    vim.keymap.set({ "n", "x" }, "<leader>ef", ":Neotree reveal<CR>")
  end,

}
