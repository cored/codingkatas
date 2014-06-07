require_relative '../test_helper'

module Scrapy
  module Rate
    describe Dollar do 
      it 'returns a dollar value' do 
        Dollar.('RD$40.0').must_equal 40.0
      end
    end
  end
end
