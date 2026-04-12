return {
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = false,
    branch = "main",
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Directory to install parsers and queries to
        install_dir = vim.fn.stdpath('data') .. '/site',
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'css',
          'fish',
          'gdscript',
          'godot_resource',
          'gdshader',
          'html',
          'javascript',
          'lua',
          'markdown',
          'markdown_inline',
          'python',
          'php',
          'query',
          'rust',
          'vim',
          'vimdoc',
        },

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,
        vim.treesitter.language.register('markdown', 'vimwiki'),

        highlight = {
          enable = true,

          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
          -- the name of the parser)
          -- list of language that will be disabled
          -- disable = { "c", "rust" },
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby', 'lua' } },
      }
    end,
  },
}
