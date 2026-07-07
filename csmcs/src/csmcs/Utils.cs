using YamlDotNet.Core;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;

namespace csmcs;

internal static class Utils
{
    private static readonly IDeserializer Deserializer =
        new DeserializerBuilder()
            .WithNamingConvention(CamelCaseNamingConvention.Instance)
            .Build();

    public static Dictionary<string, string> LoadCustomYamlFile(string path)
    {
        if (!File.Exists(path))
            return [];

        try
        {
            var text = File.ReadAllText(path);

            var config = Deserializer.Deserialize<Dictionary<string, Dictionary<string, string>>>(text);

            if (config is null)
                throw new InvalidDataException("The YAML file is empty or invalid.");

            return config.TryGetValue("custom", out var custom) ? custom : [];
        }
        catch (YamlException)
        {
            return [];
        }
    }
}
