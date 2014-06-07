module Scrapy 
  module Rate 
    module Euro
      extend self

      def call(euro) 
        euro.split(/\$/)[1].to_f
      end
    end
  end
end
