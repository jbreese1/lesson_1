#calc2

def say(msg)
  puts "Yo, #{msg}" #this is where you can manipulate what puts reads like
end

def is_num_float(number)
  !(number !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/)
end

OPERATION = {'1' => "added", '2' => "subtracted", '3' => "multiplied", '4' => "divided"}

power = "Y" #turns on calc

while power == "Y"
  
  begin
    say "what is the first number?"
    num1 = gets.chomp  
  end until is_num_float(num1)

  begin
    say "what is the second number?"
    num2 = gets.chomp  
  end until is_num_float(num2)

  
  operator = ""
  until OPERATION.keys.include?(operator)
    say "choose a number to tell me what to do\n 1) add 2) subtract 3) multiply 4) divide"
    operator = gets.chomp
  end

  if operator == '1'
    result = num1.to_i + num2.to_i
  elsif operator == '2'
    result = num1.to_i - num2.to_i
  elsif operator == '3'
    result = num1.to_i * num2.to_i
  elsif operator == '4'
    result = num1.to_f / num2.to_f #floats because we want decimals
  else
    say result = "can't"
  end

  say "this is what I got for you. I #{OPERATION[operator]} #{num1} and #{num2} and it gave me #{result}."

  say "you want to do another calculation? (y/n)"
  power = gets.chomp.upcase
end