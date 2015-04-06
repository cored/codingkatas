require 'minitest/autorun'

module VowelCount
  extend self 

  def call(str)
    str.scan(/a|e|i|o|u/).size
  end
end

describe VowelCount do 
  it 'returns 0 for non vowels in a string' do 
    VowelCount.('pyx').must_equal 0
  end

  it 'returns 1 for one vocal' do 
    VowelCount.('a').must_equal 1
  end

  it 'returns 2 for two vocals' do 
    VowelCount.('ae').must_equal 2
  end

  it 'returns 3 for three vocals' do 
    VowelCount.('aei').must_equal 3
  end

  it 'returns 4 for four vocals' do 
    VowelCount.('aeio').must_equal 4
  end

  it 'returns 5 for five vocals' do 
    VowelCount.('aeiou').must_equal 5
  end
end
