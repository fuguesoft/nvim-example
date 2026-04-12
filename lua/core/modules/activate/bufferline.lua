return {
  -- using lazy.nvim
  {
    'akinsho/bufferline.nvim',
    -- enabled = false,
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      highlights = {
        fill = {
          bg = 'none',
        },
      },
      options = {
        mode = 'tabs',
        -- style_preset = bufferline.style_preset.minimal,
        name_formatter = function(buf)
          return buf.name
        end,
        numbers = 'none',
        truncate_names = true,
        -- separator_style = { '•', '•' },
        -- separator_style = 'thin',
        -- separator_style = { '|', '|' },
        separator_style = { '//', '//' },
        -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        indicator = {
          icon = '&',
          style = 'icon',
        },
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
        enforce_regular_tabs = false,
      },
    },
  },
}
