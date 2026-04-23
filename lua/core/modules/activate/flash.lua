return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
        char = {
          jump_labels = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "R",     mode = { "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "r",     mode = { "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "S",     mode = { "n" },      function() require("flash").jump() end,              desc = "Flash" },
      { "s",     mode = { "n" },      function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "S",     mode = "o",          function() require("flash").remote() end,            desc = "Remote Flash" },
      { "s",     mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" },      function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
}
