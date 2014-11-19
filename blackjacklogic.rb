require 'pry'

def remove_card_from_universe(card_universe, deck_to_remove_from, suit_of_card, card_number)
  card_universe[deck_to_remove_from][suit_of_card].delete_if { |k, v| v == card_number }
end

# def deal_a_card(universe, number_of_decks, total_array, cards_in_hand)
#   deck_number = deck_array(number_of_decks).sample
#   card_suit = SUITS.sample
#   card_number = universe[deck_number][card_suit].keys.sample
#   card_value = CARD_VALUES[card_number]
#   remove_card_from_universe(universe, deck_number, card_suit, card_value)
#   add_card_to_total(total_array, card_value)
#   cards_in_hand.push({:deck_number => deck_number, :suit => card_suit, :card_number => card_number, :value => card_value})
#   return {:deck_number => deck_number, :suit => card_suit, :card_number => card_number, :value => card_value}
# end
# def deck_array(number)
#   (1..number).to_a
# end

# def add_card_to_total(card_total_array, additional_card)
#   if additional_card.count == 1
#     card_total_array.map! do |value|
#       if value + additional_card[0] <= 21
#         value + additional_card[0]
#       else

#       end
#     end 
#   else
#    total_1 = card_total_array.flatten.map { |value| value + 1 }
#    total_2 = card_total_array.flatten.map { |value| value + 11 }
#    total_1_trim = total_1.map! { |x| x if x <= 21 }
#    total_2_trim = total_2.map! { |x| x if x <= 21 }
#    card_total_array[0] = total_1_trim.flatten.first
#    card_total_array[1] = total_2_trim.flatten.first
#   end
# end

SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
CARD_VALUES = {"Ace" => [1, 11], "2" => [2], "3" => [3], "4" => [4], "5" => [5], "6" => [6], "7" => [7], "8" => [8], "9" => [9], "10" => [10], "Jack" => [10], "Queen" => [10], "King" => [10]}

universe = {1=>
  {"Hearts"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]},
   "Spades"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]},
   "Clubs"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]},
   "Diamonds"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]}},
 2=>
  {"Hearts"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]},
   "Spades"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]},
   "Clubs"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]},
   "Diamonds"=>{"Ace"=>[1, 11], "2"=>[2], "3"=>[3], "4"=>[4], "5"=>[5], "6"=>[6], "7"=>[7], "8"=>[8], "9"=>[9], "10"=>[10], "Jack"=>[10], "Queen"=>[10], "King"=>[10]}}}


p_total = [0]
cards = []


binding.pry