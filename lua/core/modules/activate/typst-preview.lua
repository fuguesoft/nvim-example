return {
  'chomosuke/typst-preview.nvim',
  -- lazy = false, -- or ft = 'typst'
  ft = 'typst',
  debug = true,
  version = '1.*',
  dependencies_bin = { tinymist = 'tinymist' },
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`
}
