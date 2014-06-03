require 'minitest/autorun'
require 'nokogiri'
require 'open-uri'

class Scrapy
  URL = 'http://www.elcaribe.com.do'

  def initialize
    @page = Nokogiri::HTML(open(URL))
  end

  def rate
    Rate.for(@page.css('div.dolar span')).to_h
  end
end

class Rate 
  def self.for(data) 
    new(data.children)
  end

  def initialize(rate_data) 
    @dollar = Dollar.for(rate_data[0].text)
    @euro = Euro.for(rate_data[1].text)
  end

  def to_h 
    { euro: @euro, dollar: @dollar }
  end

  class Dollar 
    def self.for(dollar)
      dollar.split(/\$/)[1].to_f
    end
  end

  class Euro
    def self.for(euro) 
      euro.split(/\$/)[1].to_f
    end
  end
end

describe Scrapy do
  before do
    @scrapy = Scrapy.new
  end

  describe '#rate' do
    it 'returns the euro exchange rate' do
      @scrapy.rate.must_equal euro: 59.93, dollar: 43.26
    end
  end

end
