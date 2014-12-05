require 'minitest/autorun'

module AsciiToHex

  def self.to_ascii(hex)
    hex.scan(/../).map(&:hex).map(&:chr).join
  end

  def self.to_hex(str)
    str.each_byte.map do |char|
      "%02X" % char
    end.join.downcase
  end

end

describe AsciiToHex do
  it 'transforms an string to hex' do
    AsciiToHex.to_hex("Look mom, no hands").must_equal "4c6f6f6b206d6f6d2c206e6f2068616e6473"
  end

  it 'transforms an string to hex' do
    AsciiToHex.to_ascii("4c6f6f6b206d6f6d2c206e6f2068616e6473").must_equal "Look mom, no hands"
  end
end
