require 'minitest/autorun' 

module RetSec 
  extend self 

  def call(word)
    word = Word.new(word)
    return word.to_s
  end

  class Word 
    def initialize(word)
      @word = word
    end

    def to_s
      "#{left}#{middle}#{right}"
    end

    private 

    def left
      if is_even?
        word[word.size/2..-1]
      else 
        word[word[(word.size/2+1)..-1]]
      end
    end

    def right 
      if is_even?
        word[0...word.size/2]
      else 
        word[0..(word.size/2-1)]
      end
    end

    def middle 
      if is_even?
        ""
      else 
        word[word.size/2]
      end
    end

    def is_even?
      word.size % 2 == 0
    end

    attr_reader :word
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
