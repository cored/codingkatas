require_relative '../test_helper'

module Scrapy 
  module Rate 
    describe Euro do 
      it 'returns euro value' do 
        Euro.('RD$59.90').must_equal 59.90
      end
    end
  end
end
