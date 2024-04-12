require 'csm'

RSpec.describe ColorSchemeManager do
  describe '#load_colors' do
    let(:default_colors) { { 'logo' => 'red', 'text' => 'blue', 'result' => 'light_white' } }

    it 'should merge custom colors with default colors' do
      custom_colors = { 'logo' => 'black' }
      expect(ColorSchemeManager.load_colors(default_colors, custom_colors)).to eq({ 'logo' => 'black', 'text' => 'blue', 'result' => 'light_white' })
    end

    it 'should return default colors if custom colors are empty' do
      expect(ColorSchemeManager.load_colors(default_colors, {})).to eq(default_colors)
    end

    it 'should raise an error if default colors are not provided' do
      expect { ColorSchemeManager.load_colors(nil, {}) }.to raise_error(StandardError, 'DEFAULT_COLORS must be provided.')
    end
  end

  describe '#load_custom_yaml_file' do
    let(:empty_yaml_file) { 'spec/fixtures/empty.yaml' }
    let(:nonexistent_yaml_file) { 'nonexistent.yaml' }
    let(:existing_yaml_file) { 'spec/fixtures/custom_settings.yaml' }

    it 'should load custom colors from YAML file and merge with default colors' do
      default_colors = { 'logo' => 'red', 'text' => 'blue', 'result' => 'light_white' }
      custom_colors = ColorSchemeManager.load_custom_yaml_file(existing_yaml_file)
      all_colors = ColorSchemeManager.load_colors(default_colors, custom_colors)
      expect(all_colors).to eq({ 'logo' => 'black', 'text' => 'blue', 'result' => 'light_white' })
    end

    it 'should return default colors if YAML file is empty' do
      default_colors = { 'logo' => 'red', 'text' => 'blue', 'result' => 'light_white' }
      expect { ColorSchemeManager.load_custom_yaml_file(empty_yaml_file) }.to raise_error(StandardError, /YAML file .* is empty!/)
    end

    it 'should raise an error if YAML file path is not provided' do
      expect { ColorSchemeManager.load_custom_yaml_file(nil) }.to raise_error(ArgumentError, 'YAML file path must be provided.')
    end
  end
end
