class Tens < Number 
  WORDS = %w|ten eleven twelve thirteen fourteen fithteen sixteen seventeen eighteen nineteen|

  def can_convert?
    num_word / 10 == 1
  end

  def to_s 
    WORDS[num_word%10]
  end
end

