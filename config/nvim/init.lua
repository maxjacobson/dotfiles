require("config.lazy")

-- editing miscellany
vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.textwidth = 120
vim.cmd('colorscheme smyck')
vim.opt.ignorecase = true -- ignores case when search


-- copy and paste
vim.opt.clipboard = "unnamedplus"

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- indentation
vim.cmd('filetype plugin indent on')
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- tab management
vim.keymap.set('n', '<leader>tt', ':tabnew<cr>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<cr>', { desc = 'Previous tab' })

-- exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { silent = true, desc = 'Exit insert mode' })
vim.keymap.set('i', 'JK', '<ESC>', { silent = true, desc = 'Exit insert mode' })

-- clear search
vim.keymap.set('n', '<leader>/', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Move by visual lines instead of actual lines
vim.keymap.set({'n', 'v'}, 'j', 'gj', { desc = 'Move down by visual line' })
vim.keymap.set({'n', 'v'}, 'k', 'gk', { desc = 'Move up by visual line' })

-- folding
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.foldnestmax = 10

-- ruby
vim.filetype.add({
  extension = {
    jbuilder = 'ruby',
  },
})
