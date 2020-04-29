require './spot'
require './board'
class ValidMove
  # available moves fro the current position
  @@x = [0, 0, 3, -3, 2, -2, -2, 2]
  @@y = [3, -3, 0, 0, 2, 2, -2, -2]

  # check if the current spot is in board limit or not
  def self.under_board(spot)
    (spot.x >= 0 && spot.y >= 0) && (spot.x < Board.size && spot.y < Board.size)
  end
  
  # check if the current spot is valid and empty or not
  def self.is_empty?(array, spot)
    under_board(spot) && (array[spot.y*Board.size+spot.x] < 0) 
  end

  def self.x
    @@x
  end

  def self.y
    @@y
  end
end
