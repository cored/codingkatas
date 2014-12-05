require 'minitest/autorun'

module RGB
  extend self

  def call(r, g, b)
    [r, g, b].map do |v| 
      v = 255 if v > 255
      v = 0 if v < 0
      "%02X" % v 
    end.join
  end
end


describe RGB do
  it 'returns proper code for 255 255 255' do
    RGB.(255, 255, 255).must_equal 'FFFFFF'
  end

  it 'return proper code for 255 255 300' do
    RGB.(255, 255, 300).must_equal 'FFFFFF'
  end

  it 'returns proper code for 0 0 0' do 
    RGB.(0, 0, 0).must_equal '000000'
  end

  it 'returns proper code for 148 0 211' do 
    RGB.(148, 0, 211).must_equal '9400D3'
  end
end

