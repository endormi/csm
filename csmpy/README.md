# csmpy

[![PyPI version](https://badge.fury.io/py/csmpy.svg)](https://badge.fury.io/py/csmpy)

The csmpy python package (color scheme manager) for your projects enabling customization and management of color schemes.

## Installation

Install the package:

> With pip or pip3

```python
pip install csmpy
```

Optionally, you can add it to your `requirements.txt` file:

```python
csmpy>=<version>
```

And now it can be installed by running:

```python
pip install -r requirements.txt
```

## Usage

> Feel free to customize the variable name according to your preference!

### Without YAML file

```python
from csmpy import ColorSchemeManager

# Define values (required)
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

```

### With a YAML file

```python
from csmpy import ColorSchemeManager

# Define values (required)
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
```

Both of these examples can be found in the `examples` folder.

## License

The source code is released under the [MIT License](LICENSE).
