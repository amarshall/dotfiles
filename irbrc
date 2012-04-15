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

irbrc_unavailable = []

begin
  Unbundler.require_external_gem 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  irbrc_unavailable << "wirble"
end

begin
  Unbundler.require_external_gem 'hirb'
  Hirb.enable
rescue LoadError => err
  irbrc_unavailable << "hirb"
end

%w{awesome_print looksee}.each do |gem|
  begin
    Unbundler.require_external_gem gem
  rescue LoadError => err
    irbrc_unavailable << gem
  end
end

if irbrc_unavailable.length > 0
  warn "\e[33m#{irbrc_unavailable.join(', ')} unavailable\e[0m"
end

class Object
  # List methods which aren't in superclass
  def local_methods
    if [Class, Module].include? self.class
      self.methods - self.superclass.methods
    else
      self.methods - self.class.superclass.instance_methods
    end.sort
  end

  def pure_local_methods
    if [Class, Module].include? self.class
      self.methods - (self.ancestors - [self]).map(&:methods).flatten
    else
      self.methods - (self.class.ancestors - [self.class]).map(&:instance_methods).flatten
    end.sort
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
