module Flatten
  extend self

  def my_flatten
    inject([]) do |result, item|
      result = item.is_a?(Array) ? result += item : result << item
    end
  end
end

describe Flatten do
  it 'flatten an empty array' do
    expect([].extend(Flatten).my_flatten).to eql []
  end

  it 'flatten an array with [1,2,3]' do
    expect([1,2,3].extend(Flatten).my_flatten).to eql [1,2,3]
  end

  it 'flatten an array with [[1,2,3], ["a","b"]]' do
    expect([[1,2,3],["a", "b"]].extend(Flatten).my_flatten).to eql [1,2,3,"a","b"]
  end

  it 'flatten [[1,2,3],["a","b","c"],[1,2,3],"a"]' do 
    expect([[1,2,3],["a","b","c"],[1,2,3],"a"].extend(Flatten).my_flatten).to eql [1,2,3,"a","b","c",1,2,3,"a"]
  end

  it 'flatten [[3,4,5],[[9,9,9]],["a,b,c"]]' do 
    expect([[3,4,5],[[9,9,9]],["a,b,c"]].extend(Flatten).my_flatten).to eql [3,4,5,[9,9,9],"a,b,c"]
  end

  it 'flatten [[[3],[4],[5]],[9],[9],[8],[[1,2,3]]]' do 
    expect([[[3],[4],[5]],[9],[9],[8],[[1,2,3]]].extend(Flatten).my_flatten).to eql [[3],[4],[5],9,9,8,[1,2,3]]
  end

  it 'flatten [[3,4,5],[[9,9,9]],["a,b,c"]]' do 
    expect([[3,4,5],[[9,9,9]],["a,b,c"]].extend(Flatten).my_flatten).to eql []
  end
end
