vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('concord_to_md', {}),
  pattern = { '*.txt' },
  callback = function()
    local filename = vim.fn.expand('%:t')
    -- vim.notify(tostring(filename))
    if vim.startswith(filename, 'concord-message-') then
      -- vim.o.filetype = 'vimwiki.markdown'
      vim.o.filetype = 'markdown'
      vim.o.shiftwidth = 2
      vim.g.vimwiki_syntax = 'markdown'
      vim.g.vimwiki_filetypes = { 'markdown', 'vimwiki.markdown' }
      vim.g.vimwiki_global_ext = 0
    end
  end,
})
return {}
