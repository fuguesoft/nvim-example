return {
  'nvim-treesitter/nvim-treesitter',
  enable = false,
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  install_dir = vim.fn.stdpath('data') .. '/site',
  config = function()
    local parsers = {
      "awk",
      "bash",
      "c",
      "cpp",
      "css",
      "editorconfig",
      "fish",
      "gdscript",
      "gdshader",
      "git_config",
      "git_rebase",
      "gitignore",
      "godot_resource",
      "haskell",
      "html",
      "ini",
      "javascript",
      "jinja",
      "jq",
      "kdl",
      "latex",
      "lua",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "nix",
      "php",
      "python",
      "qmljs",
      "query",
      "regex",
      "ruby",
      "rust",
      "ssh_config",
      "sway",
      "tmux",
      "toml",
      "typescript",
      "udev",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "zsh",
    }
    require('nvim-treesitter').install(parsers)
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end

        -- if parser exists, load it
        if not vim.treesitter.language.add(language) then return end
        -- enable syntax highlighting, folds

        vim.treesitter.start(buf, language)
        -- ...and indentation
        vim.bo.indentexpr = "v:lua-require'nvim-treesitter'.indentexpr()"
      end
    })
  end,
  opts = {
    auto_install = false,

  },
}
