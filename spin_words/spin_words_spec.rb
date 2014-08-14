module SpinWords 
  def spin 
    split(/\s/).map { |word|  word.size >= 5 ? word.reverse : word }.join(' ')
  end
end

describe SpinWords do 
  it 'returns same word for size less than five' do 
    expect("This".extend(SpinWords).spin).to eql "This"
  end

  it 'returns the reverse word for size greater or equal to five' do 
    expect("words".extend(SpinWords).spin).to eql "words".reverse
  end

  context 'phrases' do 
    it 'returns the same words for phrases smaller than 5' do 
      expect("This word".extend(SpinWords).spin).to eql "This word"
    end

    it 'returns the same the proper spin for "Hey fellow warriors"' do 
      expect("Hey fellow warriors".extend(SpinWords).spin).to eql "Hey wollef sroirraw"
    end
  end
end
