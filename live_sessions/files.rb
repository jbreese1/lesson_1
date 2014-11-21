filename = 'my_file.txt'


File.open(filename, "w+") do |file|
  file.write("Hi There!")
  #by putting this open code in a block, it will automatically close the file
end

#be careful for what overwrites and what appends

str = File.read(filename)

puts str