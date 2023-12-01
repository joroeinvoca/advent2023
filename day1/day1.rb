# day1.rb
class Day1
  def initialize(input_file)
    @input = File.readlines(input_file)
  end

  def part1
    # get the individual calibration values
    calibration_values = decode_calibration_values

    # sum all calibration values
    calibration_values.sum
  end

  def decode_calibration_values
    calibration_values = []
    @input.each do |line|
      number_chars = line.scan(/\d/)
      calibration_value = number_chars[0] + number_chars[-1]
      calibration_values << calibration_value.to_i
    end
    calibration_values
  end

  def part2
    # Logic for part 2 goes here
  end
end
