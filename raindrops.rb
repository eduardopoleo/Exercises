#Solution 1
class Raindrop
  def self.song(number)
    song = ""

    if number % 3 == 0
      song += "Pling"
    end

    if number % 5 == 0
      song += "Plang"
    end

    if number % 7 == 0
      song += "Plong"
    end

    if song == ""
      song =  number.to_s
    end

    song
  end

  def self.song2(number)
      song = ""
    divisors = {3 => "Pling", 5 => "Plang", 7 => "Plong"}

    divisors.each do |key, string|
      if number % key == 0
        song += string
      end
    end

    if song == ""
      song = number.to_s
    end

    song
  end
end


p Raindrop.song(105)
p Raindrop.song2(105)
p Raindrop.song2(1)


  
