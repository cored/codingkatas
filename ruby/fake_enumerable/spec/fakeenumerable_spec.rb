require 'spec_helper'

describe FakeEnumerable do 
  let(:list) { SortedList.new }

  before do 
    # will get stored internally as 3,4,7,13,42
    list << 3 << 13 << 42 << 4 << 7
  end

  context "#map" do 
    subject { list.map { |x| x + 1 } }
    it { should =~ [4,5,8,14,43] } 
  end

end
