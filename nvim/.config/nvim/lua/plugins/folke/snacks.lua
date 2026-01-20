local themes = {
  larry_3d = [[
                               __                
  ___      __    ___   __  __ /\_\    ___ ___    
/' _ `\  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\  
/\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

  bloody = [[
 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
         ░    ░  ░    ░ ░        ░   ░         ░
                                ░                  ]],
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true, icon = "" },
    image = { enabled = true },
    indent = { enabled = false },
    notifier = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    words = { enabled = true, debounce = 75 },
    picker = { enabled = false },
    explorer = { enabled = false },
    styles = {
      input = {
        relative = "cursor",
        row = -3,
        width = 25,
        keys = {
          ["<C-c>"] = { "close", mode = { "i", "n" } },
        },
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        -- keys = {},
        -- https://patorjk.com/software/taag/#p=display&f=Larry+3D&t=neovim&x=none&v=4&h=4&w=80&we=false
        header = themes.larry_3d,
      },
    },
  },
  keys = {
    {
      "<leader>k",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    -- disable some stuff
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>E", false },
    { "<leader>e", false },
    { "<leader>cf", false },
  },
}
