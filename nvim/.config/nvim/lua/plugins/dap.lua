return {
  {
    "mfussenegger/nvim-dap",
    opts = function (_, opts)
      -- see here: https://github.com/mfussenegger/nvim-dap/discussions/355
      -- fails without proper highlight groups!
      -- vim.fn.sign_define('DapBreakpoint', { text='•', texthl='DapBreakpoint' })
      -- vim.fn.sign_define('DapLogPoint', { text=' ', texthl='DapLogPoint' })
      -- vim.fn.sign_define('DapStopped', { text=' ', texthl='DapStopped' })
    end,
    keys = {
      { "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    },
  },
}
