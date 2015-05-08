#STRINGS
#If we want to iterate over string with index
string.split("").each_with_index do |value, index|
  new_array =[] 
  new_string = new_array.join()
end

string.chars.each_with_index

# to simple iterate over the string
string.each_char do |char|

end

#strings are mutable in ruby
a = "abcd"
a[0] = "e"

#=> "ebcd"
#######################3
##ARRAY

# to remove duplicate elements in an array 
array.uniq 
[1, 1, 1, 1].uniq.size == 1
#=> true


#RANGE
#Iterate over range of numbers:
(1..n).each do |number|

end

#Ranges 

(1..3) #=> [1, 2, 3] inclusive
(1...3) #=> [1, 2] exclusive
#Ranges include the module enumerable so we can say
(1..3).reduce(:+) #etc

#HASH

hash
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

#modules
5 % 4 #=> 1
5 % 3 #=> 2
5 % 6 #=> 5
5 % 5 #=> 0

#Division 
6 / 2 #=> 3
6 / 3 #=> 2
6 / 4 #=> 1
6 / 6 #=> 1
6 / 7 #=> 0


