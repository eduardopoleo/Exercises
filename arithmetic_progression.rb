#Determine if the progression is constant

a = [4, 6, 7]
b = [4, 5, 6]
c = [3,6,9,12,15,18,21,24,27,30]

def progression(array)
  difference = []
  array.each_with_index do |val, index|
    if index == 0
      next
    end
    difference << (val - array[index-1])
  end

  difference.uniq.size == 1
end

p progression(a)
p progression(b)
p progression(c)
