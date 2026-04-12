local state = {
  floating = {
    buf = -1,
    win = -1,
    is_open = false,
  }
}

local _border = "rounded"

local function open_floating_terminal(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  if not buf then
    error("Failed to create buffer")
  end

  -- vim.nvim_set_option_value(
  --   state.win,
  --   'winhighlight',
  --   'Normal:FloatingTermNormal,FloatBoarder:FloatingTermBorder'
  -- )

  vim.api.nvim_set_hl(0, 'FloatingTermNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatingTermBorder', { bg = 'none' })

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })
  vim.cmd("startinsert!")

  return { buf = buf, win = win }
end

local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_terminal({ buf = state.floating.buf });
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.notify("chocolate")
      -- This was the old command
      vim.cmd.terminal()

      -- This was unsuccessful
      -- (buffer: integer, opts: vim.api.keyset.open_term)
      -- vim.api.nvim_open_term(state.floating.buf, {})

      -- This "fixed" the issue
      -- vim.cmd.edit('term://fish')
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Flterm", toggle_terminal, {})
vim.keymap.set('n', '<A-Esc>', toggle_terminal, { noremap = true, silent = true })
vim.keymap.set('t', '<A-Esc>', toggle_terminal, { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<A-Esc>', [[:Flterm<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>ft', [[:Flterm<CR>]], { noremap = true, silent = true })
