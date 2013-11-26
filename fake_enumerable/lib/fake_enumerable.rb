require "fake_enumerable/version"

module FakeEnumerable
end

class SortedList
  include FakeEnumerable

  def initialize
    @items ||= []
  end

  def << item
    @items << item
  end

  def map 
    yield 
  end
end
