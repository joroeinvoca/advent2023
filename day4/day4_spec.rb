require_relative 'day4'

RSpec.describe Day4 do
  let(:file_name) { 'day4_data_example.txt' }
  let(:day4) { Day4.new(file_name) }

  context '#part1' do
    let(:input_line) { 'Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53' }
    let(:first_card) { Day4::Card.new(input_line) }

    it 'first card has the expected game number' do
      expect(first_card.game_number).to eq(1)
    end

    it 'first card has the expected winning numbers' do
      expect(first_card.winning_numbers).to match_array([41, 48, 83, 86, 17])
    end

    it 'first card has the expected my numbers' do
      expect(first_card.my_numbers).to match_array([83, 86, 6, 31, 17, 9, 48, 53])
    end

    it 'first card my winning numbers' do
      expect(first_card.my_winning_numbers).to match_array([83, 86, 48, 17])
    end

    it 'first card has expected score' do
      expect(first_card.card_score).to eq(8)
    end

    it 'returns the expected result' do
      expect(day4.part1).to eq(13)
    end
  end

  context '#part2' do
    it 'returns the expected result' do
      true
    end
  end
end