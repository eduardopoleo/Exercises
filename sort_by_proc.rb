number_of_s = Proc.new do |string|
  number = 0
  string.each_char do |char|
    if char == 's' 
      number += 1
    end
  end
  number
end

h = { 'ssss' => 23, 'ss' => 'sss', 'sssssss' => 'nightmare'}

p h.keys.map(&:to_s).sort_by(&number_of_s).reverse
