vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('move_lines_normal', { clear = true }),
  pattern = { '*' },
  callback = function()
    vim.schedule(function()
      -- print 'Ur Mum'
      vim.keymap.set('n', '<A-j>', '<Esc>:m .+1<CR>==:echo("move line down")<CR>', { desc = 'move line down' })
      vim.keymap.set('n', '<A-k>', '<Esc>:m .-2<CR>==:echo("move line up")<CR>', { desc = 'move line up' })
    end)
  end,
})
return {}
