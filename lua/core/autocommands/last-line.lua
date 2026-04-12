if vim.fn.has 'autocmd' then
  local auid = vim.api.nvim_create_augroup('MyAugroupName', {})
  vim.api.nvim_create_autocmd('BufReadPost', {
    -- pattern = '*', -- '*' is default
    callback = function()
      local lastpos = vim.fn.line [['"]]
      if lastpos > 0 and lastpos <= vim.fn.line '$' then
        vim.cmd [[normal! g'"]]
      end
    end,
    group = auid,
  })
end
return {}
