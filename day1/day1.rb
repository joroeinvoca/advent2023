class Day1
  def initialize(input_file)
    @input = File.readlines(input_file)
    @NUMBER_WORDS = {
      'one' => '1',
      'two' => '2',
      'three' => '3',
      'four' => '4',
      'five' => '5',
      'six' => '6',
      'seven' => '7',
      'eight' => '8',
      'nine' => '9'
    }
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
    # get the alphanumeric calibration values
    calibration_values = decode_alphanumeric_calibration_values
    # sum 'em
    calibration_values.sum
  end

  def decode_alphanumeric_calibration_values
    calibration_values = []
    @input.each do |line|
      # puts "line: #{line}"
      numbers = line.scan(/(?=(\d|#{@NUMBER_WORDS.keys.join('|')}))/).flatten
      # puts "numbers: #{numbers}"
      calibration_value = "#{@NUMBER_WORDS[numbers[0]] || numbers[0]}#{@NUMBER_WORDS[numbers[-1]] || numbers[-1]}"
      # puts "calibration_value: #{calibration_value}"
      calibration_values << calibration_value.to_i
    end
    calibration_values
  end
end
