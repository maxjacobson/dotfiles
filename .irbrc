require 'irb/completion'
require 'pp'

if File.exists?("Gemfile.lock")
  require 'bundler'
  Bundler.require
end

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
