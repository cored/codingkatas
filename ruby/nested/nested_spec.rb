require 'minitest/autorun'

module Nested
  extend self

  def call(data, prev=[])
    prev = data.vales if data.is_a? Hash
    data.values.inject([]) do |items, ids|
      case ids 
      when Fixnum 
        items << ids
      when Array 
        items += ids.flat_map { |v| v[:id] }
      end
      items
    end
  end
end

describe Nested do
  it 'returns an empty hash for empty hash' do
    Nested.({}).must_equal []
  end

  it 'returns the ids for a given hash with just one level' do
    Nested.({id:1}).must_equal [1]
  end

  it 'returns the ids for a given hash with two level of indentation' do
    Nested.({id: 1, items: [{id: 2}]}).must_equal [1,2]
  end

  it 'returns the ids for a given hash with three level of indentation' do
    data = {
      id: 1,
      items: [
        {id: 2},
        {id: 3, items: [
          {id: 4},
          {id: 5}
        ]}
      ]
    }
    Nested.(data).must_equal [1,2,3,4,5]
  end
end
