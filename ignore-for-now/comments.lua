-- Open help menu in a vertical split to the right
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('vimfrc_commentstring', {}),
  pattern = { 'vifmrc' },
  callback = function()
    if vim.o.filetype == 'vifm' then
      vim.opt_local.commentstring = '" %s'
    end
  end,
})
return {}
