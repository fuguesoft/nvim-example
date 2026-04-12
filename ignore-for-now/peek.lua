return {
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        close_on_bdelete = true,
        app = 'browser',
        filetype = {
          'markdown',
          'vimwiki',
          'vimwiki.markdown',
          'vimwiki.markdown.pandoc',
        },
      }
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
    opts = {},
  },
}
