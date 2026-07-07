using csmcs;

// Define default colors using color names
var defaultColors = new Dictionary<string, string>
{
    ["logo"] = "red",
    ["text"] = "blue",
    ["result"] = "light_white"
};

// Load custom colors from a YAML file
var customColors = ColorSchemeManager.LoadCustomYamlFile("custom_settings.yaml");

// Merge default and custom colors
var allColors = ColorSchemeManager.LoadColors(defaultColors, customColors);

// Example usage
var logoColor = allColors["logo"];
var textColor = allColors["text"];
var resultColor = allColors["result"];

Console.WriteLine($"This is a {Colors.Colorize("logo", logoColor)} example of {Colors.Colorize("text", textColor)} using {Colors.Colorize("result", resultColor)} colors.");
