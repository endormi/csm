namespace csmcs;

public static class Colors
{
    public static readonly IReadOnlyDictionary<string, string> ColorCodes =
        new Dictionary<string, string>
        {
            ["black"] = "\u001b[30m",
            ["red"] = "\u001b[31m",
            ["green"] = "\u001b[32m",
            ["yellow"] = "\u001b[33m",
            ["blue"] = "\u001b[34m",
            ["purple"] = "\u001b[35m",
            ["cyan"] = "\u001b[36m",
            ["white"] = "\u001b[37m",
            ["light_black"] = "\u001b[90m",
            ["light_red"] = "\u001b[91m",
            ["light_green"] = "\u001b[92m",
            ["light_yellow"] = "\u001b[93m",
            ["light_blue"] = "\u001b[94m",
            ["light_purple"] = "\u001b[95m",
            ["light_cyan"] = "\u001b[96m",
            ["light_white"] = "\u001b[97m"
        };

    public static string Colorize(string text, string colorCode) => $"{colorCode}{text}\u001b[0m";
}
