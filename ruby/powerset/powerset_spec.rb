require 'minitest/autorun' 

module Powerset 
  extend self 

  def call(str)
    characters = str.chars
    (0..characters.size).map do |n| 
      characters.combination(n).to_a
    end.reduce(:+).map(&:join)
  end
end

describe 'Powerset of an string' do 

  it 'returns the power set for ab' do 
    Powerset.('ab').must_equal ['', 'a', 'b', 'ab']
  end

  it 'returns the power set for abc' do 
    Powerset.('abc').must_equal  ['' , 'a', 'b', 'c', 'ab', 'ac', 'bc', 'abc'] 
  end
end
