-- Resize splits if window got resized
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('resize_splits', {}),
  callback = function()
    local save_ei = vim.o.eventignore
    vim.o.eventignore = 'all'
    local tp = vim.api.nvim_get_current_tabpage()
    vim.cmd.tabdo '"'
    vim.api.nvim_set_current_tabpage(tp)
    vim.o.eventignore = save_ei
    -- get tabpages
    local tab_list = vim.api.nvim_list_tabpages()
    -- iterate through each tabpage
    for _, tab in ipairs(tab_list) do
      print('windows in this tab: ', vim.api.nvim_tabpage_list_wins(tab))
      -- get windows of iter tab
      local win_list = vim.api.nvim_tabpage_list_wins(tab)
      -- print('wins: ', vim.inspect(vim.api.nvim_list_wins()))
      -- iterate through each window
      for _, win in ipairs(win_list) do
        -- get current buffer
        local current_buffer = vim.api.nvim_win_get_buf(win)
        -- get filetype
        local buffer_filetype_string = vim.bo[current_buffer].filetype
        -- get filename
        local filename = vim.fn.bufname(current_buffer)
        -- help file
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
    end
  end,
})
-- get info
-- print(vim.inspect(vim.fn.getbufinfo(bufnr)))
-- print(vim.inspect(vim.fn.getwininfo(winnr)))
-- print(vim.inspect(vim.fn.gettabinfo(tabnr)))
return {}
