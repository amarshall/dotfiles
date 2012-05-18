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
  output.puts "#{exception}"
  exception.backtrace.each do |line|
    output.puts "    #{line}"
  end
end

module CodeRay
  module Encoders
    class Terminal < Encoder
      {
        :attribute_name => '33',
        :attribute_value => '31',
        :binary => '1;35',
        :char => {
          :self => '36', :delimiter => '34'
        },
        :class => '33',
        :class_variable => '34',
        :color => '32',
        :comment => '92',
        :complex => '34',
        :constant => '33',
        :decoration => '35',
        :definition => '1;32',
        :directive => ['32', '4'],
        :doc => '46',
        :doctype => '1;30',
        :doc_string => ['31', '4'],
        :entity => '33',
        :error => ['1;33', '41'],
        :exception => '1;31',
        :float => '1;35',
        :function => '34',
        :global_variable => '34',
        :hex => '1;36',
        :inline => {
          :self => '31',
          :ident => '0',
        },
        :inline_delimiter => '31',
        :include => '33',
        :instance_variable => '34',
        :integer => '36',
        :key => '35',
        :label => '1;15',
        :local_variable => '33',
        :octal => '1;35',
        :operator_name => '1;29',
        :predefined_constant => '1;36',
        :predefined_type => '1;30',
        :predefined => ['4', '1;34'],
        :preprocessor => '36',
        :pseudo_class => '34',
        :regexp => {
          :self => '36',
          :content => '36',
          :delimiter => '31',
          :modifier => '37',
          :function => '1;29'
        },
        :reserved => '32',
        :shell => {
          :self => '31',
          :content => '1;29',
          :delimiter => '31',
        },
        :string => {
          :self => '36',
          :modifier => '1;32',
          :escape => '31',
          :delimiter => '31',
        },
        :symbol => '36',
        :tag => '34',
        :type => '33',
        :value => '36',
        :variable => '34',
        :insert => '42',
        :delete => '41',
        :change => '44',
        :head => '45'
      }.each_pair do |key, value|
        TOKEN_COLORS[key] = value
      end
      %w[global_variable instance_variable integer constant predefined_constant reserved].each do |token|
        TOKEN_COLORS[:inline][token.to_sym] = TOKEN_COLORS[token.to_sym]
      end
      TOKEN_COLORS[:keyword] = TOKEN_COLORS[:reserved]
      TOKEN_COLORS[:method] = TOKEN_COLORS[:function]
      TOKEN_COLORS[:imaginary] = TOKEN_COLORS[:complex]
      TOKEN_COLORS[:begin_group] = TOKEN_COLORS[:end_group] = TOKEN_COLORS[:escape] = TOKEN_COLORS[:delimiter]
    end
  end
end


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
