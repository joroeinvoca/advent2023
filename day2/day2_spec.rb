# frozen_string_literal: true
require "rspec"
require_relative "day2"

describe Day2 do
  let(:input_file) { "day2_data_example.txt" }
  let(:day2) { Day2.new(input_file) }

  describe "part 1" do
    it "the sum of the possible configurations is 8" do
      expect(day2.part1).to eq(8)
    end
  end

  describe "part 2" do
    it 'the sum of the powers of each game is 2286' do
      expect(day2.part2).to eq(2286)
    end
  end
end
