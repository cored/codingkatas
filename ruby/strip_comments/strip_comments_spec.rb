require 'minitest/autorun'

module StripComments
  extend self

  def call(str, markers)
    return "" if str.empty? || markers.empty?
    str.split(/[#{markers.join("|")}]\s*.*/).map do |phrase| 
      phrase.gsub /\s$/, ''
    end.join
  end
end

describe StripComments do

  it 'returns empty for empty string and empty marker' do
    StripComments.("", []).must_equal ""
  end

  it 'removes comments for a single word' do
    StripComments.("with #comments", ["#"]).must_equal "with"
  end

  it 'removes comments for two words' do
    StripComments.("with two #comments", ["#"]).must_equal "with two"
  end

  it 'removes comments for two words and space after the comment marker' do
    StripComments.("with two # comments", ["#"]).must_equal "with two"
  end

  it 'removes comments for two words and two markers' do
    StripComments.("with two # comments !another", ["#", "!"]).must_equal "with two"
  end

  it 'removes comments even with new lines' do
    StripComments.("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"]).must_equal "apples, pears\ngrapes\nbananas"
  end
end
