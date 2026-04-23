return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote

      -- require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotesmini.surround
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.comment').setup {
      --   lazy = false,
      -- }
      require('mini.surround').setup()

      local move = require 'mini.move'
      move.setup {
        mappings = {
          -- Visual mode
          left = '<A-h>',
          down = '<A-j>',
          up = '<A-k>',
          right = '<A-l>',

          -- Normal mode
          line_left = '<A-h>',
          line_down = '<A-j>',
          line_up = '<A-k>',
          line_right = '<A-l>',
        },
        options = {
          reindent_linewise = true,
        },
      }

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      -- -@diagnostic disable-next-line: duplicate-set-field

      statusline.section_location = function()
        -- return '%2l:%-2v %{ObsessionStatus("$", "S")} %P'
        return '%2l:%-2v %P'
      end

      -- require('mini.hues').setup {
      --   accent = 'high',
      --   background = '#164d18',
      --   foreground = '#164d18',
      --   plugins = {
      --     default = true,
      --   },
      --   saturation = 'medium',
      -- }

      -- Simple and easy tabline
      -- require('mini.tabline').setup()

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
