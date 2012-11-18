# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!

prompt = proc do |target_self, nest_level, pry|
  line = '%02d' % pry.input_array.size
  nesting = ":#{nest_level}" unless nest_level.zero?
  "[#{line}] pry(#{Pry.view_clip(target_self)})#{nesting}> "
end

Pry.config.prompt = [prompt, prompt]

Pry.config.exception_handler = proc do |output, exception, _|
  display = ->(text) { output.puts Pry::Helpers::Text.yellow(text) }

  backtrace = exception.backtrace.map do |line|
    if match = line.match(/.*\/\d\.\d\.\d\/(.+)/)
      ".../#{match.captures.first}"
    else
      line
    end
  end.reject.with_index do |line, index|
    true if index == 0
    line =~ /gems\/(pry|zeus|rspec)/
  end

  display.(exception.inspect)
  backtrace.each do |line|
    display.("    #{line}")
  end
end

Pry.config.theme = 'solarized'

load "~/.rbrc"
