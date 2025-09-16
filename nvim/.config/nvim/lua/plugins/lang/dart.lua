return{
  -- nvim.flutter
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
        },
        dev_tools = {
          autostart = true,
          auto_open_browser = true,
        },
        dev_log = {
          enabled = false,
          open_cmd = "15split",
          focus_on_open = false,
        },
        debugger = {
          enabled = true,
          -- run_via_dap = true,
          -- register_configurations = function(_)
          --   require("dap").configurations.dart = {
          --     {
          --       type = "dart",
          --       request = "launch",
          --       name = "Launch Flutter",
          --       program = "${workspaceFolder}/lib/main.dart",
          --       cwd = "${workspaceFolder}",
          --     },
          --   }
          -- end,
        },
      })
    end,
  },

}
