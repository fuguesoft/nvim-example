vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('autocd', {}),
  pattern = { '*' },
  callback = function(ev)
    --[[ change directory ]] --
    if vim.bo[ev.buf].buftype ~= "terminal" then
      local path = vim.fn['expand'] '%:p'
      local dirname = string.gsub(path, '(.*/)(.*)', '%1')
      -- vim.cmd(string.format('tcd %s', dirname))
      print(string.format('working dir: %s', dirname))
    end
  end,
})
return {}
