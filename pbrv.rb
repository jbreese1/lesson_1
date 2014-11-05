#pass by value

def some_method(str)
  str.changeit
end

outer_str = 'hi'  #outer string will not be manipulated if you do not reset the value

outer_str = some_method(outer_str)  #pass by value, setting a new value for a variale


#------------------------------------------

#pass by reference

def some_method(str)
  str.changeit
end

outer_str = 'hi'  
some_method(outer_str)  #changes a space in memory.  it references a place in memory


#ruby does something in between

def some_method(obj)
  obj.uniq
end

outer_obj = [1, 2, 2, 3, 3]
some_method(outer_obj)

puts outer_obj

#need to know, as it passes through the method, did it change?  it depends what happens in this method
# does it mutate the caller?

#you can reset in a pass by value way by resetting the variable = to method(outer_obj)
#know how the object is being used!
#passing by value of the reference
