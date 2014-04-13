require_relative 'numbers'

class NumberToWords
  NUMBERS = [Ones, Tens, Twenties, Thirties]

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

