class Day1
  # Initializes a new instance of the Day1 class.
  #
  # @param input_file [String] The path to the input file.
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

  # Calculates the solution for part 1 of the puzzle.
  #
  # @return [Integer] The sum of the calibration values.
  def part1
    calibration_values = decode_calibration_values
    calibration_values.sum
  end

  # Decodes the calibration values from the input file.
  #
  # @return [Array<Integer>] The decoded calibration values.
  def decode_calibration_values
    calibration_values = []
    @input.each do |line|
      number_chars = line.scan(/\d/)
      calibration_value = number_chars[0] + number_chars[-1]
      calibration_values << calibration_value.to_i
    end
    calibration_values
  end

  # Calculates the solution for part 2 of the puzzle.
  #
  # @return [Integer] The sum of the alphanumeric calibration values.
  def part2
    calibration_values = decode_alphanumeric_calibration_values
    calibration_values.sum
  end

  # Decodes the alphanumeric calibration values from the input file.
  #
  # @return [Array<Integer>] The decoded alphanumeric calibration values.
  def decode_alphanumeric_calibration_values
    calibration_values = []
    @input.each do |line|
      numbers = line.scan(/(?=(\d|#{@NUMBER_WORDS.keys.join('|')}))/).flatten
      calibration_value = "#{@NUMBER_WORDS[numbers[0]] || numbers[0]}#{@NUMBER_WORDS[numbers[-1]] || numbers[-1]}"
      calibration_values << calibration_value.to_i
    end
    calibration_values
  end
end
