return {
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.g.fzf_layout = {down = '50%'}

      vim.g.fzf_colors = {
        fg = {'fg', 'Normal'},
        bg = {'bg', 'Normal'},
        hl = {'fg', 'Comment'},
        ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
        ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
        ['hl+'] = {'fg', 'Statement'},
      }

      vim.keymap.set('n', '<C-p>', '<cmd>Files<cr>', { desc = 'Find files' })
    end,
  },
}
