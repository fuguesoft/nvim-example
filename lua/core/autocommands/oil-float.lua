vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('OilFloatCustom', {}),
  pattern = 'OilEnter',
  callback = function()
    local actions = require 'oil.actions'
    local util = require 'oil.util'
    if util.is_floating_win() then
      vim.keymap.set('n', 'q', actions.close.callback, {
        buffer = true,
      })
    end
  end,
})
return {}
