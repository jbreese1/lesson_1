def losing_msg(player_input, computer_input)
  puts "You chose #{player_input} and the computer chose #{computer_input}.\n You lose, better luck next time!"
end

def winning_msg(player_input, computer_input)
  puts "You chose #{player_input} and the computer chose #{computer_input}. \n You win!"
end 

puts "Let's Play Rock Paper Scissors!"

CHOICES = {"p" => "paper", "r" => "rock", "s" => "scissors"}

begin
  player = ""
  until CHOICES.keys.include?(player)
    puts "Choose one (r/p/s)..."
    player = gets.chomp.downcase
  end 
  
  computer = CHOICES.keys.sample

  if player == computer
    puts "You both chose #{CHOICES[player]}. It's a tie"
  elsif player == "p" && computer == "r" || player == "r" && computer == "s" || player == "s" && computer == "p"
    winning_msg(CHOICES[player], CHOICES[computer])
  else
    losing_msg(CHOICES[player], CHOICES[computer])
  end
  
  puts "Want to play again? (y/n)"
  play = gets.chomp.upcase

  while play != "Y" || play != "N" do
    puts "Just tell me Y or N."
    play = gets.chomp.upcase
  end 

end while play == "Y"