return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install {
      'javascript',
      'lua',
      'markdown',
      'ruby',
    }
  end
}
