class Twenties < Number
  WORDS = %w|twenty|

  def can_convert?
    num_word / 10 == 2
  end
  
  def to_s
    "#{WORDS[0]} #{Ones.for(num_word%10).to_s}".strip
  end
end
