execute pathogen#infect()

"colorscheme evening

" press jk to exit insert mode
inoremap jk <ESC>
let mapleader = ","

" help it do the syntax recognition right
syntax on
filetype on

au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.pill set filetype=ruby
au BufNewFile,BufRead *.yml.example set filetype=yaml

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

"move backup files all into one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"learning from destroyallsotware
" control l inserts a hash rockeT!!!
imap <c-l> <space>=><space>
" ,t runs a test file
map ,t :w\|:!clear; rspec *spec.rb<cr>

" Run current file in ruby
nmap <Leader>r :!clear; ruby %<CR>

" Run current file with pepinoi
nmap <Leader>p :!clear; xvfb-run --auto-servernum --server-num=1 --server-args="-screen 0, 1280x1024x24" bundle exec cucumber %<CR>

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <c-p> :call SelectaCommand("find * -type f", "", ":e")<cr>


set laststatus=2
"%f = file path
"%l:%c = line and column
"fugitive = git branch
"%m file modified flag
set statusline=[%f\ %l:%c]\ %{fugitive#statusline()}%m

set splitright
set splitbelow

