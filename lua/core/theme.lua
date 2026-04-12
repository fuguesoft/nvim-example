local o = vim.opt

-- themeing
-- vim.cmd.colorscheme 'archery'
vim.cmd.colorscheme 'dogrun'
-- vim.cmd.colorscheme 'habamax'

o.termguicolors = true
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TabLine', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = 'none', bg = 'none' })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatingTermNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatingTermBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })



-- completion window
o.completeopt = 'menuone,'
o.pumheight = 10 -- concurrently visible options
o.pumblend = 10  -- window transparency
o.winblend = 0   -- window transparency

o.guicursor = 'i-ci-ve:ver25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
