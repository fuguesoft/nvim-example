-- This doesn't work properly
-- Just don't open oil in a split for now
vim.api.nvim_create_autocmd('WinClosed', {
  group = vim.api.nvim_create_augroup('resize_split', {}),
  callback = function()
    local save_ei = vim.o.eventignore
    vim.o.eventignore = 'all'
    local tp = vim.api.nvim_get_current_tabpage()
    vim.cmd.tabdo '"'
    vim.api.nvim_set_current_tabpage(tp)
    vim.o.eventignore = save_ei
    local win_list = vim.api.nvim_list_wins()
    for _, win in ipairs(win_list) do
      local current_buffer = vim.api.nvim_win_get_buf(win)
      -- get filetype
      local buffer_filetype_string = vim.bo[current_buffer].filetype
      -- get filename
      local filename = vim.fn.bufname(current_buffer)
      if buffer_filetype_string == 'help' then
        vim.api.nvim_win_set_width(win, 82)
        -- vimwiki.markdown file
      elseif buffer_filetype_string == 'vimwiki.markdown' then
        if vim.endswith(filename, '-task.md') then
          vim.api.nvim_win_set_width(win, 50)
        end
        -- oil buffer
      elseif buffer_filetype_string == 'oil' then
        vim.api.nvim_win_set_width(win, 40)
      end
    end
  end,
})
return {}
