module SplitStrings 
  extend self 

  def call(str) 
  end
end

describe SplitStrings do 
  it 'splits an string into pairs' do 
    expect(SplitStrings.('aabb')).to eql ['aa', 'bb']
  end
end
