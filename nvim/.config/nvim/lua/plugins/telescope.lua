return {
  {

    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      -- Load extensions
      telescope.load_extension("fzf")

      telescope.setup({
        defaults = {
          layout_config = {
            height = 0.5,
          },
          path_display = { "smart" },
          mappings = {
            i = {
              ["<Tab>"] = actions.move_selection_previous,
              ["<S-Tab>"] = actions.move_selection_next,
            },
          },
        },
      })

      -- Set keymaps
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

    end,
  }
}
