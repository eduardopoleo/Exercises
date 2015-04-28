#G -> C
#C -> G
#T -> A
#A -> U

class Complement
  def self.of_dna(dna)
    dna_array = dna.split("")
    dna_array.each_with_index do |value, index|
      case value
      when "G"
        dna_array[index] = "C" 
      when "C"
        dna_array[index] = "G" 
      when "T"
        dna_array[index] = "A" 
      when "A"
        dna_array[index] = "U" 
      end 
    end
    rna = dna_array.join()
  end

  def self.iterate(dna)
    dna.each_char do |char|
      p char
    end
  end
end

p Complement.of_dna("GCTA")


