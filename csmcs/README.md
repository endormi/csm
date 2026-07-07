# csmcs

The csmcs NuGet package (color scheme manager) for your projects enabling customization and management of color schemes.

## Installation

Install the package from NuGet:

```bash
dotnet add package csmcs
```

## Usage

> Feel free to customize the variable name according to your preference!

### Without YAML file

```csharp
using csmcs;

// Define values (required)
var defaultColors = new Dictionary<string, string>
{
    ["logo"] = "red",
    ["text"] = "blue",
    ["result"] = "light_white"
};

// Load all colors
var allColors = ColorSchemeManager.LoadColors(defaultColors);

// Example usage
var logoColor = allColors["logo"];
var textColor = allColors["text"];
var resultColor = allColors["result"];

Console.WriteLine($"This is a {Colors.Colorize("logo", logoColor)} example of {Colors.Colorize("text", textColor)} using {Colors.Colorize("result", resultColor)} colors.");
```

### With a YAML file

```csharp
using csmcs;

// Define values (required)
var defaultColors = new Dictionary<string, string>
{
    ["logo"] = "red",
    ["text"] = "blue",
    ["result"] = "light_white"
};

// Load custom colors from a YAML file
var customColors = ColorSchemeManager.LoadCustomYamlFile("examples/custom_settings.yaml");

// Merge default and custom colors
var allColors = ColorSchemeManager.LoadColors(defaultColors, customColors);

// Example usage
var logoColor = allColors["logo"];
var textColor = allColors["text"];
var resultColor = allColors["result"];

Console.WriteLine($"This is a {Colors.Colorize("logo", logoColor)} example of {Colors.Colorize("text", textColor)} using {Colors.Colorize("result", resultColor)} colors.");
```

C# does not have the same dynamic string extension patterns as Ruby or Python and directly inserting ANSI codes would expose terminal-specific details.

Both of these examples can be found in the `examples` folder.

## License

The source code is released under the [MIT License](LICENSE).
