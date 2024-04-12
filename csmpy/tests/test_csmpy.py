import os
import unittest
from csmpy import ColorSchemeManager


class TestColorSchemeManager(unittest.TestCase):
    def setUp(self):
        self.DEFAULT_COLORS = {
            'logo': ColorSchemeManager.color_codes['red'],
            'text': ColorSchemeManager.color_codes['blue'],
            'result': ColorSchemeManager.color_codes['light_white']
        }
        self.SAMPLE_YAML_CONTENT = """
        custom:
          logo: green
          result: cyan
        """

    def test_load_colors(self):
        merged_colors = ColorSchemeManager.load_colors(self.DEFAULT_COLORS)
        expected_colors = {
            'logo': '\033[31m',  # 'red' ANSI escape code
            'text': '\033[34m',  # 'blue' ANSI escape code
            'result': '\033[97m'  # 'light_white' ANSI escape code
        }
        self.assertEqual(merged_colors, expected_colors)

    def test_load_custom_yaml_file(self):
        with open('sample.yaml', 'w') as f:
            f.write(self.SAMPLE_YAML_CONTENT)

        custom_colors = ColorSchemeManager.load_custom_yaml_file('sample.yaml')
        expected_custom_colors = {'logo': 'green', 'result': 'cyan'}
        self.assertEqual(custom_colors, expected_custom_colors)

        os.remove('sample.yaml')

    def test_empty_yaml_file(self):
        with open('empty.yaml', 'w') as f:
            pass

        with self.assertRaises(ValueError):
            ColorSchemeManager.load_custom_yaml_file('empty.yaml')

        os.remove('empty.yaml')

    def test_merge_colors(self):
        custom_colors = {'logo': 'green', 'result': 'cyan'}
        merged_colors = ColorSchemeManager.load_colors(self.DEFAULT_COLORS, custom_colors)
        expected_merged_colors = {
            'logo': '\033[32m',  # 'green' ANSI escape code
            'text': '\033[34m',  # 'blue' ANSI escape code
            'result': '\033[36m'  # 'cyan' ANSI escape code
        }
        self.assertEqual(merged_colors, expected_merged_colors)


if __name__ == '__main__':
    unittest.main()
