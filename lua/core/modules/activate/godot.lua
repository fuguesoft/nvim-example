return {
  { "habamax/vim-godot" },
  {
    "Teatek/gdscript-extended-lsp.nvim",
    opts = {
      doc_file_extension = ".txt",
      view_type = "floating",
      split_side = false,
      keymaps = {
        declaration = "gE",
        close = { "q", "<Esc>" }
      },
    }
  }
}
