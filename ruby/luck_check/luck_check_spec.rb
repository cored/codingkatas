require 'minitest/autorun' 

module LuckCheck 
  extend self 

  def call(str) 
    return false if str.empty? || str =~ /[a-zA-Z]+/
    numbers = str.chars.map(&:to_i)
    numbers[0, numbers.size/2].reduce(:+) == numbers[numbers.size/2, numbers.size].reduce(:+)
  end
end

describe LuckCheck do 

  it 'returns false for empty string' do 
    LuckCheck.("").must_equal false
  end

  it 'returns false for non numeric string' do 
    LuckCheck.("abc").must_equal false
  end

  it 'returns false for non lucky numbers' do 
    LuckCheck.("3344").must_equal false
  end

  it 'returns true for a lucky number' do 
    LuckCheck.("003111").must_equal true
  end
end
