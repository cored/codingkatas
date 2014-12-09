require 'minitest/autorun'

module StringOfSorts
  extend self

  def call(str, ordering)
    res = ""
    ordering.chars.each do |ord| 
      res = str.chars.sort_by! do |chr| 
        ord <=> chr
      end.join.gsub!(/(^[^ord])/, "#{$'}#{$1}")
    end
    res
  end
end

describe StringOfSorts do
  it 'sort foos based on of' do
    StringOfSorts.('foos', 'of').must_equal 'oofs'
  end
end
