require_relative 'day5'

# frozen_string_literal: true

RSpec.describe Day5 do
  let(:file_name) { 'day5_data_example.txt' }
  let(:day5) { Day5.new(file_name) }

  it 'part 1 example returns expected result' do
    expect(day5.part1).to eq(35)
  end

  it 'parses seeds out' do
    expect(day5.instance_variable_get(:@seeds)).to eq([79, 14, 55, 13])
  end

  it 'parses maps out' do
    expect(day5.instance_variable_get(:@maps)).to be_a(Array)
    expect(day5.instance_variable_get(:@maps)[0]).to be_a(Hash)
    expect(day5.instance_variable_get(:@maps)[0]).to include({ 98..99 => -48 }).and include({ 50..97 => 2 })
    expect(day5.instance_variable_get(:@maps).size).to be(7)
  end

  it 'calculates final mapped value for a seed' do
    expect(day5.convert_seed(79)).to eq(82)
  end
end
