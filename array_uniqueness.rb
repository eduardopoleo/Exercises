class String
  def char_uniqueness
    self.size == split('').uniq.size
  end
end

string1 ='abcdfg'
string2 ='aabcdfg'

p string1.char_uniqueness
p string2.char_uniqueness

