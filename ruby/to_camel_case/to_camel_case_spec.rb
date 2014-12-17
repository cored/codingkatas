require 'minitest/autorun'

module ToCamelCase
  extend self

  def call(str)
    return "" if str.nil? || str.empty?
    pairs = str.split(/-|_/)
    "#{pairs[0]}#{pairs[1..-1].map(&:capitalize).join}"
  end
end

describe ToCamelCase do
  it 'returns blank for empty string' do 
    ToCamelCase.("").must_equal ""
    ToCamelCase.(nil).must_equal ""
  end

  it 'returns camel case string with dash delimmiter' do
    ToCamelCase.("hello-world").must_equal "helloWorld"
  end

  it 'returns camel case string with underscore as delimiter' do 
    ToCamelCase.("hello_world").must_equal "helloWorld"
  end
end
