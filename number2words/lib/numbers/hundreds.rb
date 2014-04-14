class Hundreds < Number
  WORDS = %w|hundred|

  def self.for(num_word)
    new(num_word)
  end

  def can_convert?
    num_word / 100 == 1
  end

  def to_s 
    "#{Ones.for(num_word%10).to_s} #{WORDS[0]} #{Ones.for(num_word%10).to_s}".strip
  end
end
