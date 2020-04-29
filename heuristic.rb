require './spot'
require './valid_moves'

class Heuristic

  # gives the count of empty spots around the given spots
  def self.get_degree(arr, spot)
    count = 0;
    (0..7).each do |i|
      if (ValidMove.is_empty?(arr, Spot.new((spot.x + ValidMove.x[i]), (spot.y + ValidMove.y[i]))))
        count += 1
      end
    end
    count
  end

end
