module SortSentence
  def sort
    (normalized_words.select { |w| w if w =~ /^[a-z]/ }.sort + 
      normalized_words.select { |w| w if w =~ /^[A-Z]/ }.sort { |a,b| b <=> a }).join ' '
  end

  def normalized_words 
    @normalized_words ||= split.map { |word|  word.gsub(/\W+/, '') }
  end
end

describe SortSentence do
  describe '#sort' do 
    it 'removes any exclamation of all words in a sentence' do 
      expect('hello! world'.extend(SortSentence).sort).to eql "hello world"
    end

    it 'puts all the lowercase letter first ascending order' do 
      expect('Hello zoila alpha'.extend(SortSentence).sort).to eql 'alpha zoila Hello'
    end

    it 'puts all the uppercase after the lowercase in descending order' do 
      expect('Alpha Zoila hello'.extend(SortSentence).sort).to eql 'hello Zoila Alpha'
    end

    it 'returns a proper sorted sentence for' do 
      expect("I, habitan of the Alleghanies, treating of him as he is in himself in his own rights".
             extend(SortSentence).sort).to eql "as habitan he him himself his in in is of of own rights the treating I Alleghanies"
    end
  end
end
