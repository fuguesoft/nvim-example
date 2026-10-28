-- peek-nvim.lua
-- I have my config as a separated files.
return {
  "toppair/peek.nvim",
  cmd = { "PeekOpen", "PeekClose" },
  build = "deno task --quiet build:fast",
  keys = {
    {
      "<leader>mp",
      function()
        local peek = require("peek")
        if peek.is_open() then
          vim.cmd("PeekClose")
        else
          vim.cmd("PeekOpen")
        end
      end,
      desc = "Toggle Markdown Preview",
    },
  },
  config = function()
    local peek = require("peek")

    -- need a fix for this besides adding qutebrowser to
    -- environment.systemPackages
    peek.setup({
      app = { 'qutebrowser' }
    })

    vim.api.nvim_create_user_command("PeekOpen", function()
      if not peek.is_open() and vim.bo.filetype == "markdown" then
        -- ignore here if you're not a i3 user...
        -- vim.fn.system("i3-msg split horizontal")
        -- ==========================================
        peek.open()
      end
    end, {})

    vim.api.nvim_create_user_command("PeekClose", function()
      if peek.is_open() then
        peek.close()
        -- ignore here if you're not a i3 user...
        -- vim.fn.system("i3-msg move left")
        -- ==========================================
      end
    end, {})
  end,
}
