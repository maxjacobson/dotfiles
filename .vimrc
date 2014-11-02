execute pathogen#infect()

"colorscheme evening

" press jk to exit insert mode
inoremap jk <ESC>
let mapleader = ","

" help it do the syntax recognition right
syntax on
filetype on

au BufNewFile,BufRead *.md set filetype=text
au BufNewFile,BufRead *.pill set filetype=ruby
au BufNewFile,BufRead *.rabl set filetype=ruby
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
au BufRead,BufNewFile *.py set shiftwidth=2
au BufRead,BufNewFile *.py set softtabstop=2
au BufRead,BufNewFile *.py set tabstop=2

" don't go too long!
"
" add a vertical column at 81 characters
" discouraging lines longer than 80 characters, which appear to go into the
set colorcolumn=81
" but it should be 51 in git commit message files
autocmd Filetype gitcommit setlocal colorcolumn=51
highlight ColorColumn ctermbg=3

" autowrap at 80 characters for markdown files
au BufRead,BufNewFile *.md set textwidth=80
au BufRead,BufNewFile *.md set nowrap
" easily reflow text into 80 columns
map ; gqG
" ,; to get a quick word count
nmap <Leader>; :Dispatch wc -w %<CR>

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

"move backup files all into one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"learning from destroyallsotware
" control l inserts a hash rockeT!!!
imap <c-l> <space>=><space>

" Run current file in ruby
nmap <Leader>r :!clear; ruby %<CR>
"
" Run current file in ruby
nmap <Leader>p :!clear; python %<CR>

" Run current file in node
nmap <Leader>j :!clear; node %<CR>

" run current file in cucumer
nmap <Leader>c :!clear; bundle exec cucumber %<CR>

set laststatus=2
"%f = file path
"%l:%c = line and column
"fugitive = git branch
"%m file modified flag
set statusline=[%F\ %l:%c]\ %{fugitive#statusline()}%m

set splitright
set splitbelow

set foldmethod=indent
set nofoldenable
set foldlevel=1
set foldnestmax=10

" skip startup message
set shortmess+=I

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"
