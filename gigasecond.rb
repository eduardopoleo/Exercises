class Gigasecond
  def self.from(bday) 
    bday + 1000000000
  end
end

bday = Time.new(2011,4,25)

p Gigasecond.from(bday)
