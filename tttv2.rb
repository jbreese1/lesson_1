#need to update brute force check if win
#need to make computer smarter with to_in_a_row

WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

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

def draw_board(board)
  system 'clear'
  puts "     |     |     "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
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

def two_in_a_row(hash, marker)
  if hash.values.count(marker) == 2
    hash.select{|k,v| v == ' '}.keys.first
  else
    false
  end
end

def computer_picks_square(line, board)
  puts "Now the computer will select a square."
  sleep(1)

  defend_this_square = nil
  attacked = false

  WINNING_LINES.each do |line|
    defend_this_square = two_in_a_row({line[0] => board[line[0]], line[1] => board[line[1]], line[2] => board[line[2]]}, "O")
    if defend_this_square
      board[defend_this_square] = "O"
      attacked = true
      break
    end
  end

  if attacked == false
    WINNING_LINES.each do |line|
      defend_this_square = two_in_a_row({line[0] => board[line[0]], line[1] => board[line[1]], line[2] => board[line[2]]}, "X")
      if defend_this_square
        board[defend_this_square] = "O"
        break
      end
    end
  end
  board[empty_spaces(board).sample] = "O" unless defend_this_square
end

def check_winner(board)
  winning_lines = WINNING_LINES
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

#----GAME START-----

winner = false

begin
  board = initialize_board
  draw_numbered_board("")
  draw_board(board)

  begin
    player_picks_square(board)
    if winner == false || winner == nil
      computer_picks_square(WINNING_LINES, board)
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