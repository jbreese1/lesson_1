play = "Y"
puts "Let's Play Rock Paper Scissors!"

CHOICES = {"p" => "paper", "r" => "rock", "s" => "scissors"}

#method to print the winning message
def winning_msg(player_input, computer_input)
  puts "You chose #{player_input} and the computer chose #{computer_input}. \n You win!"
end

#method to print losing message
def losing_msg(player_input, computer_input)
  puts "You chose #{player_input} and the computer chose #{computer_input}.\n You lose, better luck next time!"
end

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
    puts "You both chose #{CHOICES[player]}. It's a tie"
  elsif player == "p" && computer == "r" || player == "r" && computer == "s" || player == "s" && computer == "p"
    winning_msg(CHOICES[player], CHOICES[computer])
  else
    losing_msg(CHOICES[player], CHOICES[computer])
  end
  
  #want to replay the game?  
  puts "Want to play again? (y/n)"

  play = gets.chomp.upcase
  
  #validating that player must tell me yes or no only.
  if play != "Y" || "N"
    puts "Seriously, tell me Y or N."
    play = gets.chomp.upcase
  else
  end
end