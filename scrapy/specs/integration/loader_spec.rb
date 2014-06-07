require_relative '../test_helper'

module Scrapy 
  describe Db::Exchange do 
    it 'loads an already saved dollar and euro exchange' do 
      Db.load_db_config
      exchange = Db::Exchange.save_rate(Rate.(RateData.new))

      exchange.euro.must_equal 59.90
      exchange.dollar.must_equal 45.70
    end
  end
end
