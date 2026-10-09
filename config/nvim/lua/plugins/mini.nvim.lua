return {
  'nvim-mini/mini.nvim',
  config = function()
    -- require('mini.pairs').setup()
    require('mini.indentscope').setup()
    require('mini.trailspace').setup()

    -- Fuzzy file picker
    require('mini.pick').setup({
      options = {
        content_from_bottom = true
      },
      window = {
        config = function()
          return {
            width = vim.o.columns,
          }
        end,
      }
    })
    vim.keymap.set('n', '<C-p>', '<Cmd>Pick files<CR>')
  end,
}
