from csmpy import ColorSchemeManager

# Define default colors using color names
DEFAULT_COLORS = {
    'logo': 'red',
    'text': 'blue',
    'result': 'light_white',
}

# Load custom colors from a YAML file
custom_colors = ColorSchemeManager.load_custom_yaml_file('examples/custom_settings.yaml')

# Merge default and custom colors
all_colors = ColorSchemeManager.load_colors(DEFAULT_COLORS, custom_colors)

# Example usage
logo_color = all_colors['logo']
text_color = all_colors['text']
result_color = all_colors['result']

print(f"This is a {logo_color} example of {text_color} using {result_color} colors.")
