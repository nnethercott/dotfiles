-- util fn for finding common commit between curr branch and origin/main 
local get_base_rev = function ()
    local curr = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("%s+", "")
    return vim.fn.system("git merge-base " .. curr .. " origin/main"):gsub("%s+", "")
end

return {
  -- TODO: remove later when vscode diff is stable
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    opts = {
      signs = {
        add = { text = "▒" },
        change = { text = "▒" },
        delete = { text = "▒" },
        topdelete = { text = "▒" },
        changedelete = { text = "▒" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        add = { text = "▒" },
        change = { text = "▒" },
        delete = { text = "▒" },
        topdelete = { text = "▒" },
        changedelete = { text = "▒" },
        untracked = { text = "┆" },
      },
      signcolumn = false,
    },
    keys = {
      { "<leader>gb", ":Gitsigns blame<CR>", desc = "Git blame" },
    },
  },
  {
    "esmuellert/codediff.nvim",
    enabled = true,
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    config = function()
      require("codediff").setup({
        -- Keymaps in diff view
        keymaps = {
          view = {
            quit = "q", -- Close diff tab
            toggle_explorer = "<leader>cx", -- Toggle explorer visibility (explorer mode only)
            next_hunk = "<C-n>", -- Jump to next change
            prev_hunk = "<C-p>", -- Jump to previous change
            next_file = "<Tab>", -- Next file in explorer mode
            prev_file = "<S-Tab>", -- Previous file in explorer mode
          },
          conflict = {
            accept_incoming = "<leader>ai", -- Accept incoming (theirs/left) change
            accept_current = "<leader>ac", -- Accept current (ours/right) change
            accept_both = "<leader>ab", -- Accept both changes (incoming first)
            discard = "<leader>ad", -- Discard both, keep base
          },
        },
      })
    end,
    keys = {
      {
        "<leader>cd",
        function()
          vim.cmd(":CodeDiff " .. get_base_rev())
        end,
        desc = "Git diff repo @-",
      },
      {
        "<leader>cf",
        function()
          vim.cmd(":CodeDiff file " .. get_base_rev())
        end,
        desc = "Git diff file @-",
      },
    },
  },
}
