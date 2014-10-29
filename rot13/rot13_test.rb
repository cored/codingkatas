require 'minitest/autorun'

module Rot13 
  extend self 
  LETTERS = %w|a b c d e f h i j k l m n o p q r s t u v w x y z|

  def rot13
    self.chars.map do |char| 
      LETTERS[self.index(char) + 13]
    end
  end
end

describe Rot13 do 
  it 'returns test for grfg' do 
    'grfg'.extend(Rot13).rot13.must_equal 'test'    
  end
end
