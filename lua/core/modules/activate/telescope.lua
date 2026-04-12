-- XDG_DESKTOP_DIR="$HOME/escritorio"
-- XDG_DOWNLOAD_DIR="$HOME/descargas"
-- XDG_TEMPLATES_DIR="$HOME/plantillas"
-- XDG_PUBLICSHARE_DIR="$HOME/público"
-- XDG_DOCUMENTS_DIR="$HOME/documentos"
-- XDG_MUSIC_DIR="$HOME/música"
-- XDG_PICTURES_DIR="$HOME/imágenes"
-- XDG_VIDEOS_DIR="$HOME/vídeos"
local function get_xdg_dir(dirname)
  dirname = string.upper(dirname)
  local handle = io.popen(string.format('xdg-user-dir %s', dirname))
  local result = handle:read '*a'
  handle:close()
  return result:match '^%s*(.-)%s*$'
end

local docs = get_xdg_dir 'documents'
return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    version = '*',
    event = 'VimEnter',
    -- branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
      {
        'LukasPietzschmann/telescope-tabs',
        -- require('telescope-tabs').setup {
        --   close_tab_shortcut_i = '<C-d>',
        --   close_tab_shortcut_n = 'dd',
        -- },
      },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- builtin = {
        --   buffers = {
        --     opts = {
        --       sort_lastused = true,
        --       sort_mru = true,
        --     },
        --   },
        -- },
        defaults = {
          mappings = {
            i = {
              ['<c-enter>'] = 'to_fuzzy_refine',
              ['ii'] = { '<esc>', type = 'command' },
              -- ['<CR>'] = function(bufnr)
              --   require('telescope.actions.set').edit(bufnr, 'tab drop')
              -- end,
              ['<S-CR>'] = function(bufnr)
                require('telescope.actions.set').edit(bufnr, 'tabedit')
              end,
              ['<C-s>'] = function(bufnr)
                require('telescope.actions.set').edit(bufnr, 'vsplit')
              end,
            },
            n = {
              ['ii'] = 'close',
              -- ['<CR>'] = function(bufnr)
              --   require('telescope.actions.set').edit(bufnr, 'drop')
              -- end,
              ['<S-CR>'] = function(bufnr)
                require('telescope.actions.set').edit(bufnr, 'tabedit')
              end,
              ['<C-s>'] = function(bufnr)
                require('telescope.actions.set').edit(bufnr, 'vsplit')
              end,
              ['dd'] = require('telescope.actions').delete_buffer,
            },
          },
          path_display = {
            shorten = 1,
          },
          file_ignore_patterns = {
            '^secret',
            '^secret/',
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enabe Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'telescope-tabs')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sD', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', ':Telescope telescope-tabs list_tabs<CR>',
        { desc = '[ ] Find existing tabs' })
      vim.keymap.set('n', '<leader>sB', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sa', builtin.planets, { desc = 'Use the telescope...' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim Files' })

      vim.keymap.set('n', '<leader>sc', function()
        builtin.find_files { cwd = string.format('%s/.config', os.getenv 'HOME') }
        -- builtin.find_files { cwd = '/home/fugue/.config/' }
      end, { desc = '[S]earch [C]onfig Files' })

      vim.keymap.set('n', '<leader>sv', function()
        builtin.find_files { cwd = string.format('%s/wiki/main/', docs) }
      end, { desc = '[S]earch [W]iki Files' })

      vim.keymap.set('n', '<leader>sl', function()
        builtin.find_files { cwd = '~/.local/bin/' }
      end, { desc = '[S]earch .[L]ocal' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
