class Number 

  def self.for(num)
    new(num)
  end

  def initialize(num_word)
    @num_word = num_word
  end

  private
  attr_reader :num_word
end

class Ones < Number
  WORDS = [" ", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] 

  def can_convert?
    num_word / 10 == 0 
  end

  def to_s
    WORDS[num_word%10]
  end
end

class Tens < Number 
  WORDS = %w|ten eleven twelve thirteen fourteen fithteen sixteen seventeen eighteen nineteen|

  def can_convert?
    num_word / 10 == 1
  end

  def to_s 
    WORDS[num_word%10]
  end
end

class Twenties < Number
  WORDS = %w|twenty|

  def can_convert?
    num_word / 10 == 2
  end
  
  def to_s
    "#{WORDS[0]} #{Ones.for(num_word%10).to_s}".strip
  end
end

class NumberToWords
  NUMBERS = [Ones, Tens, Twenties]

  def self.convert(number)
    new(number).convert
  end

  def initialize(number)
    @number = number
  end

  def convert 
    NUMBERS.each do |num|
      n = num.for(number)
      return n.to_s if n.can_convert?
    end
  end

  private 
  attr_reader :number, :numbers
end

