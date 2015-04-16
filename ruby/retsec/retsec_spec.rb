require 'minitest/autorun' 

module RetSec 
  extend self 

  def call(word)
    return "#{word[word.size/2..-1]}#{word[0...word.size/2]}" if word.size % 2 == 0
    "#{word[(word.size/2+1)..-1]}#{word[word.size/2]}#{word[0..(word.size/2-1)]}"
  end
end

describe RetSec do 
  it 'swap halfs of a word if the word is even' do 
    RetSec.('hola').must_equal 'laho'
  end

  it 'swap halfs of a word leaving the middle intact if odd' do
    RetSec.('agent').must_equal 'nteag'
  end
end
