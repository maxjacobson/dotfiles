" settings just for GUI vim, specifically Macvim
" (get the latest release from here: https://github.com/b4winckler/macvim/releases)

" nice big font
set guifont=Monaco:h17

" nice color scheme
" download smyck colorscheme from here: http://color.smyck.org/
" copy smyck.vim to ~/.vim/colors to install
" it's pretty nice
" the colorscheme should only be used for gvim/macvim,
" for terminal vim, the colorscheme should be installed on the terminal level,
" not on the vim level
colorscheme smyck

" prevent blinking cursor, which stresses me out?
set guicursor=a:blinkon0

" set a nice initial width
set lines=25 columns=85
