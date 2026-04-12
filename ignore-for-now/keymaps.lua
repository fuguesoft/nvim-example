-- [[ Directories ]]
-- user dirs

function get_xdg_dir(dirname)
  dirname = string.upper(dirname)
  local handle = io.popen(string.format('xdg-user-dir %s', dirname))
  local result = handle:read '*a'
  handle:close()
  return result:match '^%s*(.-)%s*$'
end

local desk = get_xdg_dir 'desktop'
local music = get_xdg_dir 'music'
local docs = get_xdg_dir 'documents'
local download = get_xdg_dir 'download'
local pics = get_xdg_dir 'pictures'
local share = get_xdg_dir 'publicshare'
local template = get_xdg_dir 'templates'
local vids = get_xdg_dir 'videos'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Running code
vim.keymap.set('n', '<leader><leader>x', ':source ~/.config/nvim/init.lua<CR>')

-- determine fileype and run the file accordingly. One keymap for all the codes!
vim.keymap.set('n', '<leader>nl', ':%lua<CR>')
vim.keymap.set('v', '<leader>nl', ':lua<CR>')
vim.keymap.set('n', '<leader>np', ':.py<CR>')
vim.keymap.set('v', '<leader>np', ':py<CR>')

-- Saving and Quitting
vim.keymap.set('n', '<leader>A', ':qa!<CR>', { desc = 'Force [Q]uit [A]ll without saving' })
vim.keymap.set('n', '<leader>cc', ':bd!<CR>', { desc = '[C]lear Buffer' })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = 'Force [Q]uit Window' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = '[Q]uit Window' })
vim.keymap.set('n', '<leader>W', ':wq<CR>', { desc = '[W]rite and [Q]uit' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = '[W]rite' })
-- if last window, q! else tabclose!
vim.keymap.set('n', '<leader><leader>d', ':q!', { desc = 'Force [Q]uit Window' })
vim.keymap.set('n', '<leader><leader>a', ':qa!', { desc = 'Force [Q]uit [A]ll without saving' })

--[[ Window Managment ]]
--
--  See `:help wincmd` for a list of all window commands

-- New window
vim.keymap.set('n', '<leader>v', ':vnew<CR>', { desc = '[V]ertical [S]plit' })

--  Focus windows
--  Use CTRL+<hjkl> to switch window focus
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Shift windows
--  Use ALT+<hjkl> to shift window position
vim.keymap.set('n', '<A-H>', '<C-w>H', { desc = 'Move window left' })
vim.keymap.set('n', '<A-L>', '<C-w>L', { desc = 'Move window right' })
vim.keymap.set('n', '<A-J>', '<C-w>J', { desc = 'Move window down' })
vim.keymap.set('n', '<A-K>', '<C-w>K', { desc = 'Move window up' })

-- Resize windows
--
vim.keymap.set('n', '<A-w>', '<C-w>=', { desc = 'Windows Resize Equal' })
vim.keymap.set('n', '<C-º>', '<C-W><', { desc = 'Window Width Resize -1' })
vim.keymap.set('n', '<C-S-ª>', '<C-W>>', { desc = 'Window Width Resize +1' })
vim.keymap.set('n', '<C-ñ>', '<C-W>-', { desc = 'Window Height Resize -1' })
vim.keymap.set('n', '<C-S-Ñ>', '<C-W>+', { desc = 'Window Height Resize +1' })

-- [[ Tab Management ]]
--
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = '[T]ab [O]pen' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = '[T]ab [C]lose' })
vim.keymap.set('n', '<leader>tx', ':tabonly<CR>', { desc = '[T]ab [X]only' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = '[T]ab [N]ext' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = '[T]ab [P]revious' })

vim.keymap.set('n', '<A-t>', ':tabnew<CR>', { desc = '[T]ab [O]pen' })
vim.keymap.set('n', '<A-d>', ':tabclose<CR>', { desc = '[T]ab [C]lose' })
vim.keymap.set('n', '<A-.>', ':tabn<CR>', { desc = '[T]ab [N]ext' })
vim.keymap.set('n', '<A-,>', ':tabp<CR>', { desc = '[T]ab [P]revious' })

vim.keymap.set('n', '<A-S-.>', ':tabm +1<CR>', { desc = 'Move Tab Right' })
vim.keymap.set('n', '<A-S-,>', ':tabm -1<CR>', { desc = 'Move Tab Left' })
vim.keymap.set('n', '<A-C-.>', ':tabm +1<CR>', { desc = 'Move Tab Right' })
vim.keymap.set('n', '<A-C-,>', ':tabm -1<CR>', { desc = 'Move Tab Left' })

-- [[ Buffer Management ]]
--
vim.keymap.set('n', '<leader>bc', ':bd!<CR>', { desc = '[B]uffer [C]lose' })

-- [[ Navigation ]]
--
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous result (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
vim.keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'Page down (centered)' })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'Page up (centered)' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnotic message' })
vim.keymap.set('n', 'd]', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnotic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnotic [E]rror message' })
vim.keymap.set('n', '<leader><leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', 'gK', '<cmd>norm! K<CR>', { desc = 'Open code help' })

-- Exit insert mode
vim.keymap.set('i', 'ii', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', '<A-Space>', '<Esc>', { desc = 'Exit visual mode' })
vim.keymap.set('v', 'ii', '<Esc>', { desc = 'Exit visual mode' })
vim.keymap.set('v', '<A-Space>', '<Esc>', { desc = 'Exit visual mode' })

vim.keymap.set('c', 'ii', '<Esc><Esc>', { desc = 'Exit command mode' })
vim.keymap.set('c', '<A-Space>', '<Esc>', { desc = 'Exit command mode' })

-- [[ Git ]]
--
vim.keymap.set('n', '<leader>g', ':Git<CR>')

-- [[ Line edit ]]
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'move line down' })
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'move line up' })

--[[ Disable Arrow Keys ]]
--
-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Disable arrow keys in insert mode
vim.keymap.set('i', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('i', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Disable arrow keys in visual mode
vim.keymap.set('v', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('v', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('v', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('v', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--[[ Yanking ]]
--
-- Copy to clipboard
vim.keymap.set('n', '<leader>yf', ":let @+=expand('%:t')<CR>", { desc = 'yank file name' }) -- yank file name
vim.keymap.set('n', '<leader>yp', ":let @+=expand('%:p')<CR>", { desc = 'yank file path' }) -- yank file path
vim.keymap.set('n', '<leader>yd', ":let @+=expand('%:p:h')<CR>", { desc = 'yank directory path' }) -- yank directory path
vim.keymap.set('n', '<leader>yg', ":!cat '%:p' | wl-copy<CR>", { desc = 'yank file contents' })

--[[ Pastebins ]]
-- Fish
vim.keymap.set('n', '<leader>pp', ':!paste-pick -p %<CR>', { desc = 'paste file to paste.c-net.org' }) -- paste.c-net.org
vim.keymap.set('n', '<leader>pt', ':!paste-pick -t %<CR>', { desc = 'paste file to termbin.com' }) -- termbin.com
vim.keymap.set('n', '<leader>pn', ':!paste-pick -z %<CR>', { desc = 'paste file to 0x0.st' }) -- 0x0.st

vim.keymap.set({ 'v', 'x' }, '<leader>pp', ':w !paste-pick -p<CR>', { desc = 'paste lines to paste.c-net.org' }) -- paste.c-net.org
vim.keymap.set({ 'v', 'x' }, '<leader>pt', ':w !paste-pick -t<CR>', { desc = 'paste lines to termbin.com' }) -- termbin.com
vim.keymap.set({ 'v', 'x' }, '<leader>pn', ':w !paste-pick -z<CR>', { desc = 'paste lines to 0x0.st' }) -- 0x0.st

-- Bash

vim.keymap.set('n', '<leader>pe', ':!paste-pick.sh -p %<CR>', { desc = 'paste file to paste.c-net.org' }) -- paste.c-net.org
vim.keymap.set('n', '<leader>pr', ':!paste-pick.sh -t %<CR>', { desc = 'paste file to termbin.com' }) -- termbin.com
vim.keymap.set('n', '<leader>pb', ':!paste-pick.sh -z %<CR>', { desc = 'paste file to 0x0.st' }) -- 0x0.st

vim.keymap.set({ 'v', 'x' }, '<leader>pe', ':w !paste-pick.sh -p<CR>', { desc = 'paste lines to paste.c-net.org' }) -- paste.c-net.org
vim.keymap.set({ 'v', 'x' }, '<leader>pr', ':w !paste-pick.sh -t<CR>', { desc = 'paste lines to termbin.com' }) -- termbin.com
vim.keymap.set({ 'v', 'x' }, '<leader>pb', ':w !cat<CR>', { desc = 'paste lines to 0x0.st' }) -- 0x0.st

--[[ Testing ]]
--
vim.keymap.set({ 'n' }, '<leader>pq', '<cmd>!echo "normal"<CR>', { desc = 'run normal command' })
vim.keymap.set({ 'v', 'x' }, '<leader>pq', '<cmd>w !echo "visual"<CR>', { desc = 'run visual command' })

--[[ File Browsing ]]
--
-- Oil Open in floating window w/ preview
--  TODO:
-- Find out what event Oil sends when closing without selecting a file
-- Use that signal to restore the previous buffer before Oil was opened
-- Possible candidates:
-- oil.open()
-- oil.select()
-- oil.close()
-- oil.get_cursor_entry()
vim.keymap.set('n', '<leader>op', function()
  local oil = require 'oil'
  local util = require 'oil.util'
  local file_name = vim.fn.bufname()
  local nil_file = #file_name == 0 and file_name == ''
  local before_open = function()
    print ''
  end

  -- Set before_open based on buffer state
  if nil_file then
    before_open = function()
      vim.cmd 'bd!'
    end
  else
    before_open = function()
      vim.cmd 'tabnew'
    end
  end

  before_open()
  oil.open_float()
  util.run_after_load(0, function()
    oil.open_preview()
  end)
end, { desc = 'Float Oil w/ [P]review' })

-- Oil open and replace
-- vi.keymap.set('n', '<leader>of', '<cmd>Oil<CR>', { desc = 'Open parent directory' })

vim.keymap.set('n', '<leader>od', function()
  local oil = require 'oil'
  local util = require 'oil.util'
  local actions = require 'oil.actions'
  oil.open()
  util.run_after_load(0, function()
    actions.cd '%:h'
  end)
end, { desc = 'Open parent directory with preview' })

vim.keymap.set('n', '<leader>of', function()
  local oil = require 'oil'
  local util = require 'oil.util'
  oil.open()
  util.run_after_load(0, function()
    oil.open_preview()
  end)
end, { desc = 'Open parent directory with preview' })

-- Open oil in split
vim.keymap.set('n', '<leader>os', '<cmd>topleft 35 vs | Oil<cr>', { desc = 'Open oil in split' })

-- TODO:
-- Get current buffer
-- make vsplit max 30%
-- push preview window to current buffer or new tab
-- open selected file in currept buffer

--[[ Vimwiki ]]
--
vim.keymap.set('n', '<leader>wi', ':VimwikiIndex<CR>', { desc = 'Open Vimwiki Index' })
vim.keymap.set('n', '<leader>wt', ':VimwikiTabIndex<CR>', { desc = '[T]ab Open Vimwiki Index' })
vim.keymap.set('n', '<leader>ws', ':VimwikiUISelect<CR>', { desc = 'Vimwiki [S]elect Branch' })
vim.keymap.set('n', '<leader>wd', ':VimwikiDeleteFile<CR>')
vim.keymap.set('n', '<leader>wr', ':VimwikiRenameFile<CR>', { desc = 'Rename Vimwiki File' })
vim.keymap.set('n', '<CR>', ':VimwikiTabDropLink<CR>', { desc = 'Create/Follow Link to Wiki Page' })
vim.keymap.set('n', '<leader>w<leader>w', ':VimwikiMakeDiaryNote<CR>', { desc = 'Open Current Date Diary Entry' })
vim.keymap.set('n', '<leader>w<leader>t', ':VimwikiTabMakeDiaryNote<CR>', { desc = 'Open Current Date Diary Entry' })
vim.keymap.set('n', '<S-up>', ':VimwikiDiaryPrevDay<CR>', { desc = 'Open Previous Day Diary Entry' })
vim.keymap.set('n', '<S-down>', ':VimwikiDiaryNextDay<CR>', { desc = 'Open Next Day Diary Entry' })
vim.keymap.set('n', '<leader>wn', ':VimwikiGoto<CR>', { desc = '[N]ew [W]iki File' })

-- New Issue
vim.keymap.set('n', '<leader>ni', function()
  -- Load Vimwiki (hack to register file)
  vim.cmd 'VimwikiIndex'

  -- Get file name from user
  vim.ui.input({ prompt = 'New issue file name: issue-' }, function(input)
    -- Create file
    if input ~= nil then
      -- Construct filepath
      local issue_base_path = '/home/fugue/documentos/wiki/main/issue-'
      local new_issue_filename = input
      local new_issue_full_path = string.format('%s%s.md', issue_base_path, new_issue_filename)

      vim.cmd.write { new_issue_full_path }

      -- read base template file contents into string
      local issue_template = io.open('/home/fugue/documentos/wiki/main/issue-template.md', 'r')
      if issue_template ~= nil then
        local issue_text = issue_template:read '*a'
        issue_text = string.format('# %s\n\n%s', new_issue_filename, issue_text)
        issue_template:close()

        -- dump read contents to new issue file
        local outfile = io.open(new_issue_full_path, 'w')
        if outfile ~= nil then
          outfile:write(issue_text)
          outfile:close()
        end
      end

      -- open file
      vim.cmd.edit { new_issue_full_path }
    else
      print 'No filename input'
    end
  end)
end, { desc = '[N]ew [I]ssue' })

-- New Note (WIP)
vim.keymap.set('n', '<leader>no', function(title)
  if title == '' or title == nil then
    vim.notify 'Provide a title for the note'
    return
  end
end, { desc = '[N][o]tify - Test Script' })

vim.keymap.set('n', '<leader>w<leader>n', ':VimwikiTabIndex<CR> :VimwikiGoto<CR>', { desc = '[N]ew [W]iki File' })

-- Template Files

-- Tasks
-- To Do
-- Append current date on open if current date not present
--
vim.keymap.set('n', '<leader>wx', string.format(':50 vs %s/wiki/main/global-task.md<CR>', docs), { desc = 'Open Global Task List' })

--[[ Substitution ]]
--
vim.keymap.set('n', '<leader>rs', ':%s///g<left><left><left>', { desc = '[R]eplace [G]lobal' }) -- substitute
vim.keymap.set('n', '<leader>rc', ':%s///gc<left><left><left><left>', { desc = '[R]eplace Global [C]onfirm' }) -- substitute w/ confirmation

--[[ Spell Check ]]
--
vim.keymap.set('n', '<leader>ce', ':setlocal spell! spelllang=en_US<CR>')
vim.keymap.set('n', '<leader>cs', ':setlocal spelllang=es<CR>')

-- Titlecase (WIP)
--

-- vim.keymap.set('n', 'gz', function()
--   vim.cmd [[s#\v(\w)(\S*)#\u\1\L\2#g]]
--   vim.cmd.nohls()
-- end, { desc = 'Title Case' })

vim.keymap.set('n', 'ga', [[<Cmd>s#\v(\w)(\S*)#\u\1\L\2#ge|nohls<CR><$>]], { desc = 'Title Case' })

-- vim.keymap.set('n', '<leader>gz', ":s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>", { desc = 'Title Case' })

--[[ Markdown Preview ]]
--
vim.keymap.set('n', '<leader>md', ':PeekOpen<CR>')
vim.keymap.set('n', '<leader>mx', ':PeekClose<CR>')

-- Change directory
vim.keymap.set('n', '<leader>cd', function()
  local directory = vim.fn['expand'] '%:h'
  vim.cmd(string.format('tcd %s', directory))
  print(string.format('working dir: %s', directory))
  return {}
end)

return {}
