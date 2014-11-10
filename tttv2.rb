#need to update brute force check if win
#need to make computer smarter with to_in_a_row

def initialize_board
  board = {}
  (1..9).each { |position| board[position] = ' ' }
  board
end

def draw_numbered_board(intializer)
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

def empty_spaces(board)
  board.select { |k,v| v == ' '}.keys
end

def player_picks_square(board)
  begin
    puts "Pick a square (1-9):"
    position = gets.chomp
  end until empty_spaces(board).include?(position.to_i) 
  board[position.to_i] = "X"  
end

def two_in_a_row(board, marker)
  if board.values.count(marker) == 2
    board.select{|k,v| v == ' '}.keys.first
  else
    false
  end
end

def comp_picks_square(board)
  case
  when two_in_a_row(board, "X").integer?
    position = two_in_a_row(board, "X")
  when two_in_a_row(board,"O").integer?
    position = two_in_a_row(board, "O")
  else  
    position = empty_spaces(board).sample
  end
  board[position] = "O"
end

def check_winner(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

winner = false

begin
  board = initialize_board
  draw_numbered_board("")
  draw_board(board)

  begin
    player_picks_square(board)
    if winner == false || winner == nil
      comp_picks_square(board)
    end
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