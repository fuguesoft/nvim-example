function get_xdg_dir(dirname)
  dirname = string.upper(dirname)
  local handle = io.popen(string.format('xdg-user-dir %s', dirname))
  local result = handle:read '*a'
  handle:close()
  return result:match '^%s*(.-)%s*$'
end

local docs = get_xdg_dir 'documents'
return {
  'vimwiki/vimwiki',
  lazy = false,
  enabled = true,
  event = 'VimEnter',
  init = function()
    vim.g.vimwiki_list = {
      {
        path = string.format('%s/wiki/main/', docs),
        syntax = 'markdown',
        nested_syntaxes = {
          bash = 'bash',
          cpp = 'cpp',
          fish = 'fish',
          ini = 'ini',
          lua = 'lua',
          nix = 'nix',
          python = 'python',
          sh = 'sh',
          vifm = 'vimscript',
        },
        ext = 'md',
        links_space_char = '_',
      },
      {
        path = string.format('%s/wiki/farm/', docs),
        syntax = 'markdown',
        nested_syntaxes = {
          bash = 'bash',
          cpp = 'cpp',
          fish = 'fish',
          ini = 'ini',
          lua = 'lua',
          nix = 'nix',
          python = 'python',
          sh = 'sh',
          vifm = 'vimscript',
        },
        ext = 'md',
        links_space_char = '_',
      },
      {
        path = string.format('%s/wiki/r-ableton/', docs),
        syntax = 'markdown',
        nested_syntaxes = {
          bash = 'bash',
          cpp = 'cpp',
          fish = 'fish',
          ini = 'ini',
          lua = 'lua',
          nix = 'nix',
          python = 'python',
          sh = 'sh',
          vifm = 'vimscript',
        },
        ext = 'md',
        links_space_char = '_',
      },
      {
        path = '/home/fugue/',
        syntax = 'markdown',
        nested_syntaxes = {
          bash = 'bash',
          cpp = 'cpp',
          fish = 'fish',
          ini = 'ini',
          lua = 'lua',
          man = 'sh',
          nix = 'nix',
          python = 'python',
          sh = 'sh',
          tin = 'tin',
          vifm = 'vimscript',
        },
        diary_rel_path = '/documentos/wiki/main/diary/',
        ext = 'md',
        links_space_char = '_',
      },
    }
    -- vim.g.bullet_types = ['-', '→']
    vim.g.list_margin = -1
    vim.g.diary_start_week_day = 'sunday'
    vim.g.auto_chdir = 1
    vim.g.cycle_bullets = 1
    vim.g.vimwiki_global_ext = 0
    -- vim.g.vimwiki_ext2syntax = { '.md': 'markdown', }
    vim.g.vimwiki_filetypes = {
      'markdown',
    }
    -- vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_auto_header = 1
    vim.g.vimwiki_listsyms = '.·oOX'
  end,
}
