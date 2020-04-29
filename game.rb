require './spot'
require './valid_moves'
require './heuristic'
require './board'


class Game
  @board = nil

  def initialize
    @board = Board.new.get_board
  end

  # next moves from a given spot using heuristic function
  def next_move(spot)
    min_deg_index = -1
    min_deg = (Board.size + 1)

    start = rand(1000)%8;
    (0..7).each do |count|
      ind = (start + count) % 8
      next_spot = Spot.new(spot.x + ValidMove.x[ind], spot.y + ValidMove.y[ind])
      c = Heuristic.get_degree(@board, next_spot)
      if ValidMove.is_empty?(@board, next_spot) && c < min_deg
        min_deg_index = ind;
        min_deg = c;
      end
    end
    if min_deg_index == -1
      return nil
    end
    next_spot = Spot.new(spot.x + ValidMove.x[min_deg_index], spot.y + ValidMove.y[min_deg_index])
    @board[next_spot.y * Board.size + next_spot.x] = @board[(spot.y) * Board.size + (spot.x)]+1
    return next_spot
  end

  # print the board
  def print_board
    (0..Board.size-1).each do |i|
      (0..Board.size-1).each do |j|
        print("#{@board[j * Board.size + i]}\t")
      end
      puts
    end
  end

  def find_path(start_spot)
    # mark first move
    @board[start_spot.y * Board.size + start_spot.x] = 1

    init_spot = start_spot
    (0..Board.size*Board.size-2).each do |i|
      init_spot = next_move(init_spot)
      if init_spot == nil
        return false
      end
    end

    print_board

    true
  end
end
