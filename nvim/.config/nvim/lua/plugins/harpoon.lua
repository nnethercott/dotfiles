return {
  "ThePrimeagen/harpoon",
  opts = {},
  keys = {
    {
      "<leader>h",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "toggle harpoon ui",
    },
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "toggle harpoon ui",
    },
  },
}
