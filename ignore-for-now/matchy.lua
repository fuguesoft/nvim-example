vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('MatchyMatchy', { clear = true }),
  pattern = '*',
  callback = function()
    vim.cmd [[ set matchpairs+=<:> ]]
  end,
})
return {}
