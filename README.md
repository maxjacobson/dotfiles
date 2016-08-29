# my dotfiles

Most of these are actually dotfiles (meaning, files whose filename begins with
a dot and belong in your home directory). The files in the "bin" folder are
helpful scripts that some of the dotfiles might depend on.

Put them on your $PATH if you want to use them.

Also, copy the .zsh-customizations folder into your home folder.

## Other things to install

* oh-my-zsh
* zsh
* tmux
* vim
* ruby-build
* chruby
* selecta
* zsh-completions
* ag
* matcher - https://github.com/burke/matcher
* random_nice_emoji - https://github.com/maxjacobson/random_nice_emoji
* fuzzy_file_helper - https://github.com/maxjacobson/fuzzy_file_helper

## setup

I don't have any nice script for syncing or symlinking things automatically...
tbqh I don't really want one.
I use a few computers and they're on different operating systems and I kind of like manually updating things.
I do have a helper script to help me do that, which is: `./sync`.
It's not *great* but it will just tell you what is different between your home folder and the repo.
