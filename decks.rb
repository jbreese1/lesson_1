require 'pry'

deck_universe = {1=>
  {"Hearts"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10},
   "Spades"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10},
   "Clubs"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10},
   "Diamonds"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10}},
 2=>
  {"Hearts"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10},
   "Spades"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10},
   "Clubs"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10},
   "Diamonds"=>
    {"Ace"=>[1, 11],
     "2"=>2,
     "3"=>3,
     "4"=>4,
     "5"=>5,
     "6"=>6,
     "7"=>7,
     "8"=>8,
     "9"=>9,
     "10"=>10,
     "Jack"=>10,
     "Queen"=>10,
     "King"=>10}}}

a_single_card = {:deck_number=>2, :suit=>"Spades", :card_number=>"King", :value=>10}

def remove_card_from_universe(card_universe, deck_to_remove_from, suit_of_card, card_number)
  card_universe[deck_to_remove_from][suit_of_card].delete_if { |k, v| k == card_number}
end

remove_card_from_universe(deck_universe, a_single_card[:deck_number], a_single_card[:suit], a_single_card[:card_number])

puts deck_universe

binding.pry

#deck_universe[a_single_card[:deck_number]][a_single_card[:suit]].delete_if { |k, v| k == a_single_card[:card_number] }
