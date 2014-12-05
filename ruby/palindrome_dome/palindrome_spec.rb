module Palindrome 
  extend self 

  def call(phrase) 
    phrase = phrase.downcase.split(/\W/).join.chars
    phrase.each do |c| 
      return false unless c == phrase.pop
    end
    true
  end

end

describe Palindrome do 
  context 'validates palindrome' do 
    it "returns true for 'Amore, Roma'"  do 
      expect(Palindrome.('Amore, Roma')).to eql true
    end

    it "returns true for 'A man, a plan, a canal: Panama'" do 
      expect(Palindrome.('A man, a plan, a canal: Panama')).to eql true
    end

    it "returns true for 'No 'x' in 'Nixon'" do 
      expect(Palindrome.("'No 'x' in 'Nixon'")).to eql true
    end

    it "returns false for 'Abba Zabba, you're my only friend'" do 
      expect(Palindrome.("'Abba Zabba, you're my only friend'")).to eql false
    end
  end
end
