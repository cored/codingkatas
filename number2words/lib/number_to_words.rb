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
  WORDS = %w|ten eleven twelve thirteen fourteen fithteen sixteen seventeen eighteen nineteen|

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

class Twenties 
  WORDS = %w|twenty|

  def self.for(num) 
    new(num)
  end

  def initialize(num_word)
    @num_word = num_word
  end

  def can_convert?
    num_word / 10 == 2
  end
  
  def to_s
    WORDS[num_word%10]
  end

  private 
  attr_reader :num_word
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

