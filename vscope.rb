#1 Create a local variable and modify it at an inner scope. You can try
#a) re-assigning the variable to something else
#b) call a method that doesn’t mutate the caller
#c) call a method that mutates the caller.

#2 Create a local variable at an inner scope and try to 
#  reference it in the outer scope. What happens when you have nested do/end blocks?

arr = [1, 2, 2, 3, 3, 4, 5, 6, 6]

puts "arr is originally #{arr}"

#a

arr = [5, 5, 6, 7, 8]
puts "after being reassigned, arr is #{arr}"

#b
def dnm(var)
  puts "in the method dnm, the arr is #{var.uniq}"
end

dnm(arr)

puts "as we can see the caller, arr, was not mutated: #{arr}"

#c
def mtc(var)
  puts "in the method mtc, arr will be destructively made unique.  like this: #{var.uniq!}"
end

mtc(arr)

puts "see, i told you it was permanent #{arr}"