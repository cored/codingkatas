require 'minitest/autorun'

class Array 
  def after(element)
    if include?(element)
      idx = index(element)+1
      idx == size ? self[0] : self[idx]
    end
  end
end

describe Array do 
  before do 
    @sequence = %w|a b c|
  end

  it 'returns the following element' do 
    @sequence.after('a').must_equal 'b'
  end

  it 'loops around from back to front' do 
    @sequence.after('c').must_equal 'a'
  end

  it 'non member element return nil' do 
    @sequence.after('d').must_equal nil
  end
end

