require "minitest/autorun"

module TopWords
  extend self

  def top_3_words(str)
    return [] if str.empty?
    words = str.scan(/\w+\'?\w?/).map(&:downcase)
    grouped_words = words.group_by do |word|
      words.count(word)
    end
    grouped_words.keys.sort do |a, b|
      b <=> a
    end.flat_map do |key|
      grouped_words[key]
    end.uniq[0..2]
  end
end

describe TopWords do

  it "matches should be lowercase" do
    TopWords.top_3_words("A").must_equal ["a"]
  end

  describe "for empty string" do
    it "returns empty array" do
      TopWords.top_3_words("").must_equal []
    end
  end

  describe "for string with one word" do
    it "returns the array with just that word" do
      TopWords.top_3_words("a").must_equal ["a"]
    end

    describe "one words of one or more character" do
      it "returns the array with just that word" do
        TopWords.top_3_words("aaa").must_equal ["aaa"]
      end
    end
  end

  describe "for string with two words" do
    it "returns the array with all the words" do
      TopWords.top_3_words("a b").must_equal ["a", "b"]
    end
  end

  describe "for string with three or more words" do
    it "returns the array with the top 3 more ocurrence words" do
      TopWords.top_3_words("a b c b").must_equal ["b", "a", "c"]
      TopWords.top_3_words(
        "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"
      ).must_equal ["e", "ddd", "aa"]
       TopWords.top_3_words(
         "  //wont won't won't"
       ).must_equal ["won't", "wont"]
    end

    describe "more than three words" do
      it "returns the array with the top 3 words with more ocurrence" do
        TopWords.top_3_words("aa aa aa bb bb c").must_equal %w|aa bb c|
      end
    end
  end
end
