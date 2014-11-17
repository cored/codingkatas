require 'minitest/autorun'

module FormatWords
  extend self

  def call(words)
    return '' if words.nil? || words.empty?
    words.select! { |word| word =~ /\w+/ } if words.length > 1
    return words.first if words.length == 1
    "#{words[0..-2].map { |w| w }.join(', ')} and #{words[-1]}"
  end
end

describe FormatWords do
  it 'returns a proper formatted word for an array of three words' do
    FormatWords.(['ninja', 'samurai', 'ronin']).must_equal 'ninja, samurai and ronin'
  end

  it 'returns the same array for none words in it' do
    FormatWords.([]).must_equal ''
  end

  it 'returns a proper formatted word for two empty words and a word' do
    FormatWords.(['','','three']).must_equal 'three'
  end

  it 'returns the proper formatted word for one word' do
    FormatWords.(['one']).must_equal 'one'
  end

  it 'returns "" for [""]' do
    FormatWords.(['']).must_equal ''
  end

  it 'returns "" for nil' do
    FormatWords.(nil).must_equal ''
  end
end
