class Board
  @@size = 1000
  @board = nil
  def initialize
    @board = Array.new
    (0..@@size*@@size-1).each do |i|
      @board[i] = -1;
    end
  end

  def get_board
    @board
  end

  def self.size
    @@size
  end

end
