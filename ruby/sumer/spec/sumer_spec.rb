module Sumer 
  extend self

  def call(*items)
    items.select { |item| item.respond_to? :to_i }.map(&:to_i).inject(:+)
  end
end

describe Sumer do 
  context '#call' do 
    it 'sums an arbitrary amount of numbers' do 
      expect(Sumer.(1,2,3)).to eql 6
    end

    it 'sums an arbitrary amount of numbers even if they are strings' do 
      expect(Sumer.(1,2,'3')).to eql 6
    end

    it 'sums an arbitrary amount of numbers even if they are strings' do 
      expect(Sumer.(1,2,'3',[])).to eql 6
    end
  end
end
