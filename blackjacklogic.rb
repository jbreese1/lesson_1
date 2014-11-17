require 'pry'

def add_card_to_total(card_total_array, additional_card)
  if additional_card.kind_of?(Integer)
    card_total_array.map! { |value| value + additional_card }
  else
    total_1 = card_total_array.flatten.map { |value| value + 1 }
    total_2 = card_total_array.flatten.map { |value| value + 11 }
    card_total_array = total_1 + total_2
  end
end

player_card_total = [0]

new_card = [1, 11]

add_card_to_total(player_card_total, new_card)
binding.pry


second = 5

add_card_to_total(player_card_total, second)

binding.pry

third = [1, 11]
add_card_to_total(player_card_total, third)

binding.pry