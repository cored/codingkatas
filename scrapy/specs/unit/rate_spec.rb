require_relative '../test_helper'

module Scrapy 
  describe Rate do 
    before do 
      @rate_data = RateData.new
    end

    describe '#to_h' do 
      it 'returns dollar and euro values' do 
        Rate.call(@rate_data).must_equal euro: 59.90, dollar: 45.70 
      end
    end
  end
end
