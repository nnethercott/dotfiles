-- helper for mini files
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
      require("mini.files").setup({
        mappings = {
          close = "<C-c>",
          synchronize = "<CR>",
        },
      })
      require("mini.statusline").setup()
      MiniStatusline.section_lsp = function()
        return ""
      end
      MiniStatusline.section_filename = function()
        return vim.fn.pathshorten(vim.fn.expand("%:~:."))
      end
      require("mini.indentscope").setup({
        symbol = "│",
        draw = {
          animation = require("mini.indentscope").gen_animation.none(),
        },
      })

      require("mini.bufremove").setup()
    end,
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "buffer close and preserve split",
      },
      -- toggle explorer
      {
        "<leader>e",
        function()
          if not MiniFiles.close() then
            MiniFiles.open()
          end
        end,
        desc = "explorer",
      },
      {
        "<leader>fe",
        function()
          local current_file_dir = vim.fn.expand("%:p")
          MiniFiles.open(current_file_dir)
        end,
        desc = "explorer at current file",
      },
    },
  },
}
