# require_relative 'player'
# require_relative 'mancala'

class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    self.place_stones
  end

  def place_stones
    self.cups.each.with_index do |cup, i|
      cup.concat([:stone, :stone, :stone, :stone]) unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0 || start_pos == 6
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    #I'm ashamed of this code but it's late and I'm tired!!!!!
    stones = self.cups[start_pos].shift(self.cups[start_pos].length)
    deposit_idx = (start_pos + 1) % 14
    until stones.empty?
      if deposit_idx == 13 && current_player_name == name1
        deposit_idx = 0
        next
      end
      if deposit_idx == 6 && current_player_name == name2
        deposit_idx = 7
        next
      end
      self.cups[deposit_idx] << stones.shift
      deposit_idx = (deposit_idx + 1) % 14 unless stones.empty?
    end
    render
    next_turn(deposit_idx)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 13 || ending_cup_idx == 6
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end


  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? { |cup| cup.empty? } ||
      cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if cups[6].length == cups[13].length
    return name1 if cups[6].length > cups[13].length
    return name2
  end
end
