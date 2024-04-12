from csmpy import ColorSchemeManager

# Define default colors using color names
DEFAULT_COLORS = {
    'logo': 'red',
    'text': 'blue',
    'result': 'light_white',
}

# Load all colors
all_colors = ColorSchemeManager.load_colors(DEFAULT_COLORS)

# Example usage
logo_color = all_colors['logo']
text_color = all_colors['text']
result_color = all_colors['result']

print(f"This is a {logo_color} example of {text_color} using {result_color} colors.")
