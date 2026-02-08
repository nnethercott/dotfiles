return {
  -- buffer management
  {
    "serhez/bento.nvim",
    opts = {
      max_open_buffers = 8,
      lock_char = "*",
      buffer_deletion_metric = "frequency_access",
      buffer_notify_on_delete = false,
      ordering = "access",
      ui = {
        mode = "floating",
        floating = {
          minimal_menu = "filename",
          position = "top_right",
          -- offset_y = -4,
          -- border = "rounded",
        },
      },
    },
    config = function(_, opts)
      local butils = require("bento.utils")

      ---@diagnostic disable-next-line: duplicate-set-field
      butils.get_display_names = function(paths)
        local display_names = {}
        for _, p in ipairs(paths) do
          local short_path = vim.fn.pathshorten(vim.fn.fnamemodify(p, ":~:."), 2)
          local parts = {}
          for part in string.gmatch(short_path, "[^/\\]+") do
            parts[#parts + 1] = part
          end

          local n = #parts
          local start = math.max(1, n - 1)
          local shorter_path = table.concat(parts, "/", start, n)

          display_names[p] = shorter_path
        end
        return display_names
      end
      require("bento").setup(opts)

      -- register keymap after setup
      vim.keymap.set("n", "<leader>ba", function()
        require("bento").close_all_buffers({ locked = false, current = false })
      end)
      vim.keymap.set("n", "<leader>bc", function()
        vim.cmd(":BentoToggle")
      end)
    end,
  },
  -- split maximizer
  {
    "szw/vim-maximizer",
    keys = {
      {
        "<leader>w",
        ":MaximizerToggle<CR>",
        desc = "maximize current split",
      },
    },
  },
}
