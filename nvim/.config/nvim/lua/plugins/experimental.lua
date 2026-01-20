return {
  -- {
  --   "nvim-orgmode/orgmode",
  --   dependencies = {
  --     "nvim-orgmode/org-bullets.nvim",
  --     "Saghen/blink.cmp",
  --   },
  --   event = "VeryLazy",
  --   config = function()
  --     require("orgmode").setup({
  --       org_agenda_files = "~/orgfiles/**/*",
  --       org_default_notes_file = "~/orgfiles/refile.org",
  --       mappings = {
  --         capture = {
  --           org_capture_refile = "R",
  --           org_capture_finalize = "q",
  --         },
  --       },
  --     })
  --     require("org-bullets").setup()
  --     require("blink.cmp").setup({
  --       sources = {
  --         per_filetype = {
  --           org = { "orgmode" },
  --         },
  --         providers = {
  --           orgmode = {
  --             name = "Orgmode",
  --             module = "orgmode.org.autocompletion.blink",
  --             fallbacks = { "buffer" },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.2.0",
    dependencies = {
      { "nvim-orgmode/orgmode", tag = "0.7.0" },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/orgfiles",
        -- optional
        org_files = {
          "~/another_org_dir",
          "~/some/folder/*.org",
          "~/a/single/org_file.org",
        },
      })

      -- TODO: add keybindings for orgmode new capture todo

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
}
