# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!

Pry.config.prompt = [
  proc do |target_self, nest_level, pry|
    line = '%02d' % pry.input_array.size
    nesting = ":#{nest_level}" unless nest_level.zero?
    "[#{line}] pry(#{Pry.view_clip(target_self)})#{nesting}> "
  end,
  proc do |target_self, nest_level, pry|
    line = '%02d' % pry.input_array.size
    nesting = ":#{nest_level}" unless nest_level.zero?
    "[#{line}] pry(#{Pry.view_clip(target_self)})#{nesting}> "
  end
]

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts exception.inspect
  exception.backtrace.each do |line|
    output.puts "    #{line}"
  end
end

Pry.config.theme = 'solarized'

# Launch Pry with access to the entire Rails stack.
rails = File.join Dir.getwd, 'config', 'environment.rb'
if File.exist?(rails) && ENV['RAILS']
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

if defined?(Rails) && Rails.env
  extend Rails::ConsoleMethods
end

load "~/.rbrc"
