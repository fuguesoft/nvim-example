return {
  -- :help scimark for usage
  -- default binding <leader>sc
  "mipmip/vim-scimark",
  config = function()
    require 'vim-scimark'.setup({
      vim.keymap.set('n', '<leader>S', ':OpenInScim<CR>'),
    })
  end
}
