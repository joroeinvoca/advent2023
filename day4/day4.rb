class Day4
  def initialize(file_name)
    @input = File.readlines(file_name)
  end

  def part1
    grand_total = 0
    cards = []
    @input.each do |line|
      card = Card.new(line)
      cards << card
    end

    cards.each do |card|
      grand_total += card.card_score
    end
    grand_total
  end

  def part2

  end

  class Card
    attr_reader :game_number, :winning_numbers, :my_numbers

    def initialize(input_line)
      card_num_and_values = input_line.split(':')
      @game_number = card_num_and_values[0].match(/\d+/)[0].to_i
      winning_and_my_numbers = card_num_and_values[1].split('|')
      @winning_numbers = winning_and_my_numbers[0].split(' ').map(&:to_i)
      @my_numbers = winning_and_my_numbers[1].split(' ').map(&:to_i)
    end

    def my_winning_numbers
      @winning_numbers & @my_numbers
    end

    def card_score
      score = 0
      winners = my_winning_numbers.length
      if winners > 0
        score += 1
        (winners - 1).times do |i|
          score = score * 2
        end
      end
      score
    end

  end
end