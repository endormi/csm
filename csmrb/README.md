# csm

[![Gem Version](https://badge.fury.io/rb/csm.svg)](https://badge.fury.io/rb/csm)

The csm gem (color scheme manager) for your projects enabling customization and management of color schemes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csm'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install csm
```

## Usage

> Feel free to customize the variable name according to your preference!

### Without YAML file

```ruby
require 'csm'

# Define values (required)
DEFAULT_COLORS = {
  'logo' => 'red',
  'text' => 'blue',
  'result' => 'light_white'
}.freeze

# Load colors
all_colors = ColorSchemeManager::load_colors(DEFAULT_COLORS)

# Example

puts "All colors: #{all_colors}"
puts "This is a #{'logo'.send(all_colors['logo'])} example of #{'text'.send(all_colors['text'])} using #{'result'.send(all_colors['result'])} colors."
```

### With a YAML file

```ruby
require 'csm'

# Define values (required)
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
```

Both of these examples can be found in the `examples` folder.

## License

The source code is released under the [MIT License](LICENSE).
