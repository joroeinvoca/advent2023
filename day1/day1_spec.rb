# day1_spec.rb
require 'rspec'
require_relative 'day1'

describe Day1 do
  let(:input_file) { 'day1_data_example.txt' }
  let(:day1) { Day1.new(input_file) }

  describe '#part1' do
    it 'finds the calibration value from each line' do
      expect(day1.decode_calibration_values).to eq([12, 38, 15, 77])
    end

    it 'returns the total of all calibration values' do
      expect(day1.part1).to eq(142)
    end
  end

  xdescribe '#part2' do
    it 'returns the correct output' do
      expect(day1.part2).to eq('expected output')
    end
  end
end
