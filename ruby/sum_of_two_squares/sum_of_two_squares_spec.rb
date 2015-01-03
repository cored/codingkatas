require 'minitest/autorun'

module SumOfTwoSquares
  extend self

  def call(number)
    nums = (0..number).to_a
    nums.inject([]) do |squares, n|
      nums.each do |k|
        unless squares.include?([n, k]) || squares.include?([k, n])
          squares << [n, k] if ((n**2)+(k**2)==number)
        end
      end
      squares
    end
  end
end

describe SumOfTwoSquares do
  it 'returns sum square pairs equal to 25' do
    SumOfTwoSquares.(25).must_equal [[0,5], [3, 4]]
    SumOfTwoSquares.(0).must_equal [[0,0]]
    SumOfTwoSquares.(2).must_equal [[1,1]]
  end
end
