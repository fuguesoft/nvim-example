return {
  "arakkkkk/kanban.nvim",
  -- Optional
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    local map = vim.keymap.set
    require("kanban").setup({
      markdown = {
        description_folder = "./tasks/", -- Path to save the file corresponding to the task.
        list_head = "## ",
      },
      -- create kanban in parent dir if non-existent
      -- otherwise open existent kanban
      map('n', '<leader>nk',
        function()
          function file_exists(name)
            local f = io.open(name, "r")
            if f ~= nil then
              io.close(f)
              return true
            else
              return false
            end
          end

          local board_path = vim.fn['expand'] '%:p'
          local board_location = string.gsub(board_path, '(.*)/(.*)/.*', '%1/%2/%2-kanban')
          -- local board_file = board_location .. "-kanban"
          local board = board_location .. ".md"
          local message = 'board created at: ' .. board
          if board_path ~= "" then
            -- vim.notify(string.format('loc: %s', board_location))
            -- vim.notify(string.format('path: %s', board))
            -- needs check for file existence
            if not file_exists(board) then
              -- vim.notify(string.format('return: %s', file_exists(board)))
              vim.notify(message)
              vim.cmd(string.format(':KanbanCreate %s', board_location))
            else
              vim.cmd(string.format(':KanbanOpen %s', board))
            end
          else
            vim.print('no file loaded in buffer!')
          end
        end,
        { desc = "Create Kanban" }),
      -- open kanban at specified path
      -- map('n', '<leader>ok', function()
      --     vim.cmd(string.format(':KanbanOpen '))
      --   end,
      --   { desc = '[O]pen [K]anban' })
    })
  end,
}
