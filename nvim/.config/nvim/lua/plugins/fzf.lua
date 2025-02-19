return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    config = function()
      require('fzf-lua').setup({
        'default',
        winopts = {
          height = 0.50,
          width = 0.60,
          backdrop = 100,

          preview = {
            hidden       = true,
            border       = "rounded",
            layout       = "horizontal",
            vertical     = "up:62%",    -- up|down:size
            horizontal   = "right:60%", -- right|left:size
            flip_columns = 120,
          }
        },
        keymap = {
          builtin = {
            ['?'] = 'toggle-preview',
          },
          fzf = {
            ['tab'] = 'down',
            ['shift-tab'] = 'up',
            ["ctrl-q"] = 'select-all+accept',
          }
        },
        fzf_opts = {
          ["--cycle"] = true,
        }
      })

      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>f", ":FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<leader>fr", ":FzfLua oldfiles<cr>", { desc = "Fuzzy find old files" })
      keymap.set("n", "<leader>fb", ":FzfLua buffers<cr>", { desc = "get open buffers" })
      keymap.set("n", "fs", ":FzfLua lsp_document_symbols<cr>", { desc = "treesitter symbols" })
      keymap.set("n", "fd", ":FzfLua lsp_document_diagnostics<cr>", { desc = "treesitter symbols" })
      keymap.set("n", "ib", ":FzfLua grep_curbuf<cr>", { desc = "get open buffers" })
      keymap.set("n", "<leader>rg", ":FzfLua live_grep<cr>", { desc = "live grep" })
    end
  }
}
