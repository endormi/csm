require './lib/csm'

# Set the default color scheme
DEFAULT_COLORS = {
  'logo' => 'red',
  'text' => 'blue',
  'result' => 'light_white'
}.freeze

custom_settings_file = 'examples/custom_settings.yaml'

# Load custom colors from YAML file
custom_colors = ColorSchemeManager::load_custom_yaml_file(custom_settings_file)
puts "Loaded custom colors: #{custom_colors}"
all_colors = ColorSchemeManager::load_colors(DEFAULT_COLORS, custom_colors)

puts "All colors: #{all_colors}"
puts "This is a #{'logo'.send(all_colors['logo'])} example of #{'text'.send(all_colors['text'])} using #{'result'.send(all_colors['result'])} colors."
