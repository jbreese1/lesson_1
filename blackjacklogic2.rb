require 'pry'

def add_card_to_total(card_total_array, additional_card)
  if additional_card.count == 1
    card_total_array.map! { |value| value + additional_card[0]}
  else
   total_1 = card_total_array.flatten.map { |value| value + 1 }
   total_2 = card_total_array.flatten.map { |value| value + 11 }
   card_total_array[0] = total_1.flatten.first
   card_total_array[1] = total_2.flatten.first
  end
end

player_card_total = [0]

card1 = [5]
card2 = [1, 11]


add_card_to_total(player_card_total, card1)
binding.pry
add_card_to_total(player_card_total, card2)
binding.pry
p player_card_total