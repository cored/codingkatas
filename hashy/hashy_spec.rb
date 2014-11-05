require 'minitest/autorun' 

module Hashy
  extend self

  def call(hash)
    hash.keys.map{ |key| "#{key} = #{hash[key]}" }.join(', ')
  end
end

describe Hashy do 

  describe '#to_s' do 
    it 'returns a proper representation of a hash as an string' do 
      Hashy.({a:1}).must_equal 'a = 1'
      Hashy.({a:1,b:2}).must_equal 'a = 1, b = 2'
    end
  end

end
