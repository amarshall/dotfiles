require 'irb/completion'
require 'irb/ext/save-history' unless IRB.version.include? "DietRB"
                               # Don't load if using MacRuby

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE] = :SIMPLE  # Simplifies prompt to ">>"

# Print RVM/rbenv environment
puts "\e[1;4;30mRVM using #{`rvm current`.split("\n").last}\e[0m" if system "type -P rvm &> /dev/null"
puts "\e[1;4;30mrbenv using #{`rbenv version`.split("\n").last}\e[0m" if system "type -P rbenv &> /dev/null"

begin
  require 'rubygems'
rescue LoadError
end

irbrc_unavailable = []

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  irbrc_unavailable << "wirble"
end

begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  irbrc_unavailable << "hirb"
end

%w{awesome_print looksee}.each do |gem|
  begin
    require gem
  rescue LoadError => err
    irbrc_unavailable << gem
  end
end

if irbrc_unavailable.length > 0
  warn "\e[33m#{irbrc_unavailable.join(', ')} unavailable\e[0m"
end

class Object
  # List methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

if RUBY_PLATFORM.include? "darwin"
  # Copy to OS X clipboard
  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
    $?.exited?
  end

  # Paste from OS X clipboard
  def paste
    `pbpaste`
  end
end

# Load railsrc if in Rails console
load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
