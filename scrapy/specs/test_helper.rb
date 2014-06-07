require 'minitest/autorun'
require_relative '../lib/scrapy'

class Child
  def initialize(child)
    @child = child
  end

  def text
    @child
  end
end

class RateData
  def children
    %w|RD$45.70 RD$59.90|.map { |child| Child.new(child) }
  end
end
