require 'minitest/autorun'

module Narcissistic
  extend self 

  def call(num)
    numbers = num.to_s.chars
    numbers.map(&:to_i).
      inject(0) { |sum, number| sum += number**numbers.size } == num
  end
end

describe Narcissistic do
  it 'returns true for one' do
    Narcissistic.(1).must_equal true
  end

  it 'returns false for for 22' do 
    Narcissistic.(22).must_equal false
  end

  it 'returns true for 153' do 
    Narcissistic.(153).must_equal true
  end

  it 'returns true for 1634' do 
    Narcissistic.(1634).must_equal true
  end
end
