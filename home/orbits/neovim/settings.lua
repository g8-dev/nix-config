local g = vim.g
local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

cmd("autocmd!")
cmd("set modifiable")
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])

cmd.scriptencoding = "utf-8"
opt.number = true
cmd.notify = require("notify")

opt.ai = true
opt.backup = false
opt.backupskip = "/tmp/*"
opt.backspace = "start,eol,indent"
opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.encoding = "utf-8"
opt.expandtab = true
opt.foldlevel = 99
opt.formatoptions:append({ "r" })
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.inccommand = "split"
opt.ignorecase = true
opt.laststatus = 2
opt.path:append({ "**" }) -- Finding files - search down into subfolders
opt.scrolloff = 999
opt.shell = "zsh"
opt.shiftwidth = 2
opt.showcmd = true
opt.si = true -- Smart indent
opt.smarttab = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.title = true
opt.wildignore:append({ "*/node_modules/*" })
opt.wrap = true -- No wrap lines

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
