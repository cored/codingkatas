module Choco
  class Feast

    def initialize(values)
      @amount_of_lines = values.shift.first
      @values = values
    end

    def chocolates_count
      result = []
      @values.each do |line|
        amount_chocolates = line[0]/line[1]
        amount_chocolates += (amount_chocolates%line[2])+1
      end
    end
  end

end
