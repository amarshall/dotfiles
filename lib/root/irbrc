require 'irb/completion'
require 'irb/ext/save-history' unless IRB.version.include? "DietRB"
                               # Don't load if using MacRuby

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
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

load "~/.rbrc"
