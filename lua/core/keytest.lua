-- general keymap testing ground
local map = vim.keymap.set

--[[ Testing ]]
--
vim.keymap.set({ 'n' }, '<leader>pq', '<cmd>!echo "normal"<CR>', { desc = 'run normal command' })
vim.keymap.set({ 'v', 'x' }, '<leader>pq', '<cmd>w !echo "visual"<CR>', { desc = 'run visual command' })

-- New Note (WIP)
map('n', '<leader>no', function(title)
  if title == '' or title == nil then
    vim.notify 'Provide a title for the note'
    return
  end
end, { desc = '[N][o]tify - Test Script' })

-- Titlecase (WIP)
--

-- vim.keymap.set('n', 'gz', function()
--   vim.cmd [[s#\v(\w)(\S*)#\u\1\L\2#g]]
--   vim.cmd.nohls()
-- end, { desc = 'Title Case' })

map('n', 'ga', [[<Cmd>s#\v(\w)(\S*)#\u\1\L\2#ge|nohls<CR>$0]], { desc = 'Title Case' })

-- vim.keymap.set('n', '<leader>gz', ":s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>", { desc = 'Title Case' })

-- [{ Diagnostics }] (Tentative)
-- vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- vim.g.diagnostics_active = true
-- function Toggle_diagnostics()
--   if vim.g.diagnostics_active then
--     vim.g.diagnostics_active = false
--     vim.lsp.diagnostic.clear(0)
--     vim.diagnostic.disable()
--     vim.lsp.handlers["textDocuments/publishDiagnostics"] = function() end
--   else
--     vim.g.diagnostics_active = true
--     vim.lsp.handlers["textDocuments/publishDiagnostics"] = vim.lsp.with(
--       vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = true,
--         signs = true,
--         underline = true,
--         update_in_insert = false,
--       }
--     )
--     -- vim.diagnostic.enable()
--   end
-- end
-- map('n', '<leader>xd', Toggle_diagnostics, { desc = "Toggle [D]iagnostics" })

-- Toggle Diagnostics
vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config {
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  }
end, { desc = "toggle_diagnostic" })

-- map('n', '<leader>xd', 'DiagnosticToggle<CR>', {desc = "Toggle [D]iagnostics"})
