require 'minitest/autorun'

module ToUnderscore
  extend self

  def call(str)
    str.scan(/[A-Z][[a-z]*|\d+]/).map(&:downcase).join('_')
  end
end

describe ToUnderscore do
  describe 'returns snake case if sent camel case' do
    it 'returns test_controller' do
      ToUnderscore.('TestController').must_equal 'test_controller'
    end

    it 'returns movies_and_books' do 
      ToUnderscore.('MoviesAndBooks').must_equal 'movies_and_books'
    end

    it 'returns app7_test' do 
      ToUnderscore.('App7Test').must_equal 'app7_test'
    end
  end
end
