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
