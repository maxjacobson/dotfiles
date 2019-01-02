# my dotfiles

These are config files and scripts I like to have on my computers.

I've recently switched to using [rcm](https://github.com/thoughtbot/rcm) to
manage these files. It seems great! I like that it can help me keep OS-specific
stuff separate.

You can run the `check_expected_bins` script to see if programs are installed
that are managed outside of this set of scripts.

## usage, I think

* `git clone <repo> ~/.dotfiles`
* if on arch at work
  * `rcup -v -t arch -t arch-manjaro`
* if on arch at home
  * `rcup -v -t arch -t arch-i3`
* if on mac
  * `rcup -v -t mac`

## known issues

* `README.md` is ending up at `~/.README.md` despite my excludes directive...
