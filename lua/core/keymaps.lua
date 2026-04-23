-- keymaps.lua
local configFile = "/home/fugue/.config/nvim/init.lua"
local map = vim.keymap.set
-- old rhs
-- ':update /home/fugue/.config/nvim/init.lua<CR>:source /home/fugue/.config/nvim/init.lua<CR>'
map(
  'n',
  '<leader>so',
  ':update ' .. configFile .. '<CR>:source' .. configFile .. '<CR>',
  {}
)

-- [[ State Management ]]
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>W', ':wq<CR>')
map('n', '<leader>q', ':quit<CR>', { desc = "[Q]uit" })
map('n', '<leader>Q', ':quit!<CR>', { desc = "Force [Q]uit" })
map('n', '<leader>A', ':qa!<CR>', { desc = 'Force Quit [A]ll without saving' })
map('n', '<leader>R', ':restart<CR>', { desc = "[R]estart neovim" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "[F]ormat buffer" })

-- Windows
map('n', '<leader>v', ':vnew<CR>', { desc = '[V]ertical [S]plit' })

-- Tabs
map('n', '<A-t>', ':tabnew<CR>', { desc = '[T]ab [O]pen' })
map('n', '<A-d>', ':tabclose<CR>', { desc = '[T]ab [O]pen' })
map('n', '<A-.>', ':tabn<CR>', { desc = '[T]ab [N]ext' })
map('n', '<A-,>', ':tabp<CR>', { desc = '[T]ab [P]revious' })

map('n', '<A-S-.>', ':tabm +1<CR>', { desc = 'Move Tab Right' })
map('n', '<A-S-,>', ':tabm -1<CR>', { desc = 'Move Tab Left' })
map('n', '<A-C-.>', ':tabm +1<CR>', { desc = 'Move Tab Right' })
map('n', '<A-C-,>', ':tabm -1<CR>', { desc = 'Move Tab Left' })

-- Buffers
map('n', '<leader>D', ':bd!<CR>', { desc = "[B]uffer [D]elete" })

-- Navigation
map('n', 'n', 'nzzzv', { desc = 'Next result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous result (centered)' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
map('n', '<C-f>', '<C-f>zz', { desc = 'Page down (centered)' })
map('n', '<C-b>', '<C-b>zz', { desc = 'Page up (centered)' })

--[[ vi4lyfe ]]
--
-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Disable arrow keys in insert mode
map('i', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('i', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('i', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('i', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Disable arrow keys in visual mode
map('v', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('v', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('v', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('v', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Esc
map('i', 'ii', '<Esc>')
map('i', 'jk', '<Esc>')
map('i', 'kj', '<Esc>')
map('v', 'ii', '<Esc>')
map('c', 'ii', '<Esc>')
map('n', '<Esc>', ':nohl<CR>')
-- map('n', '<Esc>', '<cmd>nohlsearch<CR>')

--[[ Yanking ]]
--
-- Copy to clipboard
map('n', '<leader>yf', ":let @+=expand('%:t')<CR>", { desc = 'yank file name' })
map('n', '<leader>yp', ":let @+=expand('%:p')<CR>", { desc = 'yank file path' })
map('n', '<leader>yd', ":let @+=expand('%:p:h')<CR>", { desc = 'yank directory path' })
map('n', '<leader>yg', ":!cat '%:p' | wl-copy<CR>", { desc = 'yank file contents' })

--[[ Pastebins ]]
-- Fish
map('n', '<leader>pp', ':!paste-pick -p %<CR>', { desc = 'paste file to paste.c-net.org' })           -- paste.c-net.org
map('n', '<leader>pt', ':!paste-pick -t %<CR>', { desc = 'paste file to termbin.com' })               -- termbin.com
map('n', '<leader>pn', ':!paste-pick -z %<CR>', { desc = 'paste file to 0x0.st' })                    -- 0x0.st

map({ 'v', 'x' }, '<leader>pp', ':w !paste-pick -p<CR>', { desc = 'paste lines to paste.c-net.org' }) -- paste.c-net.org
map({ 'v', 'x' }, '<leader>pt', ':w !paste-pick -t<CR>', { desc = 'paste lines to termbin.com' })     -- termbin.com
map({ 'v', 'x' }, '<leader>pn', ':w !paste-pick -z<CR>', { desc = 'paste lines to 0x0.st' })          -- 0x0.st

-- Bash
map('n', '<leader>pe', ':!paste-pick.sh -p %<CR>', { desc = 'paste file to paste.c-net.org' })           -- paste.c-net.org
map('n', '<leader>pr', ':!paste-pick.sh -t %<CR>', { desc = 'paste file to termbin.com' })               -- termbin.com
map('n', '<leader>pb', ':!paste-pick.sh -z %<CR>', { desc = 'paste file to 0x0.st' })                    -- 0x0.st

map({ 'v', 'x' }, '<leader>pe', ':w !paste-pick.sh -p<CR>', { desc = 'paste lines to paste.c-net.org' }) -- paste.c-net.org
map({ 'v', 'x' }, '<leader>pr', ':w !paste-pick.sh -t<CR>', { desc = 'paste lines to termbin.com' })     -- termbin.com
map({ 'v', 'x' }, '<leader>pb', ':w !cat<CR>', { desc = 'paste lines to 0x0.st' })                       -- 0x0.st

map('n', 'gK', '<cmd>norm! K<CR>', { desc = 'Open code help' })

-- [[ File Type ]]
-- Markdown
map('n', '<leader>M', 'eBi[<esc>Ea]()<left><esc>p', { desc = "MD: Create link on current word" })
map({ 'v', 'x' }, '<leader>M', "I[<esc>gvlA]()<esc><left>p", { desc = "MD: Create link on current selection" })

-- problem: this replaces the link I may or may not have in my clipboard with
-- the (c)hanged text
-- map('v', '<leader>M', 'c[]()<esc>F[pf(a', { desc = "MD: Create link on current word" })
-- map('v', '<leader>M', ":s/.*/[&]()<CR><left>p", { desc = "MD: Create link on current word" })
-- map('v', '<leader>M', ":s'<,.*>:[&]()/g<CR><left>p", { desc = "MD: Create link on current word" })

--[[ Substitution ]]
--
map('n', '<leader>rs', ':%s///g<left><left><left>', { desc = '[R]eplace [G]lobal' })                -- substitute
map('n', '<leader>rc', ':%s///gc<left><left><left><left>', { desc = '[R]eplace Global [C]onfirm' }) -- substitute w/ confirmation

--[[ Spell Check ]]
--
map('n', '<leader>ce', ':setlocal spell! spelllang=en_US<CR>')
map('n', '<leader>cs', ':setlocal spelllang=es<CR>')

-- [[ Plugins ]] --
-- Oil
map('n', '<leader>of', function()
  local oil = require 'oil'
  local util = require 'oil.util'
  oil.open()
  util.run_after_load(0, function()
    oil.open_preview()
  end)
end, { desc = "Open parent directory with preview" })

-- Open oil in split
map('n', '<leader>os', '<cmd>topleft 35 vs | Oil<cr>', { desc = 'Open oil in split' })

-- Change directory
map('n', '<leader>cd', function()
  local directory = vim.fn['expand'] '%:h'
  vim.cmd(string.format('tcd %s', directory))
  print(string.format('working dir: %s', directory))
  return {}
end)

-- Vimwiki
map('n', '<leader>wi', ':VimwikiIndex<CR>', { desc = 'Open Vimwiki Index' })
map('n', '<leader>wt', ':VimwikiTabIndex<CR>', { desc = '[T]ab Open Vimwiki Index' })
map('n', '<leader>ws', ':VimwikiUISelect<CR>', { desc = 'Vimwiki [S]elect Branch' })
map('n', '<leader>wd', ':VimwikiDeleteFile<CR>')
map('n', '<leader>wr', ':VimwikiRenameFile<CR>', { desc = 'Rename Vimwiki File' })
map('n', '<CR>', ':VimwikiTabDropLink<CR>', { desc = 'Create/Follow Link to Wiki Page' })
map('n', '<leader>w<leader>w', ':VimwikiMakeDiaryNote<CR>', { desc = 'Open Current Date Diary Entry' })
map('n', '<leader>w<leader>t', ':VimwikiTabMakeDiaryNote<CR>', { desc = 'Open Current Date Diary Entry' })
map('n', '<S-up>', ':VimwikiDiaryPrevDay<CR>', { desc = 'Open Previous Day Diary Entry' })
map('n', '<S-down>', ':VimwikiDiaryNextDay<CR>', { desc = 'Open Next Day Diary Entry' })
map('n', '<leader>wn', ':VimwikiGoto<CR>', { desc = '[N]ew [W]iki File' })

-- New Issue
map('n', '<leader>ni', function()
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

map('n', '<leader>w<leader>n', ':VimwikiTabIndex<CR> :VimwikiGoto<CR>', { desc = '[N]ew [W]iki File' })
