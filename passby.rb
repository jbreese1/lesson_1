#  Create a method that takes an array as a parameter. 
#  Within that method, try calling methods that do not 
#  mutate the caller. How does that affect the array outside 
#  of the method? What about when you call a method that mutates 
#  the caller within the method?


#method that takes an array

first = [1, 3, 6, 8, 2, 0, 3, 4, 5, 6, 8, 8]

puts "this is the starting array #{first}"

def array_method(arr)
  puts "uniq does not permanently change the caller #{arr.uniq}"
  puts "see #{arr}"
  puts "sort does not permanently change the caller #{arr.sort}"
  puts "see #{arr}"
end

array_method(first)

puts "now this is the array #{first} after non-mutating method"

def array_method2(arr)
  puts "uniq! does  permanently change the caller #{arr.uniq!}"
  puts "see #{arr}"
  puts "pop does  permanently change the caller by deleting a #{arr.pop}"
  puts "see #{arr}"
end

array_method2(first)

puts "this is the array #{first} at the end of it all"