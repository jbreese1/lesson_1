# Ask player their name and store it.

# create 6 decks
#   52 cards per deck, 4 suits
#   name the suits
#     hearts 
#     spades   
#     Diamond
#     club


# pull out random two cards for the player and computer
#   one to player, one to dealer, one to player, one to dealer
#   hide dealers first card from player
#   as cards are pulled, permanently remove them from the 6 decks and store them

# total the cards for player 
#   ask if they would like to hit or stay
#   if hit, display another card and total them
#   if stay keep the initial total

# reveal the dealers cards
#   if < 17, dealer must hit
#   elsif less than player, hit
#   else stay

# compare the two totals

# tell who won

# ask if they want to play again

puts "Hey, what's your name?"

player_name = gets.chomp

puts "Do you want to play blackjack? (y/n)"
power = gets.chomp.upcase