execute pathogen#infect()

" help it do the syntax recognition right
syntax on
filetype on

au BufNewFile,BufRead *.md set filetype=markdown

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

set number
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
set listchars=tab:>.,trail:⠐,extends:#,nbsp:.

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

"clear search with ,/
nmap <silent> ,/ :let@/=""<CR>

"learning from destroyallsotware
" control l inserts a hash rockeT!!!
imap <c-l> <space>=><space>
" ,t runs a test file
map ,t :w\|:!clear; rspec *spec.rb<cr>
map ,r :w\|:!clear; ruby *.rb<cr>