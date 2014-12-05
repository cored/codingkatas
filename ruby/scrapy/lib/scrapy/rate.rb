require_relative 'rate/dollar'
require_relative 'rate/euro'

module Scrapy
  module Rate
    extend self

    def call(rate_data)
      { dollar: Dollar.(rate_data.children[0].text),
        euro: Euro.(rate_data.children[1].text) }
    end
  end
end
