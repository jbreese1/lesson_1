require 'pry'

SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
CARD_VALUES = {"Ace" => [1, 11], "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10}

START_WALLET = 10000
MINIMUM_BET = 100

GAMESBEFORESHUFFLE = 10
MOVES = ["H", "S"]

def say(msg)
  puts "=>     #{msg}"
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
  remove_card_from_universe(universe, deck_number, card_suit, card_number)
  return {:deck_number => deck_number, :suit => card_suit, :card_number => card_number, :value => card_value}
end



def get_player_bet(wallet)
  begin
  say "The minimum bet is #{MINIMUM_BET}."
  say "How much would you like to wager?"
  player_bet_input = gets.chomp
  if player_bet_input.to_i.to_s != player_bet_input 
    puts "Enter a number of #{MINIMUM_BET} or higher. \n So how much do you want to wager?"
    player_bet_input = gets.chomp
  elsif player_bet_input.to_i.to_s == player_bet_input && player_bet_input.to_i < MINIMUM_BET
    puts "You need to bet at least #{MINIMUM_BET}. \n So how much do you want to wager?"
    player_bet_input = gets.chomp
  end
  end until player_bet_input.to_i.to_s == player_bet_input && player_bet_input.to_i >= MINIMUM_BET
  wallet -= player_bet_input.to_i
  return player_bet_input.to_i
end

def number_of_decks
  begin
  say "How many decks do you want to play with? \n Give me a number 1-8."
  number_decks_input = gets.chomp
  if number_decks_input.to_i.to_s != number_decks_input 
    puts "Enter a number of decks you want to play with between 1 and 8."
    number_decks_input = gets.chomp
  elsif number_decks_input.to_i.to_s == number_decks_input && number_decks_input.to_i < 1 && number_decks_input.to_i > 8
    puts "Please enter a number of decks you want to play with between 1 and 8."
    number_decks_input = gets.chomp
  end
  end until number_decks_input.to_i.to_s == number_decks_input && number_decks_input.to_i >= 1 && number_decks_input.to_i <=8
  return number_decks_input.to_i
end

def remove_card_from_universe(card_universe, deck_to_remove_from, suit_of_card, card_number)
  card_universe[deck_to_remove_from][suit_of_card].delete_if { |k, v| k == card_number}
end

def reset_bet(user_bet)
  user_bet = 0
end

def display_cards(player_cards, p_total, dealer_cards, d_total, bet)
  say "Your cards are:"
  player_cards.each { | card | say "#{card[:card_number]} of #{card[:suit]}"}
  say "----------------------------"
  if p_total.uniq.count == 1
    say "Your total is: #{p_total[0]}"
  else
    p_total.flatten.uniq.each { |total| say "Your total can be: #{total}" if total <= 21 }
  end
  say ""
  say "The dealer's cards are:"
  dealer_cards.each { |card| say "#{card[:card_number]} of #{card[:suit]}"}
  say "----------------------------"
  if d_total.uniq.count == 1
    say "The dealer's total is: #{d_total[0]}"
  else
    d_total.flatten.uniq.each { |total| say "The dealer's total can be: #{total}" }
  end
  say ""
  say "You bet $#{bet} on this hand."
  say ""
end

def player_hit_or_stay(universe, num_of_decks, all_player_cards, player_card_total, dealer_cards, dealer_card_total, bet)
  begin
    say "What would you like to do?"
    say "H = Hit, S = Stay"
    player_move = gets.chomp.upcase
    if MOVES.include?(player_move) == false
      say "Please select either H = Hit or S = Stay."
      player_move = gets.chomp
    end
    system 'clear'
    if player_move == "H"
      say "You chose to hit."
      all_player_cards.push(deal_a_card(universe, num_of_decks))
      display_cards(all_player_cards, player_card_total, dealer_cards, dealer_card_total, bet)
      sleep(2)
      say "What would you like to do?"
      player_move = gets.chomp.upcase
    end
  end until player_move == "S"
end

def dealer_hit_or_stay
end

def check_natural_blackjack(player_cards, dealer_cards)
  if player_cards.include?([21])
    pn21 = true
  else
    pn21 = false
  end
  if dealer_cards.include?([21])
    dn21 = true
  else
    dn21 = false
  end
  case 
    when pn21 == true && dn21 == true
      return "Push"
    when pn21 == true && dn21 == false
      return "Natural"
    when pn21 == false && dn21 == true
      return "Dealer Blackjack"
    when pn21 == false && dn21 == false
      return "Continue"
    end
end

def add_card_to_total(card_total_array, additional_card)
  if additional_card.count == 1
    final_total = card_total_array.map! { |value| value + additional_card[0]}
  else
    total_1 = card_total_array.flatten.map! { |value| value + additional_card[0]}
    total_2 = card_total_array.flatten.map! { |value| value + additional_card[1]}
    final_total = total_1 + total_2
    final_total
  end
  return final_total.uniq
end


def opening_cards(universe, number_of_decks)
  player_first_card = deal_a_card(universe,number_of_decks)
  dealer_first_card = deal_a_card(universe,number_of_decks)
  player_second_card = deal_a_card(universe,number_of_decks)
  dealer_second_card = deal_a_card(universe,number_of_decks)
  return player_first_card, dealer_first_card, player_second_card, dealer_second_card
end

def opening_cards_total(first_card_value, second_card_value)
  if first_card_value.kind_of?(Array) && second_card_value.kind_of?(Integer)
    total_1 = [first_card_value[0] + second_card_value]
    total_2 = [first_card_value[1] + second_card_value]
    total_3 = total_1
    total_4 = total_2
  elsif first_card_value.kind_of?(Integer) && second_card_value.kind_of?(Array)
    total_1 = [second_card_value[0] + first_card_value]
    total_2 = [second_card_value[1] + first_card_value]
    total_3 = [second_card_value[0] + second_card_value[0]]
    total_4 = total_2
  elsif first_card_value.kind_of?(Array) && second_card_value.kind_of?(Array)
    total_1 = [first_card_value[0] + second_card_value[0]]
    total_2 = [first_card_value[1] + second_card_value[0]]
    total_3 = [first_card_value[0] + second_card_value[1]]
    total_4 = [first_card_value[1] + second_card_value[1]]
  else
    total_1 = [first_card_value + second_card_value]
    total_2 = total_1
    total_3 = total_1
    total_4 = total_1
  end    
  return [total_1, total_2, total_3, total_4]  
end

def payout(player_bet, wallet, scenario)
  case scenario
    when scenario == "Push"
      say "You and the dealer both had natural Blackjack."
      say "It's a push.  You keep your bet of $#{player_bet}."
      wallet += player_bet
    when scenario == "Natural"
      say "You have a natural Blackjack."
      say "Natural Blackjacks pay 3/2.  You just won $#{player_bet * 1.5}."
      wallet += player_bet * 2.5
    when scenario == "Dealer Blackjack"
      say "The dealer has a natural Blackjack."
      say "You lose.  You lost $#{player_bet} on that hand."
    when scenario == "Player Wins"
      say "You just won $#{player_bet}."
      wallet += player_bet * 2
    when scenario == "Dealer Wins"
      say "Dealer wins. You just lost #{player_bet}."
  end
end

def check_game_winner(player_total, dealer_total)
  p_total = 10
  d_total = 9
  if p_total > d_total
    return "Player Wins"
  else
    return "Dealer Wins"
  end
end


#-------game start--------
say "Hey, what's your name?"
player_name = gets.chomp

game_count = 1

#makes the decks
one_deck = create_a_deck
number_decks_input = number_of_decks

ongoing_wallet = START_WALLET

begin
  deck_universe = create_multiple_decks(deck_array(number_decks_input),one_deck)
end until game_count == 1 || game_count == GAMESBEFORESHUFFLE
say "Thanks.  We will play with #{number_decks_input} decks."
say "We are going to start you off with $#{START_WALLET}."
say "Please wait while we shuffle the cards."
sleep(2.5)

begin
  system 'clear'
  puts "This is hand number #{game_count}.  We reshuffle all the decks after #{GAMESBEFORESHUFFLE} hands."
  player_bet = get_player_bet(ongoing_wallet)

  player_first_card, dealer_first_card, player_second_card, dealer_second_card = opening_cards(deck_universe, number_decks_input)
  all_cards_for_player = [player_first_card, player_second_card]
  all_cards_for_dealer = [dealer_first_card, dealer_second_card]

  player_total_array = opening_cards_total(player_first_card[:value], player_second_card[:value])
  dealer_total_array = opening_cards_total(dealer_first_card[:value], dealer_second_card[:value])

  display_cards(all_cards_for_player, player_total_array, all_cards_for_dealer, dealer_total_array, player_bet)

  # use case statement here

  game_result = check_natural_blackjack(player_total_array, dealer_total_array) 
  case game_result
  when "Continue"
    player_hit_or_stay(deck_universe, number_decks_input, all_cards_for_player, player_total_array, all_cards_for_dealer, dealer_total_array, player_bet)
  else
    payout(player_bet, ongoing_wallet, game_result)
  end

  dealer_hit_or_stay
  game_result = check_game_winner(all_cards_for_player, all_cards_for_dealer)

  payout(player_bet, ongoing_wallet, game_result)
  binding.pry
  player_bet = reset_bet(player_bet)

  game_count += 1

  say "#{player_name}, do you want to play another hand? (y/n)"
  power = gets.chomp.upcase

end while power == "Y" && game_count < 10