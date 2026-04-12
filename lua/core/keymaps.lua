-- keymaps.lua
local configFile = "/home/fugue/.config/nvim/init.lua"
vim.keymap.set(
  'n',
  '<leader>so',
  ':update /home/fugue/.config/nvim/init.lua<CR>:source /home/fugue/.config/nvim/init.lua<CR>'
)
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "format buffer" })

vim.keymap.set('i', 'ii', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('v', 'ii', '<Esc>')
vim.keymap.set('c', 'ii', '<Esc>')

vim.keymap.set('n', '<leader>of', function()
  local oil = require 'oil'
  local util = require 'oil.util'
  oil.open()
  util.run_after_load(0, function()
    oil.open_preview()
  end)
end, { desc = "Open parent directory with preview" })
