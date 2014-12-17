require 'minitest/autorun'

module ToCamelCase
  extend self

  def call(str)
    head, *tail = str.split(/[-_]/)
    "#{head}#{tail.map(&:capitalize).join}"
  end
end

describe ToCamelCase do
  it 'returns blank for empty string' do 
    ToCamelCase.("").must_equal ""
  end

  it 'returns camel case string with dash delimmiter' do
    ToCamelCase.("hello-world").must_equal "helloWorld"
  end

  it 'returns camel case string with underscore as delimiter' do 
    ToCamelCase.("hello_world").must_equal "helloWorld"
  end
end
