require 'mongoid'

module Db
  extend self 

  def load_db_config 
    Mongoid.load!('config/mongoid.yml')
  end

  class Exchange
    include Mongoid::Document

    field :euro,    type: BigDecimal 
    field :dollar,  type: BigDecimal

    def self.save_rate(rate)
      create!(euro: rate.fetch(:euro), dollar: rate.fetch(:dollar))
    end
  end
end
