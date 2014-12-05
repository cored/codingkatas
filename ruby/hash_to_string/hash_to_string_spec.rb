require 'minitest/autorun'

module HashToString
  extend self 

  def call(hash, range)
    hash.sort_by { |item| item[1] }.map do |pair|
      "#{pair[0]} (#{pair[1]})" if range.include?(pair[1])
    end.compact.join(', ')
  end
end

describe HashToString do 
  before do 
    @food = {
      "Hamburger"=>1.99,
      "Cheese"=>0.99,
      "Steak"=>4.99,
      "Lobster"=>7.99,
      "Fries"=>1.49,
      "Sandwich"=>2.49
    }
  end

  it 'returns a formatted hash for a range' do 
    HashToString.(@food, (0.99..1.99)).must_equal "Cheese (0.99), Fries (1.49), Hamburger (1.99)"
    HashToString.({"Zero"=>0, "Three"=>3, "One"=>1, "Eleven"=>11}, (1..10)).must_equal "One (1), Three (3)"
  end

  it 'sort by the values instead of the keys' do 
    HashToString.({"Adam" => 23, "Harley" => 18}, (17..25)).must_equal "Harley (18), Adam (23)"
  end
end
