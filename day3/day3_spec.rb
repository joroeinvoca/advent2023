require_relative 'day3'

RSpec.describe Day3 do
  let(:input_file) { 'day3_data_example.txt' }
  let(:day3) { Day3.new(input_file) }
  
  context 'part 1' do
    it 'example total is 4361' do
      expect(day3.part1).to eq(4361)
    end
  end

  context 'part 2' do
    let(:part_numbers) { day3.find_relevant_numbers(/\*/) }
    it 'example sum of gear ratios is 467835' do
      expect(day3.part2).to eq(467835)
    end

    it 'finding relevant part numbers finds numbers that touch *s' do
      expect(part_numbers.count).to eq(5)
    end

    it 'awkward test but check find_adjoining_gears too' do
      expect(day3.find_adjoining_gears(part_numbers)).to be_a(Hash)
    end
  end
end
