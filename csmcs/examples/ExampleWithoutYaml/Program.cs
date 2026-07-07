using csmcs;

// Define default colors using color names
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
