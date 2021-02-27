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

Plug 'mustache/vim-mustache-handlebars'

" search the codebase with rg (ripgrep)
Plug 'jremmen/vim-ripgrep'

Plug 'sotte/presenting.vim'

Plug 'sjl/gundo.vim'

Plug 'airblade/vim-gitgutter'

Plug 'hwartig/vim-seeing-is-believing'

Plug 'dietsche/vim-lastplace'

Plug 'hashivim/vim-terraform'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'cespare/vim-toml'
Plug 'ElmCast/elm-vim'

Plug 'elixir-editors/vim-elixir'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'maxjacobson/vim-fzf-coauthorship'

Plug 'dense-analysis/ale'

Plug 'rhysd/vim-syntax-codeowners'

call plug#end()

" press jk to exit insert mode
inoremap jk <ESC>
inoremap JK <ESC>
let mapleader = ","

" help it do the syntax recognition right
syntax on
filetype on

au BufNewFile,BufRead *.md set filetype=text
au BufNewFile,BufRead *.lock set filetype=text
au BufNewFile,BufRead *.pill set filetype=ruby
au BufNewFile,BufRead *.rabl set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.yml.example set filetype=yaml
au BufNewFile,BufRead *.mj set filetype=yaml

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

" skip startup message
set shortmess+=I

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
" On macOS, it requires `brew install vim`-ing, as the native vim does not
" support it
set clipboard=unnamed,unnamedplus

set hidden

" Don't accidentally enter Ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

" While I'm at it, disable K to lookup man pages
" I never use it on purpose...
nnoremap K <nop>

" Enable seeing-is-believing mappings for Ruby files
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
augroup END

" help make sure quickfix text is readable
highlight Search cterm=NONE ctermfg=white ctermbg=red

let g:lastplace_ignore = "gitcommit,gitrebase,conf"

let g:rustfmt_autosave = 1
let g:terraform_fmt_on_save = "1"

let g:elm_format_autosave = 1

:map <c-p> :FZF<cr>
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

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

nmap <silent> <C-g> :Coauthorship<CR>

" Adding for the sake of making :Rg use smartcase, may have other side-effects
set smartcase

" Help make sure syntax highlighting doesn't get confused halfway thru long
" files
"
" Via https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}

let g:ale_ruby_rubocop_executable = "bundle"
