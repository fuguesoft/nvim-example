vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('autocd', {}),
  pattern = { '*' },
  callback = function(ev)
    --[[ change directory ]] --
    if vim.bo[ev.buf].buftype ~= "terminal" then
      local directory = vim.fn['expand'] '%:h'
      -- vim.cmd(string.format('tcd %s', directory))
      -- print(string.format('working dir: %s', directory))
    end
  end,
})
return {}
