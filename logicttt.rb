def initialize_board
  board = {}
  (1..9).each { |position| board[position] = ' ' }
  board
end

winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def two_in_a_row(hsh, mrkr)
  if hsh.values.count(mrkr) == 2
    hsh.select{|k,v| v == ' '}.keys.first
  else
    false
  end
end

board = initialize_board

board[1] = "X"
board[2] = "X"

puts two_in_a_row(board, "X").class

puts two_in_a_row(board, "X").integer?