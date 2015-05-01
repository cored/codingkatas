require 'minitest/autorun'

module ShadesOfGrey
  extend self

  def call(number)
    (1..number).inject([]) do |result, color|
      hex = color.to_s(16)
      hex = color < 15 ? "0#{hex}" * 3 : hex * 3
      result << "##{hex}"
    end[0..254]
  end
end

describe ShadesOfGrey do
  it 'returns an empty array for minus 0 numbers' do
    ShadesOfGrey.(-1).must_equal []
  end

  it 'returns an array of hex numbers until the number' do
    ShadesOfGrey.(2).must_equal ["#010101", "#020202"]
  end

  it 'returns an array no more than 256 positions' do 
    ShadesOfGrey.(258).size.must_equal 255
  end

  it 'sorts in ascending order' do 
    ShadesOfGrey.(256).last.must_equal '#ffffff'
  end
end
