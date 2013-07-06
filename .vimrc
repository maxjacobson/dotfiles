execute pathogen#infect()

color solarized

" help it do the syntax recognition right
syntax on
filetype on

" teach it some file extensions it doesn't know
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.ft set filetype=markdown
au BufNewFile,BufRead *.fountain set filetype=fountain
au BufNewFile,BufRead *.fou set filetype=fountain
au BufRead,BufNewFile *.scss set filetype=scss

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

" add line numbers, except for prosey stuff
set number
au BufRead,BufNewFile *.fou set nonumber
au BufRead,BufNewFile *.fountain set nonumber
au BufRead,BufNewFile *.md set nonumber

set showcmd " shows commands (try `55 j` for example and look in the bottom right)
set ignorecase " ignores case when search
set hlsearch " highlights search

" moves the backup files all into one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" this chunk makes it so lines wrap nicely without chopping words in half
" great for markdown/fountain, I think good for everything else too
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" Remove any trailing whitespace that is in the file
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

set list
set listchars=tab:>.,trail:⠐,extends:#,nbsp:.

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" show matching brackets
" set showmatch
" how many tenths of a second to blink when matching brackets
" set mat=1

"statusline setup
set laststatus=2
set statusline=
set statusline+=%1*\ %-16{strftime(\"%Y-%m-%d\ %I:%M\")}
set statusline+=%=      "left/right separator
set statusline+=%P\ of\    "percent through file
set statusline+=%t    "tail of the filename
