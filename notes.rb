#STRINGS
#If we want to iterate over string with index
string.split("").each_with_index do |value, index|
  new_array =[] 
  new_string = new_array.join()
end

# to simple iterate over the string
string.each_char do |char|

end

#strings are mutable in ruby
a = "abcd"
a[0] = "e"

#=> "ebcd"
#######################3
##Array

# to remove duplicate elements in an array 
array.uniq 
[1, 1, 1, 1].uniq.size == 1
#=> true
##################

#hash
hash.each do |key, value|

end
#to avoid confusion we should define the hashes like this
divisors = {3 => "Pling", 5 => "Plang", 7 => "Plong"}
divisors = {"a" => "Pling", "b" => "Plang", "x" => "Plong"}
####################################

#Time in Ruby 
time = Time.new(yyyy,mm,dd)

time + x #where x is in seconds

#the prefered way to solved this kind of exercises in ruby
class SomeClass
  def self.some_class_method(some_input)

  end
end

p SomeClass.some_class_method(some_input)









