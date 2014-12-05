require 'minitest/autorun' 

class Array 
  def over(item) 
    start = index(item)
    return self[start+1..length] unless empty? || item.nil? || start.nil?
    []
  end
end

describe Array do 
  describe '#over' do 
    it 'returns all the numbers under the sent item' do 
      [1,2,3,4,5].over(1).must_equal [2,3,4,5]
    end

    it 'returns nil when theres no items in the array' do 
      [].over(100).must_equal []
    end

    it 'returns nil when the item is nil' do 
      [1,2,3].over(nil).must_equal []
    end

    it 'returns nil' do 
      [1,2,3].over(5).must_equal []
    end
  end
end
