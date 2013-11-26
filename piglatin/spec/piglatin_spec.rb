module PigLatin
  CONSONANTS = %|bcdfghjkl|

  def coerce
    array = self.split(//)
    result = array.dup
    array.each do |letter| 
      if consonant? letter
        result << result.shift
      end
    end
    return "#{result.join('')}ay"
  end

  private
  def consonant?(letter)
    CONSONANTS.include? letter
  end

end

describe PigLatin do 

  it 'returns appyhay with happy' do 
    "happy".extend(PigLatin).coerce.should == 'appyhay'
  end

  it 'returns uckday with duck' do 
    "duck".extend(PigLatin).coerce.should == 'uckday'
  end

  it 'returns oveglay with glove' do 
    "glove".extend(PigLatin).coerce.should == 'oveglay'
  end

end
