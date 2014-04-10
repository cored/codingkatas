class NumberToWords
  def self.convert(number)
    new(number).convert
  end

  def initialize(number)
    @number = number
  end

  def convert 
    ones = Ones.for(number)
    tens = Tens.for(number)
    return ones.to_s if ones.can_convert?
    return tens.to_s if tens.can_convert?
  end

  private 
  attr_reader :number
end

class Ones
  WORDS = %w|zero one two three four five six seven eight nine| 

  def self.for(num)
    new(num)
  end

  def initialize(num_word)
    @num_word = num_word
  end

  def can_convert?
    num_word / 10 == 0 
  end

  def to_s
    WORDS[num_word%10]
  end

  private 
  attr_reader :num_word

end

class Tens 
  WORDS = %w|ten eleven twelve therteen fourteen fithteen sixteen seventeen eighteen nineteen|

  def self.for(num)
    new(num)
  end

  def initialize(num_word)
    @num_word = num_word
  end

  def can_convert?
    num_word / 10 == 1
  end

  def to_s 
    WORDS[num_word%10]
  end

  private 
  attr_reader :num_word
end
