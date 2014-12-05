module SubstringCount
  extend self

  def call(full_text, search_text)
    full_text.scan(search_text).size
  end

end

describe SubstringCount do
  describe '#count' do
    it 'returns the proper count for a substring consisting of an individual character' do
      expect(SubstringCount.('aaaa','a')).to eql 4
    end

    it 'returns the proper count for a substring of more than one character' do
      expect(SubstringCount.('aa_bb_cc_dd','aa')).to eql 1
    end

    it 'returns proper count for a longer string' do
      expect(SubstringCount.('aaabbbcccc', 'bbb')).to eql 1
    end
  end
end
