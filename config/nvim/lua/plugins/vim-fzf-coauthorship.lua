return {
  'maxjacobson/vim-fzf-coauthorship',
  config = function()
    vim.keymap.set('n', '<C-g>', '<cmd>Coauthorship<cr>')
  end
}
