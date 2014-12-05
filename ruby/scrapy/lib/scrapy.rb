require 'nokogiri'
require 'open-uri'

require_relative 'scrapy/rate'
require_relative 'scrapy/db/exchange'

module Scrapy
  URL = 'http://www.elcaribe.com.do'
  extend self

  def call
    Db.load_db_config
    Db::Exchange.save_rate(rate)
  end

  def rate 
    Rate.(page.css('div.dolar span'))
  end

  def page
    Nokogiri::HTML(open(URL))
  end
end
