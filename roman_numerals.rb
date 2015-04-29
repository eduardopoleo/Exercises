class Fixnum
  def to_roman
    arabic_number = self
    final_roman_number = ""

    result100, remainder100 = arabic_number.hundreds
    final_roman_number << result100

    result50, remainder50 = remainder100.fifties
    final_roman_number << result50

    result10, remainder10 =  remainder50.tens
    final_roman_number << result10

    final_roman_number << remainder10.ones

    final_roman_number
  end

  def hundreds
    result = ""
    if self >= 100
      result << "C"
      remainder =  self % 100
    elsif self == 99
      result << "IC"
      remainder = 0
    else
      remainder =  self
    end

    [result, remainder]
  end

  def fifties 
    result = ""
     
    if self % 50 >= 40
      result << "XC"
      remainder = self % 90
    elsif self >= 50 and self % 50 < 40
      result << "L"
      remainder = self % 50
    else
      remainder = 0
    end

    [result, remainder]
  end

  def tens
    result = ""
    number = self/10

    if number == 4 
      result << "XL"
    else
      number.times{result << "X"}
    end
    remainder = self % 10
    [result, remainder]
  end

  def ones
    result = ""
    number = 0

    if self == 4 
    result <<  "IV"
    elsif self == 9
      result <<  "IX"
      puts result
    else 
      if self / 5 > 0
        result << "V"
        number = self % 5
      else
        number = self
      end
    end
    number.times{result << "I"}
    result
  end
end


p 98.to_roman
