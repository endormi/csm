require './lib/csm'

# Set the default color scheme
DEFAULT_COLORS = {
  'logo' => 'red',
  'text' => 'blue',
  'result' => 'light_white'
}.freeze

all_colors = ColorSchemeManager::load_colors(DEFAULT_COLORS)
puts "All colors: #{all_colors}"
puts "This is a #{'logo'.send(all_colors['logo'])} example of #{'text'.send(all_colors['text'])} using #{'result'.send(all_colors['result'])} colors."
