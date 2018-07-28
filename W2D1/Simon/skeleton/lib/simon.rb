
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    @sequence_length += 1
    require_sequence
    round_success_message
  end

  def show_sequence
    add_random_color
    puts "#{seq.join(' ')}"
    sleep(2)
    system("clear")
  end

  def require_sequence
    input = gets.chomp
    parsed_input = input.split.map { |col| col.downcase }
    @game_over = true unless parsed_input == seq
  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    puts "Correct. Great memory!" unless game_over
  end

  def game_over_message
    puts "Whoops! Game over."
  end

  def reset_game
    initialize
  end
end
