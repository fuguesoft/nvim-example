return {
  -- :help scimark for usage
  -- default binding <leader>sc
  "mipmip/vim-scimark",
  opts = {
    vim.keymap.set('n', '<leader>S', ':OpenInScim<CR>'),
  },
  -- config = function()
  --   require 'scim-markdown'.setup({
  --     -- vim.keymap.set('n', '<leader>S', ':OpenInScim<CR>'),
  --     keymaps = {
  --       -- ['go'] = { 'oil.open_float', mode = 'n' },
  --       ['<leader>S'] = { ':OpenInScim', mode = 'n' },
  --     }
  --   })
  -- end
}
