require_relative 'day3'

RSpec.describe Day3 do
  let(:input_file) { 'day3_data_example.txt' }
  let(:day3) { Day3.new(input_file) }
  
  context 'part 1' do
    it 'example total is 4361' do
      expect(day3.part1).to eq(4361)
    end
  end
end
