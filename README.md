# my dotfiles

These are config files and scripts I like to have on my computers.

I use [rcm] to manage these files.
I mostly use macOS, but I like that it can help me keep OS-specific stuff separate.

You can run the `check_expected_bins` script to see if programs are installed
that are managed outside of this set of scripts.

## usage

* install [rcm]
* `git clone https://github.com/maxjacobson/dotfiles.git  ~/.dotfiles`
* if on mac
  * `rcup -v -t mac`
* if on ubuntu
  * `rcup -v -t ubuntu`

[rcm]: https://github.com/thoughtbot/rcm
