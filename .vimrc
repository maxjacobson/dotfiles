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
" rust syntax highlighting, etc
Plug 'rust-lang/rust.vim'
" using to pull current git branch into status bar
Plug 'tpope/vim-fugitive'
" useful for opening files
Plug 'kien/ctrlp.vim'
" useful for tab completing
Plug 'ervandew/supertab'
" not sure if I use this
Plug 'tpope/vim-bundler'
" useful for quickly commenting code
Plug 'tpope/vim-commentary'
" useful for syntax highlighting
Plug 'kchmck/vim-coffee-script'
" useful for asynchronously running things from vim while in tmux
Plug 'tpope/vim-dispatch'
" useful for auto-ending ruby methods/classes/blocks
Plug 'tpope/vim-endwise'
" not sure if I use this one
Plug 'tpope/vim-eunuch'
" not sure if I use this one
Plug 'pangloss/vim-javascript'
" super useful for running rspecs
Plug 'thoughtbot/vim-rspec'
" help look up step definitions
Plug 'tpope/vim-cucumber'

" trying to get visual find and replace working...
Plug 'osyo-manga/vim-over'

" search the codebase with ag ("the silver searcher")
Plug 'rking/ag.vim'
call plug#end()

" press jk to exit insert mode
inoremap jk <ESC>
inoremap JK <ESC>
let mapleader = ","

" help it do the syntax recognition right
syntax on
filetype on

au BufNewFile,BufRead *.md set filetype=text
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
au BufRead,BufNewFile *.py set shiftwidth=2
au BufRead,BufNewFile *.py set softtabstop=2
au BufRead,BufNewFile *.py set tabstop=2

" don't go too long!
"
" add a vertical column at 81 characters
" discouraging lines longer than 80 characters, which appear to go into the
" danger zone
set colorcolumn=81
" but it should be 51 in git commit message files
autocmd Filetype gitcommit setlocal colorcolumn=51
autocmd Filetype netrw setlocal colorcolumn=0
highlight ColorColumn ctermbg=3

" autowrap at 80 characters for markdown files
" au BufRead,BufNewFile *.md set textwidth=80
" easily reflow text into 80 columns
map ; gqG
" ,; to get a quick word count
nmap <Leader>; :Dispatch wc -w %<CR>

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
set listchars=tab:\ \ ,trail:⠐,extends:#,nbsp:.

"Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

"clear search with ,/
nmap <silent> ,/ :let@/=""<CR>

nmap <silent> ,e :Explore<CR>jj

"move backup files all into one place
set backup
set backupdir=~/.vim/backup,.
set directory=~/.vim/tmp,.

"learning from destroyallsotware
" control l inserts a hash rockeT!!!
imap <c-l> <space>=><space>

" Run current file in ruby
nmap <Leader>r :!clear; ruby %<CR>

" Run current file with rubocop
nmap <Leader>p :Dispatch rubocop %<CR>

" Run current file in node
" nmap <Leader>j :!clear; node %<CR>
nmap <Leader>j :Dispatch; node %<CR>

" run current file in Go
nmap <Leader>g :!clear; go run %<CR>

" run current file in cucumer
" nmap <Leader>c :!clear; bundle exec cucumber %<CR>
map <Leader>c :Dispatch bundle exec cucumber %<CR>

" status line
set laststatus=2
"%f = file path
"%l:%c = line and column
"fugitive = git branch
"%m file modified flag
set statusline=[%F\ %l:%c]\ %{fugitive#statusline()}%m

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
" RSpec.vim
" mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" overrides
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

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
" " hide gitignored files from netrw
let g:go_fmt_command = "goimports"

" remaps hii in normal mode
" to a snippet I frequently use when blogging,
" which is helpful, idk
nnoremap <Leader>hii i{% highlight ruby %}<ESC>o{% endhighlight %}<ESC>O

let g:path_to_matcher = "/usr/local/bin/matcher"

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']

let g:ctrlp_match_func = { 'match': 'GoodMatch' }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")

endfunction

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
