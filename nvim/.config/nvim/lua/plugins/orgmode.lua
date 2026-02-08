return {
  {
    "nvim-orgmode/orgmode",
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

      -- register keymap to follow links (vim style)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        callback = function()
          vim.keymap.set("n", "<C-]>", function()
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
      -- Disable blink.cmp and add j/k navigation in org-roam picker
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org-roam-select",
        callback = function()
          vim.b.completion = false
          vim.keymap.set("i", "<C-j>", "<C-n>", { buffer = true, remap = true })
          vim.keymap.set("i", "<C-k>", "<C-p>", { buffer = true, remap = true })
        end,
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
}
