require 'minitest/autorun'
require 'nokogiri'
require 'open-uri'


class Scrapy
  URL = 'http://www.elcaribe.com.do'

  def initialize
    @page = Nokogiri::HTML(open(URL))
  end

  def rate
    rate = {}
    rate[:euro] = @page.css('div.dolar span').children[1].text.split(/\$/)[1].to_f
    rate[:dollar] = @page.css('div.dolar span').children[0].text.split(/\$/)[1].to_f
    rate
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
