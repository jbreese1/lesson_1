require 'pry'

# Ask player their name and store it. -D

# create 6 decks
#   52 cards per deck, 4 suits - D
#   name the suits
#     hearts 
#     spades   
#     Diamond
#     club

# start player with 1000 units - D
# ask player what amount they want to wager - 
#   store this wager - D
# display what the amount is they are up or down during game play

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

#ask if they want to play again

SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
CARD_VALUES = {"Ace" => [1, 11], "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10}

START_WALLET = 10000
MINIMUM_BET = 100

def say(msg)
  puts "=> #{msg}"
end

def create_a_deck
  deck = {}
  SUITS.each { |suit| deck[suit] = CARD_VALUES.each { |value| value } }
  deck
end

def deck_array(number)
  (1..number).to_a
end

def create_multiple_decks(number_of_decks, full_deck)
  all_decks = {}
  number_of_decks.each { |deck_number| all_decks[deck_number] = full_deck }
  all_decks
end

def deal_a_card(universe, number_of_decks)
  deck_number = deck_array(number_of_decks).sample
  card_suit = SUITS.sample
  card_number = universe[deck_number][card_suit].keys.sample
  card_value = CARD_VALUES[card_number]
  return {:deck_number => deck_number, :suit => card_suit, :card_number => card_number, :value => card_value}
end

def get_player_bet
  begin
  player_bet_input = gets.chomp
  if player_bet_input.to_i.to_s != player_bet_input 
    puts "Enter a number of #{MINIMUM_BET} or higher. \n So how much do you want to wager?"
    player_bet_input = gets.chomp
  elsif player_bet_input.to_i.to_s == player_bet_input && player_bet_input.to_i < MINIMUM_BET
    puts "You need to bet at least #{MINIMUM_BET}. \n So how much do you want to wager?"
    player_bet_input = gets.chomp
  end
  end until player_bet_input.to_i.to_s == player_bet_input && player_bet_input.to_i >= MINIMUM_BET
  return player_bet_input
end

def reset_bet(user_bet)
  user_bet = 0
end

def display_cards(card1, card2)
  say "Your cards are:"
  say "#{card1[:card_number]} of #{card1[:suit]}"
  say ""
  say "They total up to: " 
  puts card1[:value] + card2[:value]
end

say "Hey, what's your name?"
player_name = gets.chomp

say "#{player_name}, do you want to play blackjack? (y/n)"
power = gets.chomp.upcase

one_deck = create_a_deck
say "How many decks do you want to play with? \n Give me a number 1-8."
number_decks_input = gets.chomp.to_i
deck_universe = create_multiple_decks(deck_array(number_decks_input),one_deck)

system 'clear'

say "Thanks.  We are going to start you off with $#{START_WALLET}. \n"
say "The minimum bet is #{MINIMUM_BET}.\n\n"
say "How much would you like to wager?"

player_bet = get_player_bet

player_first_card = deal_a_card(deck_universe,number_decks_input)
computer_first_card = deal_a_card(deck_universe,number_decks_input)
player_second_card = deal_a_card(deck_universe,number_decks_input)
computer_second_card = deal_a_card(deck_universe,number_decks_input)

say "Your cards are:"
say "Card 1: #{player_first_card[:card_number]} of #{player_first_card[:suit]}"
say "Card 2: #{player_second_card[:card_number]} of #{player_second_card[:suit]}"
say "and they add up to: " 
puts player_first_card[:value] + player_second_card[:value]
#inseert sometyupe of if statement for aces

player_bet = reset_bet(player_bet)





