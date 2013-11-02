#!/usr/bin/env ruby
require 'fileutils'
path_to_home     = File.expand_path "~"
path_to_dotfiles = File.expand_path("~/dotfiles")
dotfiles = Dir.entries(path_to_dotfiles) - ['.', '..', 'scripts']
dotfiles.each do |dotfile|
  FileUtils.mv "#{path_to_dotfiles}/#{dotfile}", "#{path_to_home}/#{dotfile}"
end
