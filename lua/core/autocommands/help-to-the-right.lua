-- Open help menu in a vertical split to the right
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('help_window_right', {}),
  pattern = { '*.txt' },
  callback = function()
    if vim.o.filetype == 'help' then
      vim.cmd.wincmd 'L'
      vim.cmd 'vertical resize 82'
      vim.cmd 'edit'
    end
  end,
})
return {}
