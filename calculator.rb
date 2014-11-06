#from second lecture video
#1) this is string interpolation.  calls the .to_s method automatically
#   puts "the first number is #{num1}."
#   concat is "the first number is " + num1.to_s
#2) extract repetitive logic into a method
#3) keep track of variable types (class: string, integer, etc..)
#4) do not convert raw data.  keep the integrity of raw data
#5) debug using pry.  type: require 'pry'  then to pause execution
#   type binding.pry   to continue, hit cntrl - d

def say(msg)
  puts "Yo, #{msg}" #this is where you can manipulate what puts reads like
end

say "what is the first number?"
num1 = gets.chomp #don't add .to_i or .to_f.  you want to keep data integrity/raw

say "what is the second number?"
num2 = gets.chomp

say "choose a number to tell me what to do\n 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = num1.to_i + num2.to_i
  operation = "added"
elsif operator == '2'
  result = num1.to_i - num2.to_i
  opertation = "subtracted"
elsif operator == '3'
  result = num1.to_i * num2.to_i
  operation = "multiplied"
elsif operator == '4'
  result = num1.to_f / num2.to_f #floats because we want decimals
  operation = "divided"
else
  say result = "can't"
end

if result == "can't"
  say "I can't do that you idiot."
else
  say "this is what I got for you. I #{operation} #{num1} and #{num2} and it gave me #{result}."
end