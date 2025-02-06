local o = vim.opt
vim.g.mapleader = " "

-- using tree sitter we can modify highlight groups !
-- vim.cmd [[hi @keyword.rust guifg=red]]

o.timeoutlen = 150
o.hlsearch = false

-- Relative line numbers
o.relativenumber = true
o.number = true

o.termguicolors = true
o.syntax = "on"
o.signcolumn = "yes"
-- o.foldcolumn = "yes"
o.foldenable = false

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
o.clipboard:append({ "unnamedplus", "unnamed" })

-- Split windows
o.splitright = true
o.splitbelow = true

