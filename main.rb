require './game'
require './spot'
require './valid_moves'

MAX_TRY = 100

if ARGV.size() != 2
  raise "expecting 2 (1: x-position, 2: y-position) arguments given #{ARGV.size()}"
end

x = ARGV[0].to_i
y = ARGV[1].to_i

spot = Spot.new(x,y)

if !ValidMove.under_board(spot)
  raise "Given position #{spot.x} #{spot.y} is not under board limits"
end

counter = 0
found_solution = false
while(counter < MAX_TRY)
  counter += 1
  puts "Not able to find path for #{counter} trial"
  if(Game.new.find_path(Spot.new(x,y)))
    found_solution = true
    break
  end
end

if !found_solution
  puts "Not able to find path for #{counter} trial"
else
  puts "Completed in #{counter} trial"
end
