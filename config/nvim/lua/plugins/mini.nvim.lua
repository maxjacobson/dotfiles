return {
  'nvim-mini/mini.nvim',
  config = function()
    -- require('mini.pairs').setup()
    require('mini.indentscope').setup()
    require('mini.trailspace').setup()
  end,
}
