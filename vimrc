" Using this vimrc:
"
" Install minpac: https://github.com/k-takata/minpac?tab=readme-ov-file#installation
" run: mkdir ~/.vim/backup
" run: mkdir ~/.vim/tmp
" copy this code to ~/.vimrc
"
" open this file in vim
" run :call minpac#update()
"
" Occasional maintenance:
" run :call minpac#update()
" run :call minpac#clean()

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'}) " package manager
call minpac#add('tpope/vim-sensible') " sensible defaults
call minpac#add('Olical/vim-enmasse') " project-wide find and replace
call minpac#add('rust-lang/rust.vim') " rust syntax highlighting, auto-formatting etc
call minpac#add('tpope/vim-fugitive') " using to pull current git branch into status bar
call minpac#add('ervandew/supertab') " useful for tab completing
call minpac#add('tpope/vim-bundler') " not sure if I use this
call minpac#add('tpope/vim-commentary') " useful for quickly commenting code
call minpac#add('tpope/vim-endwise') " useful for auto-ending ruby methods/classes/blocks
call minpac#add('tpope/vim-eunuch') " not sure if I use this one
call minpac#add('jremmen/vim-ripgrep') " search the codebase with rg (ripgrep)
call minpac#add('sjl/gundo.vim') " Visualizes recent changes so you can undo with confidence
call minpac#add('airblade/vim-gitgutter') " Adds a column on the left indicating which lines have changed
call minpac#add('dietsche/vim-lastplace') " Remembers where your cursor was in each file and takes you there
call minpac#add('hashivim/vim-terraform') " Syntax highlighting for terraform .tf files
call minpac#add('pangloss/vim-javascript') " Syntax highlighting for javascript files
call minpac#add('mxw/vim-jsx') " Syntax highlighting for jsx files
call minpac#add('cespare/vim-toml') " Syntax highlighting for toml config files
call minpac#add('ElmCast/elm-vim') " Syntax highlighting for elm files
call minpac#add('leafgarland/typescript-vim') " Syntax highlighting for TypeScript files
call minpac#add('peitalin/vim-jsx-typescript') " Syntax highlighting for .tsx files
call minpac#add('junegunn/fzf') " Fuzzy file finder to open files
call minpac#add('junegunn/fzf.vim') " Fuzzy file finder to open files
call minpac#add('maxjacobson/vim-fzf-coauthorship') " Insert Co-Authored-By lines into commit messages
call minpac#add('dense-analysis/ale') " Asynchronous Lint Engine, for invoking things like rubocop, eslint, and prettier automatically
call minpac#add('rhysd/vim-syntax-codeowners') " Syntax-highlighting for .github/CODEOWNERS files
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('preservim/tagbar')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('amadeus/vim-mjml')

packloadall

" press jk to exit insert mode
inoremap jk <ESC>
inoremap JK <ESC>
let mapleader = ","

" help it do the syntax recognition right
syntax on
filetype on

au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead Brewfile set filetype=ruby
au BufNewFile,BufRead .Brewfile set filetype=ruby

autocmd BufRead,BufNewFile .env* set ft=dotenv

" N.B. this assumes you're using a nice modern terminal emulator like
" Alacritty or iTerm 2
"
" (This won't work with macOS's Terminal.app)
set termguicolors
colorscheme smyck

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
au BufRead,BufNewFile *.fish set shiftwidth=4
au BufRead,BufNewFile *.fish set softtabstop=4
au BufRead,BufNewFile *.fish set tabstop=4

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
\   'bash': ['shellcheck'],
\   'eruby': ['erblint'],
\   'fish': ['fish', 'fish_indent'],
\   'mjml': ['erblint'],
\   'ruby': ['rubocop', 'sorbet', 'standardrb'],
\   'javascript': ['eslint', 'stylelint'],
\   'typescript': ['eslint'],
\   'jsx': ['stylelint', 'eslint'],
\   'rust': ['analyzer', 'cargo'],
\   'scss': ['stylelint'],
\   'sh': ['shellcheck'],
\}

let g:ale_fixers = {
\   'css': ['prettier'],
\   'fish': ['fish_indent'],
\   'ruby': ['rubocop', 'standardrb', 'prettier'],
\   'javascript': ['prettier'],
\   'jsx': ['prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'scss': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\}

let g:ale_ruby_rubocop_executable = "bin/rubocop"
let g:ale_ruby_standardrb_executable = "bin/standardrb"
let g:ale_eruby_erblint_executable = "bin/erb_lint"
let g:ale_rust_cargo_use_clippy = 1
let g:ale_fix_on_save = 1

" Highlight curent line number
" These colors come from my preferred color scheme, Smyck
" https://color.smyck.org
" Tip via https://hachyderm.io/@VimLinks/111223586086176442
set cursorline
hi! link CursorLine Normal
hi my_bg guifg=#b0b0b0 guibg=#292929
hi my_bg_cursor guifg=#fbb1f9 guibg=#292929
hi! link LineNr my_bg
hi! link CursorLineNr my_bg_cursor

" Store tags file out of the way so I don't need to add it to .gitignore in
" every project
let g:gutentags_ctags_tagfile = ".git/tags"

" only generate tags for non-gitignore files
let g:gutentags_file_list_command = "fd --type file --hidden --exclude .git"

" configure vim to look at the tags file generated by gutentags (.git/tags)
" instead of the one at the default location (./tags)
let g:gutentags_ctags_auto_set_tags = 1

packadd hlyank

set textwidth=120
