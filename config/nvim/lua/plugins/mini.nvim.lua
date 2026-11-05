return {
  'nvim-mini/mini.nvim',
  config = function()
    -- adds closing quotes/brackets automatically
    -- ` is set to false so backtick never autopairs
    require('mini.pairs').setup({
      mappings = {
        ['`'] = false,
      },
    })

    -- help visualize indentation
    require('mini.indentscope').setup()

    -- Highlight trailing whitespace
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
