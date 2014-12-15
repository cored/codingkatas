require 'minitest/autorun'

module Hashtag 
  extend self 

  def call(post)
    []
  end
end

describe Hashtag do 

  it 'returns an empty array for empty string' do 
    Hashtag.('').must_equal []
  end

end
