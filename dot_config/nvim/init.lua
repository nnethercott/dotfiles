vim.g.mapleader = " "

vim.opt.rtp:prepend(vim.fn.stdpath('config'))
require("config.options")
require("config.keymaps")
require("config.autocommands")
