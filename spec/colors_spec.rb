require 'colors'

RSpec.describe Colors do
  let(:string) { 'Test String' }

  describe '#color' do
    it 'returns the string wrapped with the specified color code' do
      color_string = string.color(31)
      expect(color_string).to eq("\e[31mTest String\e[0m")
    end
  end

  describe '#light_color' do
    it 'returns the string wrapped with the specified light color code' do
      color_string = string.light_color(31)
      expect(color_string).to eq("\e[1;31mTest String\e[0m")
    end
  end

  describe 'color methods' do
    it 'should define color methods for each color' do
      Colors::COLOR_CODES.each_key do |color|
        expect('Hello'.respond_to?(color)).to eq(true)
        expect('Hello'.respond_to?("light_#{color}")).to eq(true)
      end
    end
  end

  Colors::COLOR_CODES.each do |color, code|
    describe "##{color}" do
      it "returns the string wrapped with the #{color} color code" do
        color_string = string.send(color)
        expect(color_string).to eq("\e[#{code}mTest String\e[0m")
      end
    end

    describe "#light_#{color}" do
      it "returns the string wrapped with the light #{color} color code" do
        color_string = string.send("light_#{color}")
        expect(color_string).to eq("\e[1;#{code}mTest String\e[0m")
      end
    end
  end
end
