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
  output.puts exception.inspect
  exception.backtrace.map do |line|
    if match = line.match(/.*\/\d\.\d\.\d\/(.+)/)
      ".../#{match.captures.first}"
    else
      line
    end
  end.reject.with_index do |line, index|
    true if index == 0
    line =~ /gems\/(pry|zeus|rspec)/
  end.each do |line|
    output.puts "    #{line}"
  end
end

Pry.config.theme = 'solarized'

load "~/.rbrc"
