require 'minitest/autorun'

module Anagram
  extend self

  def call(word, words)
    word = Word.new(word)
    words = words.map { |word| Word.new(word) }
    words.inject([]) do |anagrams, w|
      anagrams << w if w == word
      anagrams
    end.map(&:to_s)
  end

  class Word
    def initialize(word)
      @word = word
    end

    def ==(other)
      word.chars.sort.join == other.to_s.chars.sort.join
    end

    def to_s
      word
    end

    private

    attr_reader :word
  end
end

describe Anagram do

  it 'returns a list of anagrams for abba' do
    Anagram.('abba', ['aabb', 'abcd', 'bbaa', 'dada']).must_equal %w|aabb bbaa|
  end
end
