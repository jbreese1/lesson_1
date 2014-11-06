play = "y"

puts "Play Rock Paper Scissors!"

while play == "y"
  puts "Choose one: (p/r/s)"

  player = gets.chomp

  choices = ["p", "r", "s"]

  computer = choices.sample

  if player == computer
    puts "You both chose #{player}. It's a tie"
  elsif player == "p"
    if computer == "r"
      puts "You chose #{player} and the computer chose #{computer}.\n  You Win!"
    else
      puts "You chose #{player} and the computer chose #{computer}. \n  You lose.  Better luck next time."
    end
  elsif player == "r"
    if computer == "s"
      puts "You chose #{player} and the computer chose #{computer}.\n  You Win!"
    else
      puts "You chose #{player} and the computer chose #{computer}.\n You lose.  Better luck next time."
    end
  elsif player == "s"
    if computer == "p"
      puts "You chose #{player} and the computer chose #{computer}.\n  You Win!"
    else
      puts "You chose #{player} and the computer chose #{computer}.\n You lose.  Better luck next time."
    end
  end
    
  puts "Want to play again? (y/n)"

  play = gets.chomp
end