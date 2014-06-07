module Scrapy 
  module Rate 
    module Dollar 
      extend self 

      def call(dollar) 
        dollar.split(/\$/)[1].to_f
      end
    end
  end
end
