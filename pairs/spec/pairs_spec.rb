class Pairs

  def initialize(values)
    @values = values
  end

  def values 
    return [] if @values.size == 1
    @values.map do |num|
      [num, @values[@values.index { |n| n + num == 100 }]] 
    end
  end
end

describe Pairs, '#values' do 

  it 'returns empty array for one item' do 
    pairs = Pairs.new([50])
    expect(
      pairs.values
    ).to eql []
  end

  it 'returns a pair for two numbers that sum a hundred' do 
    pairs = Pairs.new([50,50])
    expect(
      pairs.values
    ).to eql [[50,50]]
  end

  it 'returns two pairs for 4 numbers if the sum is a hundred' do 
    pairs = Pairs.new([50,50,49,51])
    expect(
      pairs.values
    ).to eql [[50,50],[49,51]]
  end

end
