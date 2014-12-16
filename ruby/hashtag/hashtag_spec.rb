require 'minitest/autorun'

module Hashtag
  extend self

  def call(post)
    post.split(/\s/).
      select { |w| w =~ /^#+\w+$/ }.
      map { |w| w.gsub /#/, '' }
  end
end

describe Hashtag do
  it 'returns one item for "####many"' do
    Hashtag.('####many').must_equal ['many']
  end

  it 'returns an empty array for empty string' do
    Hashtag.('').must_equal []
  end

  it 'returns an array with one word for #word' do
    Hashtag.('#word').must_equal ['word']
  end

  it 'returns an empty array for string with ust hashtags' do
    Hashtag.('# # # # #').must_equal []
  end

  it 'returns an array with the words with hashtags' do
    Hashtag.('#hello #word #sorryNotSorry').must_equal %w|hello word sorryNotSorry|
  end

  it 'returns world for "# hello #world' do
    Hashtag.("# hello #world").must_equal ["world"]
  end

  it 'returns empty array for "hash#line"' do
    Hashtag.('hash#line').must_equal []
  end

  it 'returns empty for non alphabetic values' do
    Hashtag.('#?blue').must_equal []
    Hashtag.('#blue#blue').must_equal []
    Hashtag.(' # blue').must_equal []
  end
end
