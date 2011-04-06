require 'irb/completion'
require 'irb/ext/save-history' unless IRB.version.include? "DietRB"
                               # Don't load if using MacRuby

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE] = :SIMPLE  # Simplifies prompt to ">>"

# Print RVM's current Ruby & Gemset
puts "\e[35mRVM using #{`rvm current`.chomp}\e[0m" unless `which rvm` == ""

# Load Rubygems
begin
  require 'rubygems'
rescue LoadError => err
end

# Loads the specified gem from RVM's current @global gemset if using
# Bundler and not included in the current Gemfile. Falls back
# accordingly if not using Bundler or RVM.
#
# @note Doesn't load gems not loaded by Bundler if using Bundler and
#   not using RVM, or if gem is located somewhere other than the
#   @global gemset.
# @param [String] The gem to require
# @raise [LoadError] If the gem couldn't be loaded
# Adapted from <https://gist.github.com/794915>
# Forked at <https://gist.github.com/906427>
def require_global_gem_without_bundler(gem)
  if defined? ::Bundler
    # Check if the gem has already been loaded by Bundler
    unless Bundler.require.map { |i| i.name }.include? gem
      if global_gem_dir = $LOAD_PATH.grep(/@global.*?lib/).first
        global_gem_dir = global_gem_dir.gsub %r{@global/gems/.*$}, '@global/gems'
        Dir["#{global_gem_dir}/*"].to_a.each do |gem_path|
          if File.basename(gem_path).gsub(/-(\d\.?)+$/, '') == gem
            $LOAD_PATH << "#{gem_path}/lib"
            require gem
            return
          end
        end
      end
      # Either RVM's @global gemset isn't available, or the gem isn't
      #   installed in it, either way, gem wasn't be loaded.
      raise LoadError
    end
  else
    # Bundler isn't being used, load gem normally
    require gem
  end
end

irbrc_unavailable = []

# Load Wirble
begin
  require_global_gem_without_bundler 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  irbrc_unavailable << "Wirble"
end

# Load Hirb
begin
  require_global_gem_without_bundler 'hirb'
  Hirb.enable
rescue LoadError => err
  irbrc_unavailable << "Hirb"
end

# Load Awesome Print
begin
  require_global_gem_without_bundler 'awesome_print'
rescue LoadError => err
  irbrc_unavailable << "Awesome Print"
end

# Load Looksee
begin
  require_global_gem_without_bundler 'looksee'
rescue LoadError => err
  irbrc_unavailable << "Looksee"
end

if irbrc_unavailable.length > 0
  # Warn about gems that couldn't be loaded
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

# Copy to OS X clipboard
def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

# Paste from OS X clipboard
def paste
  `pbpaste`
end

load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
