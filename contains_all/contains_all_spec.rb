require 'minitest/autorun'

class Array
  def contains_all?(other_array)
    include?(other_array.pop)    
  end
end

describe Array, '#contains_all?' do
  before do 
    @items = [1,2,3,4,5,6,7,8,9]
  end

  it 'returns true if one element is inside the array' do 
    @items.contains_all?([1]).must_equal true
  end

  it 'returns false if one lement is not inside the array' do 
    @items.contains_all?([15]).must_equal false
  end

  it 'returns true if more than one number is inside the array' do 
    @items.contains_all?([1,2,3]).must_equal true
  end

  it 'returns false if more than one number is not inside of the array' do 
    @items.contains_all?([1,2,15]).must_equal false
  end

  it 'returns false for not included number in the middle' do 
    @items.contains_all?([1,15,2]).must_equal false
  end

end
