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

" slim template
Plug 'slim-template/vim-slim'

" trying to get visual find and replace working...
Plug 'osyo-manga/vim-over'

Plug 'wfleming/vim-codeclimate'

Plug 'mustache/vim-mustache-handlebars'

" search the codebase with ag ("the silver searcher")
Plug 'rking/ag.vim'

" haskell stuff
Plug 'begriffs/haskell-vim-now'

Plug 'sotte/presenting.vim'

Plug 'sjl/gundo.vim'

Plug 'airblade/vim-gitgutter'

Plug 'hwartig/vim-seeing-is-believing'

Plug 'fatih/vim-go'

Plug 'dietsche/vim-lastplace'

Plug 'hashivim/vim-terraform'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'cespare/vim-toml'
Plug 'ElmCast/elm-vim'

Plug 'elixir-editors/vim-elixir'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'scss'] }

Plug 'maxjacobson/vim-fzf-coauthorship'
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
nmap <silent> <Leader>/ :let@/=""<CR>

" jump to the list of files with <Leader>e
nmap <silent> <Leader>e :Explore<CR>jj
nnoremap <c-\> :Explore<CR>

"move backup files all into one place
set backup
set backupdir=~/.vim/backup,.
set directory=~/.vim/tmp,.

nnoremap gu :GundoToggle<CR>

" status line
set laststatus=2
"%f = file path
"%l:%c = line and column
"%m file modified flag ([+] when there are unsaved changes)
set statusline=%F\ %l:%c\ %m

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

nmap <Leader>af :CodeClimateAnalyzeCurrentFile<CR>

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

" use system clipboard???
set clipboard=unnamed,unnamedplus

set hidden

" Don't accidentally enter Ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

" While I'm at it, disable K to lookup man pages
" I never use it on purpose...
nnoremap K <nop>

" http://stackoverflow.com/a/1618401
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,txt,text autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Enable seeing-is-believing mappings for Ruby files
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
augroup END

" help make sure quickfix text is readable
highlight Search cterm=NONE ctermfg=white ctermbg=red

let g:lastplace_ignore = "gitcommit,gitrebase,conf"

" run goimports as well as gofmt on save
let g:go_fmt_command = "goimports"
let g:rustfmt_autosave = 1
let g:terraform_fmt_on_save = "1"

" autoload .vimrc upon edit
" H/T @dblandin
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

let g:elm_format_autosave = 1

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

:map <c-p> :FZF!<cr>

set mouse=a

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.scss PrettierAsync

nmap <silent> <C-g> :Coauthorship<CR>
