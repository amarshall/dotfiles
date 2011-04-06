require 'irb/completion'
require 'irb/ext/save-history' unless IRB.version.include? "DietRB"

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE] = :SIMPLE  # Simplifies prompt to ">>"

# Print RVM's current Ruby & Gemset
puts "RVM using " << `rvm current`.chomp unless `which rvm` == ""

# Load Rubygems
begin
  require 'rubygems'
rescue LoadError => err
end

irbrc_unavailable = []

# Load Wirble
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  irbrc_unavailable << "Wirble"
end

# Load Hirb
begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  irbrc_unavailable << "Hirb"
end

# Load Awesome Print
begin
  require 'ap'
rescue LoadError => err
  irbrc_unavailable << "Awesome Print"
end

# Load Looksee
begin
  require 'looksee'
rescue LoadError => err
  irbrc_unavailable << "Looksee"
end

warn "#{irbrc_unavailable.join(', ')} unavailable" if irbrc_unavailable.length > 0

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

# Copy to OS X clipboard
def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

# Paste from OS X clipboard
def paste
  `pbpaste`
end

load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
