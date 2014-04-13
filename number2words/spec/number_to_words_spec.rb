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

    it 'should returns three for 4' do 
      NumberToWords.convert(4).should == 'four'
    end

    it 'should returns nine for 9' do 
      NumberToWords.convert(9).should == 'nine'
    end
  end

  context 'with two digits numbers' do 
    it 'should returns ten for 10' do 
      NumberToWords.convert(10).should == 'ten'
    end
    
    it 'should returns eleven for 11' do 
      NumberToWords.convert(11).should == 'eleven'
    end

    it 'should returns twelve for 12' do 
      NumberToWords.convert(12).should == 'twelve'
    end
    
    it 'should returns thirteen for 13' do 
      NumberToWords.convert(13).should == 'thirteen'
    end

    it 'should returns nineteen for 19' do 
      NumberToWords.convert(19).should == 'nineteen'
    end

    it 'should returns twenty for 20' do 
      NumberToWords.convert(20).should == 'twenty'
    end

    it 'should returns twenty one for 21' do 
      NumberToWords.convert(21).should == 'twenty one'
    end

    it 'should returns twenty two for 22' do 
      NumberToWords.convert(22).should == 'twenty two'
    end

    it 'should returns twenty three for 23' do 
      NumberToWords.convert(23).should == 'twenty three' 
    end

    it 'should returns twenty nine for 29' do 
      NumberToWords.convert(29).should == 'twenty nine'
    end

    it 'should returns thirty for 30' do 
      NumberToWords.convert(30).should == 'thirty'
    end

    it 'should returns thirty one for 31' do 
      NumberToWords.convert(31).should == 'thirty one'
    end

    it 'should returns thirty nine for 39' do 
      NumberToWords.convert(39).should == 'thirty nine'
    end


  end

end
