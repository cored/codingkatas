require 'minitest/autorun' 

module IpToInt32 
  extend self 

  def call(ip)
    ip.split('.').inject(0) { |total, value| (total << 8) + value.to_i }
  end
end

describe IpToInt32 do 
  it 'returns the int32 representation of an ip address' do 
    IpToInt32.('128.32.10.1').must_equal 2149583361
  end
end

