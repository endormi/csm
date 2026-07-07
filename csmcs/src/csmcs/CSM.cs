namespace csmcs;

public static class ColorSchemeManager
{
    public static IReadOnlyDictionary<string, string> ColorCodes => Colors.ColorCodes;

    public static Dictionary<string, string> LoadColors(
        IDictionary<string, string> defaultColors,
        IDictionary<string, string>? customColors = null)
    {
        customColors ??= new Dictionary<string, string>();

        var merged = new Dictionary<string, string>(defaultColors);

        foreach (var pair in customColors)
            merged[pair.Key] = pair.Value;

        foreach (var key in merged.Keys.ToList())
        {
            if (Colors.ColorCodes.TryGetValue(merged[key], out var ansi))
                merged[key] = ansi;
        }

        return merged;
    }

    public static Dictionary<string, string> LoadCustomYamlFile(string path) => Utils.LoadCustomYamlFile(path);
}
