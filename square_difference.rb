class SquareDifference
  def self.sum_squares(n)
    (1..n).map{|number| number**2}.reduce(:+)
  end

  def self.square_sum(n)
    ((1..n).reduce(:+))**2
  end

  def self.diff(n)
    self.sum_squares(n) - self.square_sum(n)
  end
end

p SquareDifference.diff(3)

