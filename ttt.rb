#need to update brute force check if win
#need to make computer smarter with to_in_a_row

def initialize_board
  b = {}
  (1..9).each { |position| b[position] = ' ' }
  b
end

def draw_numbered_board(hash)
  puts "     |     |     "
  puts "  1  |  2  |  3  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  4  |  5  |  6  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  7  |  8  |  9  "
  puts "     |     |     "
  puts "Remember these positions"
  sleep(2.5)
end

def draw_board(hash)
  system 'clear'
  puts "     |     |     "
  puts "  #{hash[1]}  |  #{hash[2]}  |  #{hash[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{hash[4]}  |  #{hash[5]}  |  #{hash[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{hash[7]}  |  #{hash[8]}  |  #{hash[9]}  "
  puts "     |     |     "
end

def empty_spaces(b)
  b.select { |k,v| v == ' '}.keys
end

def player_picks_square(b)
  begin
    puts "Pick a square (1-9):"
    position = gets.chomp
  end until empty_spaces(b).include?(position.to_i) 
  b[position.to_i] = "X"  
end

def comp_picks_square(b)
  position = empty_spaces(b).sample
  b[position] = "O"
end

def check_winner(b)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    if b[line[0]] == "X" && b[line[1]] == "X" && b[line[2]] == "X"
      return 'Player'
    elsif b[line[0]] == "O" && b[line[1]] == "O" && b[line[2]] == "O"
      return 'Computer'
    end  
  end
  nil
end

begin
  board = initialize_board
  draw_numbered_board("")
  draw_board(board)

  begin
    player_picks_square(board)
    comp_picks_square(board)
    draw_board(board)
    winner = check_winner(board)
  end until winner || empty_spaces(board).empty?

  if winner
    puts "#{winner} won!"
  else
    puts "Cats game!"
  end

  puts "Want to play again? (y/n)"
  power = gets.chomp.upcase
  system 'clear'
end while power == "Y"