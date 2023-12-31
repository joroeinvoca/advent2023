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

  describe '#part2' do
    let(:input_file) { 'day1b_data_example.txt' }
    it 'finds the correct calibration value from each line' do
      expect(day1.decode_alphanumeric_calibration_values).to eq([29, 83, 13, 24, 42, 14, 76])
    end

    it 'returns the total of all calibration values' do
      expect(day1.part2).to eq(281)
    end

    context 'real data' do
      let(:input_file) { 'day1_data.txt' }

      it "isn't wrong" do
        expect(day1.part2).to be < 53519
      end
    end
  end
end
