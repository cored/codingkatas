require 'minitest/autorun'

module CountBy 
  extend self 

  def call(step, top)
    (1..top).to_a.map { |n| n * step }
  end
end

describe CountBy do 
  it 'counts from 1 five times with step of 1' do 
    CountBy.(1, 5).must_equal [1,2,3,4,5]
  end

  it 'counts from 2 to five times with step of 2' do 
    CountBy.(2, 5).must_equal [2,4,6,8,10]
  end

  it 'counts from 3 to five times with step of 3' do 
    CountBy.(3, 5).must_equal [3,6,9,12,15]
  end
end
