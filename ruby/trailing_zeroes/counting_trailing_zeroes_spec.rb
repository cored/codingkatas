require 'minitest/autorun'

module TrailingZeroes
  extend self

  def call(number)
    pow = 1
    amount = 0
    while ( (number / (5**pow) > 0 ) )
      amount += (number / (5**pow))
      pow += 1
    end
    amount
  end
end

describe TrailingZeroes do
  it 'calculates the trailing zeroes for the 12' do
    TrailingZeroes.(12).must_equal 2
  end

  it 'calculates the trailing zeroes for the 1000' do
    TrailingZeroes.(1000).must_equal 249
  end
end
