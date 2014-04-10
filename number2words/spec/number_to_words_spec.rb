require 'spec_helper' 

describe NumberToWords do 
  context 'with one digit number' do 
    it 'should returns one for 1' do 
      NumberToWords.convert(1).should == 'one'
    end

    it 'should returns two for 2' do 
      NumberToWords.convert(2).should == 'two'
    end

    it 'should returns three for 3' do 
      NumberToWords.convert(3).should == 'three'
    end
  end

  context 'with two digits numbers' do 
    it 'should returns twenty for 20' do 
      NumberToWords.convert(10).should == 'ten'
    end
    
    it 'should returns twenty one for 11' do 
      NumberToWords.convert(11).should == 'eleven'
    end
  end
end
