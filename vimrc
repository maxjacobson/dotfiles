" Using this vimrc:
"
" Install vim plug: https://github.com/junegunn/vim-plug#usage
" run: mkdir ~/.vim/backup
" run: mkdir ~/.vim/tmp
" copy this code to ~/.vimrc
" open this file in vim
" run :PlugInstall
call plug#begin('~/.vim/plugged')

" sensible defaults
Plug 'tpope/vim-sensible'

" project-wide find and replace
Plug 'Olical/vim-enmasse'

" rust syntax highlighting, auto-formatting etc
Plug 'rust-lang/rust.vim'

" using to pull current git branch into status bar
Plug 'tpope/vim-fugitive'

" useful for tab completing
Plug 'ervandew/supertab'

" not sure if I use this
Plug 'tpope/vim-bundler'

" useful for quickly commenting code
Plug 'tpope/vim-commentary'

" useful for auto-ending ruby methods/classes/blocks
Plug 'tpope/vim-endwise'

" not sure if I use this one
Plug 'tpope/vim-eunuch'

" search the codebase with rg (ripgrep)
Plug 'jremmen/vim-ripgrep'

" Visualizes recent changes so you can undo with confidence
Plug 'sjl/gundo.vim'

" Adds a column on the left indicating which lines have changed
Plug 'airblade/vim-gitgutter'

" Remembers where your cursor was in each file and takes you there
Plug 'dietsche/vim-lastplace'

" Syntax highlighting for terraform .tf files
Plug 'hashivim/vim-terraform'

" Syntax highlighting for javascript files
Plug 'pangloss/vim-javascript'

" Syntax highlighting for jsx files
Plug 'mxw/vim-jsx'

" Syntax highlighting for toml config files
Plug 'cespare/vim-toml'

" Syntax highlighting for elm files
Plug 'ElmCast/elm-vim'

" Syntax highlighting for TypeScript files
Plug 'leafgarland/typescript-vim'

" Syntax highlighting for .tsx files
Plug 'peitalin/vim-jsx-typescript'

" Fuzzy file finder to open files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Insert Co-Authored-By lines into commit messages
Plug 'maxjacobson/vim-fzf-coauthorship'

" Asynchronous Lint Engine, for invoking things like rubocop, eslint, and
" prettier automatically
Plug 'dense-analysis/ale'

" Syntax-highlighting for .github/CODEOWNERS files
Plug 'rhysd/vim-syntax-codeowners'

" Auto-resizes splits
Plug 'roman/golden-ratio'

" Also need to manually run
" :CocInstall coc-tsserver
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" press jk to exit insert mode
inoremap jk <ESC>
inoremap JK <ESC>
let mapleader = ","

" help it do the syntax recognition right
syntax on
filetype on

au BufNewFile,BufRead *.jbuilder set filetype=ruby

if $COLORTERM == 'truecolor'
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  colorscheme smyck
endif

" smart backspacing
set backspace=indent,eol,start

" smart indents
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
au BufRead,BufNewFile *.rb set shiftwidth=2
au BufRead,BufNewFile *.rb set softtabstop=2
au BufRead,BufNewFile *.rb set tabstop=2
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set softtabstop=4
au BufRead,BufNewFile *.py set tabstop=4
au BufRead,BufNewFile *.tsx set shiftwidth=2
au BufRead,BufNewFile *.tsx set softtabstop=2
au BufRead,BufNewFile *.tsx set tabstop=2

set number " show line numbers
set showcmd " shows commands (try `55 j` for example and look in the bottom right)
set ignorecase " ignores case when search
set hlsearch " highlights search

" this chunk makes it so lines wrap nicely without chopping words in half
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

set list
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

"clear search with <Leader>/
nmap <silent> <Leader>/ :nohlsearch<CR>

" jump to the list of files with <Leader>e
nmap <silent> <Leader>e :Explore<CR>jj
nnoremap <c-\> :Explore<CR>

"move backup files all into one place
set backup
set backupdir=~/.vim/backup,.
set directory=~/.vim/tmp,.

nnoremap gu :GundoToggle<CR>


function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" status line
set laststatus=2
"%f = file path
"%l:%c = line and column
"%m file modified flag ([+] when there are unsaved changes)
set statusline=%F\ %l:%c\ %m\ %{LinterStatus()}


" editing
set nowrap

" splitting
set splitright
set splitbelow

" folding
set foldmethod=indent
set nofoldenable
set foldlevel=1
set foldnestmax=10

" Tab mappings.
" via https://github.com/edgibbs/.vim/blob/master/vimrc#L55-L64
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" hide the giant banner at the top of netrw
let g:netrw_banner=0

" when selecting a file from netrw, how large to make the new window
" (hint: press o or v to open the file in a split)
let g:netrw_winsize=85

" via toranb dotfiles
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction

" use system clipboard
" N.B. if you switch to neovim, you should change this to
" set clipboard=unnamed,unnamedplus
set clipboard=unnamed

set hidden

" Don't accidentally enter Ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

" While I'm at it, disable K to lookup man pages
" I never use it on purpose...
nnoremap K <nop>

" help make sure quickfix text is readable
highlight Search cterm=NONE ctermfg=white ctermbg=red

let g:lastplace_ignore = "gitcommit,gitrebase,conf"

let g:rustfmt_autosave = 1
let g:terraform_fmt_on_save = "1"

let g:elm_format_autosave = 1

" Invokes fzf.vim's fuzzy file picker
:map <c-p> :Files<cr>

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '50%' }

set mouse=a

nmap <silent> <C-g> :Coauthorship<CR>

" Adding for the sake of making :Rg use smartcase, may have other side-effects
set smartcase

" Help make sure syntax highlighting doesn't get confused halfway thru long
" files
"
" Via https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" use actual tabs over spaces when editing ~/.gitconfig
autocmd FileType gitconfig setlocal noexpandtab

let g:ale_linters_explicit = 1
let g:ale_linters= {
\   'ruby': ['rubocop', 'sorbet', 'standardrb'],
\   'javascript': ['prettier', 'eslint', 'stylelint'],
\   'typescript': ['prettier', 'eslint'],
\   'jsx': ['stylelint', 'eslint'],
\   'scss': ['stylelint'],
\}

let g:ale_fixers = {
\   'ruby': ['rubocop', 'standardrb'],
\   'javascript': ['prettier'],
\   'jsx': ['prettier'],
\   'scss': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\}

let g:ale_ruby_rubocop_executable = "bin/rubocop"
let g:ale_ruby_standardrb_executable = "bin/standardrb"
let g:ale_fix_on_save = 1
