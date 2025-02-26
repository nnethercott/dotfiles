return {
  "ibhagwan/fzf-lua",
  opts = {
    keymap = {
      builtin = {
        ["?"] = "toggle-preview",
      },
      fzf = {
        ["tab"] = "down",
        ["shift-tab"] = "up",
        ["ctrl-q"] = "select-all+accept",
      },
    },
    fzf_opts = {
      ["--cycle"] = true,
    },
  },
}
