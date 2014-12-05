require 'minitest/autorun'

module Last 
  extend self 

  def call(*obj)
    obj.inject(0) do |final, n| 
      final = n.chars.last if n.is_a? String
      final = n.last if n.is_a? Array
      final = n if n.is_a? Fixnum
      final
    end
  end
end

describe Last do 

  it 'returns the last element for an array' do 
    Last.([1,2,3]).must_equal 3
  end

  it 'returns the last element for an String' do 
    Last.("xyz").must_equal "z"
  end

  it 'returns the last element for a list of arguments' do 
    Last.(1,2,3,4).must_equal 4
  end
end
