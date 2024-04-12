require 'yaml'
require_relative 'colors'

# ColorSchemeManager manages color schemes
module ColorSchemeManager
  class << self
    attr_accessor :custom_settings_file

    def load_colors(default_colors, custom_colors = {})
      raise StandardError, 'DEFAULT_COLORS must be provided.' unless default_colors && !default_colors.empty?

      if custom_colors.empty?
        default_colors
      else
        default_colors.merge(custom_colors)
      end
    end

    def load_custom_yaml_file(custom_settings_file)
      raise ArgumentError, 'YAML file path must be provided.' unless custom_settings_file

      custom_colors = {}

      if File.exist?(custom_settings_file)
        raise StandardError, "YAML file '#{custom_settings_file}' is empty!" if File.zero?(custom_settings_file)

        config = YAML.load_file(custom_settings_file)['custom'] || {}
        custom_colors = config
      end
      custom_colors || {}
    end
  end
end
