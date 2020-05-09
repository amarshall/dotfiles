require 'irb/completion'
require 'irb/ext/save-history'
require 'pathname'

xdg_data_home = Pathname.new(ENV.fetch(
  'XDG_DATA_HOME',
  File.join(Dir.home, '.local', 'share')
))
irb_data_home = xdg_data_home.join('irb')
irb_data_home.mkpath unless irb_data_home.exist?

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:HISTORY_FILE] = irb_data_home.join('history').to_s
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => "%02n >> ",
  :PROMPT_N => "%02n >> ",
  :PROMPT_S => nil,
  :PROMPT_C => "%02n ?> ",
  :RETURN   => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM

begin
  require 'rubygems' if RUBY_VERSION < '1.9'
rescue LoadError
end

require_relative './init.rb'
