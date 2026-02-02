return {
  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
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
  },
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
        -- mode = "tabline",
        mode = "floating",
        floating = {
          minimal_menu = "full",
          position = "top_right",
        },
      },
    },
    config = function(_, opts)
      require("bento").setup(opts)

      -- register keymap after setup
      vim.keymap.set("n", "<leader>ba", function()
        require("bento").close_all_buffers({ locked = false, current = false })
      end)
    end,
  },
}
