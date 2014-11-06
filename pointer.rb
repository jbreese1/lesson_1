

a = "hi"
b = a        #points them to the same value but from different address
puts "the letter b was assigned to letter a which was hi.  b is #{b}."
a = "bye"     # reassigned the variable a
puts "this is the letter B after a has been reassigned: #{b}"




a = "hi"
puts "Now A is reassigned to hi again"

b = a 

puts "Letter B was just assigned a value by setting it = to letter A.  B is #{b}"

a << ", Bob"  #mutated the caller, not reassigning

puts "A was now mutated to add the name bob.  A is #{a} and B is #{b}."

