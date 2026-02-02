return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "Saghen/blink.cmp",
    },
    event = "VeryLazy",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_startup_folded = "showeverything",
        mappings = {
          capture = {
            org_capture_refile = "R",
            org_capture_finalize = "q",
          },
        },
      })
      require("blink.cmp").setup({
        sources = {
          per_filetype = {
            org = { "orgmode" },
          },
          providers = {
            orgmode = {
              name = "Orgmode",
              module = "orgmode.org.autocompletion.blink",
              fallbacks = { "buffer" },
            },
          },
        },
      })

      -- register <CR> to follow links
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        callback = function()
          vim.keymap.set("n", "<CR>", function()
            require("orgmode").action("org_mappings.open_at_point")
          end, { buffer = true })
        end,
      })
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    enabled = true,
    dependencies = {
      { "nvim-orgmode/orgmode" },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/orgfiles",
      })
    end,
    keys = {
      {
        "<leader>nc",
        function()
          require("org-roam.api").capture_node()
        end,
        desc = "Roam: capture node",
      },
      {
        "<leader>nf",
        function()
          require("org-roam.api").find_node()
        end,
        desc = "Roam: find node",
      },
    },
  },
  {
  "Maxteabag/sqlit.nvim",
  opts = {},
  keys = {
    { "<leader>D", function() require("sqlit").open() end, desc = "Database (sqlit)" },
  },
}
}
