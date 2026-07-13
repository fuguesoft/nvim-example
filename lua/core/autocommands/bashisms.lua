vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('bashisms', {}),
  pattern = { '*' },
  callback = function()
    local bash_dir = vim.fn.expand('~') .. '/dev/bash/'
    local filepath = vim.fn.expand('%:p')
    local filename = vim.fn.expand('%:t')
    local ext = '%..*'

    --[[ match every file in '/dev/bash' that does not have an extension ]] --
    if vim.startswith(filepath, bash_dir) then
      if not string.match(filename, ext) then
        vim.o.filetype = 'bash'
        vim.o.shiftwidth = 2
        -- vim.lsp.enable('bash', true)
      end
    end
  end,
})
return {}
