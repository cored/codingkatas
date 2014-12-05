module Calculator
  class Numbers
    def initialize(nums, delimiter)
      @nums = nums
      @delimiter = delimiter
    end

    def coerce
      require 'pry'; binding.pry  
      @nums.split(@delimiter).map(&:to_i)
    end

    def sum
      coerce.inject(0) { |sum, num| sum += num }
    end
  end

  def add
    Numbers.new(self, delimiter).sum
  end

  def delimiter
    if self.start_with? '//'
      self[2]
    else
      /,|\n/
    end
  end
end

describe Calculator, "#sum" do 

  context 'single numbers' do 
    it 'returns 0 with empty string' do 
      "".extend(Calculator).add.should == 0
    end

    it 'returns same number with a single number' do 
      "1".extend(Calculator).add.should == 1
    end
  end

  context 'two or more numbers separated by comma' do 
    it 'returns the sum of two numbers' do 
      "2,3".extend(Calculator).add.should == 5
    end
    it 'returns the sum of three numbers' do 
      "1,2,3".extend(Calculator).add.should == 6
    end

    it 'returns the sum of an unknown amount of numbers' do 
      "1,2,3,4,5".extend(Calculator).add.should == 15
    end
  end

  describe 'different delimiters' do 
    context 'using new line as delimiter' do 
      it 'returns the sum of two numbers' do 
        "1\n2".extend(Calculator).add.should == 3
      end

      it 'returns the sum of an unknown amount of numbers' do 
        "1\n2\n3\n4\n5".extend(Calculator).add.should == 15 
      end

      it 'returns the sum of numbers with mixed delimiters' do 
        "1\n2,3".extend(Calculator).add.should == 6
      end
    end

    context 'using optional delimiter' do 
      it 'returns the sum of two numbers' do 
        "//;\n1;2".extend(Calculator).add.should == 3
      end

      it 'returns the sum of an unknown amount of numbers' do 
        "//;\n1;2;3;4".extend(Calculator).add.should == 10
      end
    end
  end

end
