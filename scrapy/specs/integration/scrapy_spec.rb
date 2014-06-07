require_relative '../test_helper'

describe Scrapy do
  describe '#rate' do
    it 'returns euro and dollar exchange from El Caribe' do 
      Scrapy.rate.must_equal dollar: 43.26, euro: 59.93
    end
  end
end
