local o = vim.opt
local g = vim.g

g.mapleader = " "

o.timeoutlen = 100
o.hlsearch = false
o.relativenumber = true
o.number = true
o.termguicolors = true
o.syntax = "enable"
o.signcolumn = "yes"
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.ignorecase = true
o.smartcase = true
o.cursorline = false
o.backspace = { "indent", "eol", "start" }
o.clipboard = "unnamedplus"
o.splitright = true
o.splitbelow = true
-- o.laststatus = 0
o.wrap = true
o.cmdheight = 0
o.shortmess:remove("I")
o.swapfile = false


-- fuzzy-find-files on :find
-- https://www.reddit.com/r/neovim/comments/1q3zzw2/fast_fuzzy_file_picker_with_wildmenu_and/
local filescache = {}

function _G.FindFiles(arg, _)
  if #filescache == 0 then
    filescache = vim.fn.systemlist("fd --type f --follow --hidden --exclude .git")
  end
  return arg == "" and filescache or vim.fn.matchfuzzy(filescache, arg)
end

o.findfunc = "v:lua.FindFiles"
-- vim.o.wildoptions = "fuzzy,pum"
-- LazyVim
g.lazyvim_picker = "fzf"
o.listchars = {
  trail = " ",
  tab = "  ",
}
