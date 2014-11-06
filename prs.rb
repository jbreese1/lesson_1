play = "Y"
puts "Let's Play Rock Paper Scissors!"

CHOICES = {"p" => "paper", "r" => "rock", "s" => "scissors"}

while play == "Y"
  #player makes a pick
  player = ""
  until CHOICES.keys.include?(player)
    puts "Choose one (r/p/s)..."
    player = gets.chomp.downcase
  end 
  #computer makes a pick
  computer = CHOICES.keys.sample

  #compare the choices
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

  play = gets.chomp.upcase
end