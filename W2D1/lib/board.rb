class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |idx|
      4.times do
        @cups[idx] << :stone unless idx == 6 || idx == 13
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_index = start_pos
    until stones.empty?
      cup_index += 1
      cup_index = 0 if cup_index > 13

      if cup_index == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_index == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_index] << stones.pop
      end
    end

    render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)

    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[1..6]
    side2 = @cups[8..13]
    if side1.all?{|el| el.empty?} || side2.all?{|el| el.empty?}
      return true
    else
      return false
    end
  end

  def winner
    if @cups[6].size == @cups[13].size
      :draw
    elsif @cups[6].size > @cups[13].size
      @name1
    else
      @name2
    end
  end
end
