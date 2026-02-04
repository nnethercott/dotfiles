-- helper for mini files
return {
  -- trailspace
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
      -- mini ai
      require("mini.ai").setup()
      -- mini pairs
      require("mini.pairs").setup({
        mappings = {
          ["'"] = false,
        },
      })
      -- mini splitjoin
      require("mini.splitjoin").setup()
      -- mini surround
      require("mini.surround").setup({
        mappings = {
          add = "ye",
          delete = "ds",
          replace = "cs",
        },
      })
      -- mini highpatterns
      require("mini.hipatterns").setup({
        highlighters = {
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })
      -- mini files
      require("mini.files").setup({
        mappings = {
          close = "<C-c>",
          synchronize = "<CR>",
        },
      })
      -- mini statusline
      require("mini.statusline").setup()
      MiniStatusline.section_lsp = function()
        return ""
      end
      MiniStatusline.section_filename = function()
        return vim.fn.pathshorten(vim.fn.expand("%:~:."))
      end
      -- mini indentscope
      require("mini.indentscope").setup({
        symbol = "│",
        draw = {
          animation = require("mini.indentscope").gen_animation.none(),
        },
      })
      -- mini bufremove
      require("mini.bufremove").setup()
      -- mini cursorword
      -- require("mini.cursorword").setup() -- change hi group to same as snacks word
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
