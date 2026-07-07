using Xunit;
using csmcs;

namespace csmcs.Tests;

public class ColorSchemeManagerTests
{
    private readonly Dictionary<string, string> _defaultColors = new()
    {
        ["logo"] = "red",
        ["text"] = "blue",
        ["result"] = "light_white"
    };

    private const string SampleYamlContent = """
custom:
  logo: green
  result: cyan
""";

    [Fact]
    public void LoadColors_ShouldConvertColorNamesToAnsiCodes()
    {
        var mergedColors = ColorSchemeManager.LoadColors(_defaultColors);

        Assert.Equal("\u001b[31m", mergedColors["logo"]);
        Assert.Equal("\u001b[34m", mergedColors["text"]);
        Assert.Equal("\u001b[97m", mergedColors["result"]);
    }

    [Fact]
    public void LoadCustomYamlFile_ShouldLoadCustomColors()
    {
        const string fileName = "sample.yaml";

        File.WriteAllText(fileName, SampleYamlContent);

        try
        {
            var customColors = ColorSchemeManager.LoadCustomYamlFile(fileName);

            Assert.Equal("green", customColors["logo"]);
            Assert.Equal("cyan", customColors["result"]);
        }
        finally
        {
            File.Delete(fileName);
        }
    }

    [Fact]
    public void LoadCustomYamlFile_ShouldThrowOnEmptyYamlFile()
    {
        const string fileName = "empty.yaml";

        File.WriteAllText(fileName, "");

        try
        {
            Assert.Throws<InvalidDataException>(() => ColorSchemeManager.LoadCustomYamlFile(fileName));
        }
        finally
        {
            File.Delete(fileName);
        }
    }

    [Fact]
    public void LoadColors_ShouldMergeDefaultAndCustomColors()
    {
        var customColors = new Dictionary<string, string>
        {
            ["logo"] = "green",
            ["result"] = "cyan"
        };

        var mergedColors = ColorSchemeManager.LoadColors(_defaultColors, customColors);

        Assert.Equal("\u001b[32m", mergedColors["logo"]);
        Assert.Equal("\u001b[34m", mergedColors["text"]);
        Assert.Equal("\u001b[36m", mergedColors["result"]);
    }

    [Fact]
    public void LoadCustomYamlFile_ShouldReturnEmptyDictionary_WhenFileDoesNotExist()
    {
        var colors = ColorSchemeManager.LoadCustomYamlFile("does_not_exist.yaml");
        Assert.Empty(colors);
    }
}
