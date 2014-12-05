require 'minitest/autorun'

module Powersets
  extend self

  def call(items)
    result = [[]]
    1.upto(items.size) do |idx|
      result += items.permutation(idx).to_a
    end
    result
  end
end

describe Powersets do
  it 'returns two cases for one item in an array' do
    Powersets.([1]).must_equal([
      [],
      [1]
    ])
  end

  it 'returns three cases for one item in an array' do
    Powersets.([1, 2]).must_equal([
      [],
      [1],
      [2],
      [1,2]
    ])
  end
end
