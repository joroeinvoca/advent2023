# day1_spec.rb
require 'rspec'
require_relative 'day1'

describe Day1 do
  let(:input) { File.read('day1_data_example.txt') }
  let(:day1) { Day1.new(input) }

  describe '#part1' do
    it 'returns the correct output' do
      expect(day1.part1).to eq('expected output')
    end
  end

  describe '#part2' do
    it 'returns the correct output' do
      expect(day1.part2).to eq('expected output')
    end
  end
end