local o = vim.opt
vim.hl = vim.highlight

vim.g.mapleader = " "

-- using tree sitter we can modify highlight groups !
-- vim.cmd [[hi @keyword.rust guifg=red]]

o.timeoutlen = 100
o.hlsearch = false

-- Relative line numbers
o.relativenumber = true
o.number = true

o.termguicolors = true
o.syntax = "enable"
o.signcolumn = "yes"

-- Tabs & indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- Search settings
o.ignorecase = true
o.smartcase = true

-- Cursor line
o.cursorline = false

-- Backspace settings
o.backspace = { "indent", "eol", "start" }

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Split windows
o.splitright = true
o.splitbelow = true
o.laststatus = 2

-- wrap
vim.o.wrap = true

-- cmd height
vim.o.cmdheight = 0

-- LazyVim
vim.g.lazyvim_picker = "fzf"
vim.opt.listchars = {
  trail = " ",
  tab = "  ",
}
vim.opt.shortmess:remove("I")

-- fuzzy-find-files on :find
-- https://www.reddit.com/r/neovim/comments/1q3zzw2/fast_fuzzy_file_picker_with_wildmenu_and/
local filescache = {}

function _G.FindFiles(arg, _)
  if #filescache == 0 then
    filescache = vim.fn.systemlist("fd --type f --follow --hidden --exclude .git")
  end
  return arg == "" and filescache or vim.fn.matchfuzzy(filescache, arg)
end

vim.o.findfunc = "v:lua.FindFiles"
-- vim.o.wildoptions = "fuzzy,pum"
