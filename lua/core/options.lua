-- options.lua
local o = vim.opt


o.number = true
o.relativenumber = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
o.expandtab = true
o.tabstop = 2
o.textwidth = 80
o.shiftwidth = 2
o.shiftround = true

o.clipboard = 'unnamedplus'
o.cursorline = true
o.ignorecase = true
o.inccommand = 'nosplit'
o.scrolloff = 80
o.showmode = false
o.signcolumn = 'yes'
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.timeoutlen = 350
o.updatetime = 250

o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.winborder = "rounded"

o.hidden = true
o.bufhidden = 'unload'
-- vo.laststatus = 3
-- vo.modeline = true
o.showtabline = 2

o.showmatch = true
o.matchtime = 2

-- o.border = "rounded"

-- autoread changed files
o.autoread = true
