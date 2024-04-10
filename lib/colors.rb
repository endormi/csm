# Colors module provides ANSI color codes for enhancing console output
module Colors
  COLOR_CODES = {
    'black' => 30,
    'red' => 31,
    'green' => 32,
    'yellow' => 33,
    'blue' => 34,
    'purple' => 35,
    'cyan' => 36,
    'white' => 37
  }.freeze

  def color(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def light_color(lcolor_code)
    "\e[1;#{lcolor_code}m#{self}\e[0m"
  end

  COLOR_CODES.each do |name, code|
    define_method(name) { "\e[#{code}m#{self}\e[0m" }
    define_method("light_#{name}") { "\e[1;#{code}m#{self}\e[0m" }
  end
end

String.include(Colors)
