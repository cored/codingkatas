require 'minitest/autorun'

module FleshKincaid
  extend self

  def call(str)
    words = str.split
    average_number_of_words = words.length
  end
end

describe FleshKincaid do
  it 'returns 3.67 for the string' do
    FleshKincaid.("The turtle is leaving.").must_equal 3.67
  end
end
