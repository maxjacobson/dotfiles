#!/usr/bin/env ruby

path_to_dotfiles = File.expand_path("~/dotfiles")
dotfiles = Dir.entries(path_to_dotfiles) - ['.', '..', 'scripts']
dotfiles.each do |dotfile|
  FileUtils.mv dotfile, "../#{dotfile}"
end
