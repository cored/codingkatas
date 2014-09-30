require 'minitest/autorun'

module DomainExtractor 
  extend self 

  def call(url)
    url.split(/\//).inject("") do |result, piece| 
      result = piece.split('.').reject do |piece|
        piece =~ /com|www/
      end.join if piece.include?('.')
      result
    end
  end
end

describe DomainExtractor do 
  it 'returns github for the following url' do 
    DomainExtractor.('http://github.com/carbonfive/raygun').must_equal 'github'
  end

  it 'returns zombie-bites for the following url' do 
    DomainExtractor.('http://www.zombie-bites.com').must_equal 'zombie-bites'
  end

  it 'returns cnet for the following url' do 
    DomainExtractor.('https://www.cnet.com').must_equal 'cnet'
  end
end
