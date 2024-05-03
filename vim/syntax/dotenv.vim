" Vim syntax file
" Language: dotenv files
" Maintainer: Max Jacobson <max@hardscrabble.net>
"
" With thanks to Gernot Schulz <gernot.schulz@overleaf.com> whose project I
" cribbed most of this from.
"
" Their version: https://github.com/overleaf/vim-env-syntax/ is optimized for
" kubectl .env files
"
" This version is optimized for the bkeeper/dotenv files commonly used in the
" Ruby community, which tolerate quoted variables just fine, and which also
" support multi-line variables
"
" With additional thanks to
" https://learnvimscriptthehardway.stevelosh.com/chapters/47.html
"
" This is not perfect:
"
" - it does not support the export keyword
" - it does not highlight invalid syntax, such as
"   - multi-line single-quoted strings
"   - unclosed strings
"
" but, eh, let's see how it holds up

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syntax match lineComment '\v^#.*'
syntax match trailingComment '#.*$'
syntax match envVariable "\v^\h\w*\ze\=" nextgroup=envVarAssign
syntax match envVarAssign contained "=" nextgroup=unquotedEnvVar,singleQuotedEnvVar,doubleQuotedEnvVar,multiLineEnvVar
syntax region doubleQuotedEnvVar start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region singleQuotedEnvVar start=/\v'/ skip=/\v\\./ end=/\v'/

let b:current_syntax = "dotenv"

highlight def link lineComment Comment
highlight def link trailingComment Comment

highlight def link envVariable Identifier
highlight def link envVarAssign Operator

highlight def link singleQuotedEnvVar String
highlight def link doubleQuotedEnvVar String

" Makes it so comments get continued when you add new lines
setlocal formatoptions+=ro

" Makes it compatible with tpope/vim-commentary for commenting out blocks of
" code
setlocal commentstring=#\ %s
