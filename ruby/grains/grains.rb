class Grains
  GRAINS_IN_SQUARE = {1 => 1,
                      2 => 2, 
                      3 => 4,
                      4 => 8,
                      16 => 32768,
                      32 => 2147483648,
                      64 => 9223372036854775808} 

  def square(grain)
    GRAINS_IN_SQUARE[grain] 
  end

  def total
    GRAINS_IN_SQUARE.values.inject(0, :+)
  end

end
