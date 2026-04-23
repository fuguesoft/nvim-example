-- general keymap testing ground
local map = vim.keymap.set

--[[ Testing ]]
--
vim.keymap.set({ 'n' }, '<leader>pq', '<cmd>!echo "normal"<CR>', { desc = 'run normal command' })
vim.keymap.set({ 'v', 'x' }, '<leader>pq', '<cmd>w !echo "visual"<CR>', { desc = 'run visual command' })

-- New Note (WIP)
map('n', '<leader>no', function(title)
  if title == '' or title == nil then
    vim.notify 'Provide a title for the note'
    return
  end
end, { desc = '[N][o]tify - Test Script' })

-- Titlecase (WIP)
--

-- vim.keymap.set('n', 'gz', function()
--   vim.cmd [[s#\v(\w)(\S*)#\u\1\L\2#g]]
--   vim.cmd.nohls()
-- end, { desc = 'Title Case' })

vim.keymap.set('n', 'ga', [[<Cmd>s#\v(\w)(\S*)#\u\1\L\2#ge|nohls<CR><$>]], { desc = 'Title Case' })

-- vim.keymap.set('n', '<leader>gz', ":s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>", { desc = 'Title Case' })
