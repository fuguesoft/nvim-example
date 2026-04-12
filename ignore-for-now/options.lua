-- disable netrw

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable ftplugin

vim.api.ftplugin = true

--optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Set wordwrap/tabs
vim.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.tabstop = 2
vim.o.smartindent = true
vim.smarttab = false
vim.o.textwidth = 80
vim.o.wrapmargin = 80

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 350

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
vim.o.winborder = 'rounded'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Allow letter increment with 'alpha' option
vim.o.nrformats = ''

-- hide buffer when :x is used
vim.o.hidden = true
vim.o.bufhidden = 'unload'
vim.o.laststatus = 3
vim.o.modeline = true
vim.o.showtabline = 2

-- colorscheme
vim.cmd.colorscheme 'dogrun'
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TabLine', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'none' })

-- visual
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.pumheight = 10
vim.o.pumblend = 10
vim.o.winblend = 0

-- file
vim.o.autoread = true

--behaviour
vim.o.autochdir = off
vim.o.guicursor = 'i-ci-ve:ver25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

return {}
