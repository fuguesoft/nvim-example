local f_en = function(args) vim.b[args.buf].miniai_disable = false end
local enable_opts = { pattern = '[vV\x16]*:*', callback = f_en }
-- vim.api.nvim_create_autocmd('ModeChanged', enable_opts)

local f_dis = function(args) vim.b[args.buf].miniai_disable = true end
local disable_opts = { pattern = '*:[vV\x16]*', callback = f_dis }
-- vim.api.nvim_create_autocmd('ModeChanged', disable_opts)
