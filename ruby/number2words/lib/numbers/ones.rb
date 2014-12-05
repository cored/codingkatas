class Ones < Number
  WORDS = [" ", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] 

  def can_convert?
    num_word / 10 == 0 
  end

  def to_s
    WORDS[num_word%10]
  end
end
