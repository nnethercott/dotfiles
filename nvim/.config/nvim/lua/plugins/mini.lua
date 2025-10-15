return {
  -- diasable mini pairs, otherwise lazy overwrites
  {
    "nvim-mini/mini.pairs",
    enabled = false,
  },
  {
    "nvim-mini/mini.trailspace",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local miniTrailspace = require("mini.trailspace")

      miniTrailspace.setup({
        only_in_normal_buffers = true,
      })
      vim.keymap.set("n", "<leader>cw", function()
        miniTrailspace.trim()
      end, { desc = "Erase Whitespace" })
      -- Ensure highlight never reappears by removing it on CursorMoved
      vim.api.nvim_create_autocmd("CursorMoved", {
        pattern = "*",
        callback = function()
          require("mini.trailspace").unhighlight()
        end,
      })
    end,
  },
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.pairs").setup({
        mappings = {
          ["'"] = false,
        },
      })
      require("mini.splitjoin").setup()
      require("mini.surround").setup({
        mappings = {
          add = "ye",
          delete = "ds",
          replace = "cs",
          find = "ef",
          find_left = "eF",
          highlight = "eh",
          update_n_lines = "en",
        },
      })
      require("mini.hipatterns").setup({
        highlighters = {
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
