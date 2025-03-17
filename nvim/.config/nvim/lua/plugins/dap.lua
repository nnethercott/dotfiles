return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- codelldb 
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",
      }

      -- dart
      -- dap.adapters.dart = {
      --   type = "executable",
      --   command = "dart",
      --   args = { "debug_adapter" },
      -- }
      -- dap.configurations.dart = {
      --   {
      --     type = "dart",
      --     request = "launch",
      --     name = "Launch Flutter",
      --     program = "${workspaceFolder}/lib/main.dart",
      --     cwd = "${workspaceFolder}",
      --   },
      -- }
    end,
    keys = {
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Dap toggle breakpoint",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
