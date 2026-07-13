return {
  {
    "toppair/peek.nvim",
    enabled = false,
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        filetype = { 'markdown', 'vimwiki.markdown' },
        app = 'browser'
        -- app = { 'librewolf', '--new-window' }
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}
