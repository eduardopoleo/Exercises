#Calculate the number of different between 2 strings.j

a = "abtdefgljkflksajfsl"
b = "abcdffg"

def calculate_hamming(a,b) 

  array1 = a.split("")
  array2 = b.split("")
  hamming = 0
  iterations = 0

  array1.each_with_index do |val, index|
    iterations += 1

    if val != array2[index]
      hamming +=1
    end

    if iterations == array1.length || iterations == array2.length
      break
    end
  end

  hamming
end


p calculate_hamming(a,b)

