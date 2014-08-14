require 'minitest/autorun'

module Flatten 
  extend self 

  def my_flatten 
    self.inject([]) do |arr, val| 
      arr << val.shift
      arr
    end
  end
end

describe Flatten do 

  it 'flatten an array' do 
    [[1,2,3]].extend(Flatten).my_flatten.must_equal [1,2,3]  
  end

end
